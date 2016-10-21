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
