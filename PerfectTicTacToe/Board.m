//
//  Board.m
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/17/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import "Board.h"

static const NSInteger kBoardSize = 3;

@interface Board () 
{
  TicTacToeToken _board[kBoardSize][kBoardSize];
}

@property (nonatomic, assign) NSInteger remainingSpaces;

@end

@implementation Board

#pragma mark - Setup

- (instancetype)init
{
  if (!(self = [super init])) {
    return nil;
  }
  
  // populate the board with empty spaces
  generateBoard(_board);
  _remainingSpaces = 9;
  
  return self;
}

/// Generates an empty board filled with the TicTacToeTokenEmpty enum value
void generateBoard(TicTacToeToken board[kBoardSize][kBoardSize]) {
  for (NSInteger row = 0; row < kBoardSize; row++) {
    for (NSInteger column = 0; column < kBoardSize; column++) {
      board[row][column] = TicTacToeTokenEmpty;
    }
  }
}

/// Prints the current state of the board
- (void)printBoard
{
  for (NSInteger row = 0; row < kBoardSize; row++) {
    for (NSInteger column = 0; column < kBoardSize; column++) {
      printf(" %c ", _board[row][column]);
    }
    printf("\n");
  }
  printf("\n");
}

#pragma mark - Placing tokens

- (void)placeToken:(TicTacToeToken)token atRow:(NSInteger)row column:(NSInteger)column
{
  if ([self _canPlaceTokenAtRow:row column:column]) {
    _board[row][column] = token;
    self.remainingSpaces =- 1;
  } else {
    NSLog(@"Unable to place token at (row: %lu, column: %lu)", row, column);
  }
}

- (BOOL)_canPlaceTokenAtRow:(NSInteger)row column:(NSInteger)column
{
  return _board[row][column] == TicTacToeTokenEmpty;
}

- (TicTacToeToken)tokenForRow:(NSInteger)row column:(NSInteger)column
{
  return _board[row][column];
}

#pragma mark - Checking wins

- (BOOL)winForToken:(TicTacToeToken)token
{
  NSAssert(token != TicTacToeTokenEmpty, @"Invalid token type. Must be either X or O");
  
  // row
  for (NSUInteger row = 0; row < kBoardSize; row++) {
    if (_board[row][0] == token && _board[row][1] == token && _board[row][2] == token) {
      return YES;
    }
  }
  
  // column
  for (NSUInteger column = 0; column < kBoardSize; column++) {
    if (_board[0][column] == token && _board[1][column] == token && _board[2][column] == token) {
      return YES;
    }
  }
  
  // diagnals
  if (_board[1][1] == token) {
    if (_board[0][0] == token && _board[2][2] == token) {
      return YES;
    }
    if (_board[0][2] == token && _board[2][0] == token) {
      return YES;
    }
  }
  
  return NO;
}

- (BOOL)hasWinner
{
  return self.remainingSpaces == 0 || [self winForToken:TicTacToeTokenX] || [self winForToken:TicTacToeTokenO];
}

/// Returns an array of available moves
- (NSArray *)availableMoves
{
  NSMutableArray *moves = [[NSMutableArray alloc] init];
  
  for (NSUInteger row = 0; row < kBoardSize; row++) {
    for (NSUInteger column = 0; column < kBoardSize; column++) {
      if (_board[row][column] == TicTacToeTokenEmpty) {
        [moves addObject:[NSValue valueWithPoint:CGPointMake(row, column)]];
      }
    }
  }
  return [moves copy];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
  id copy = [[Board alloc] init];
  
  if (copy) {
    for (NSUInteger row = 0; row < kBoardSize; row++) {
      for (NSUInteger column = 0; column < kBoardSize; column++) {
        
        TicTacToeToken token = _board[row][column];
        
        [copy placeToken:token atRow:row column:column];
      }
    }
  }
  return copy;
}



@end
