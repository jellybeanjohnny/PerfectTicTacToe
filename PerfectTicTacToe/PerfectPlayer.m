//
//  PerfectPlayer.m
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/21/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import "PerfectPlayer.h"
#import "Move.h"

@interface PerfectPlayer ()

@property (nonatomic, assign) TicTacToeToken player;
@property (nonatomic, assign) TicTacToeToken opponent;

@end

@implementation PerfectPlayer

- (instancetype)initWithToken:(TicTacToeToken)token
{
  if (!(self = [super init])) {
    return nil;
  }
  
  _player = token;
  _opponent = opponentToken(token);
  
  return self;
}

TicTacToeToken opponentToken(TicTacToeToken playerToken) {
  
  assert(playerToken != TicTacToeTokenEmpty);
  
  if (playerToken == TicTacToeTokenX) {
    return TicTacToeTokenO;
  } else {
    return TicTacToeTokenX;
  }
}


- (Move *)nextMoveForBoard:(Board *)board
{
  return [self minimax:board player:self.player];
}

- (NSInteger)scoreForBoard:(Board *)board
{
  if ([board winForToken:self.player]) {
    return 10;
  } else if ([board winForToken:self.opponent]) {
    return -10;
  } else {
    return 0;
  }
}

- (Move *)minimax:(Board *)board player:(TicTacToeToken)player
{
  NSArray *possibleMoves = board.availableMoves;
  
  NSInteger currentScore;
  Move *bestMove = [[Move alloc] init];
  bestMove.score = player == self.player ? LONG_MIN : LONG_MAX;
  
  if (board.hasWinner) {
    bestMove.score = [self scoreForBoard:board];
  } else {
    
    for (NSValue *value in possibleMoves) {
      // try this move for the current player and board
      CGPoint move = value.pointValue;
      
      Board *nextBoard = [board copy];
      
      [nextBoard placeToken:player atRow:move.x column:move.y];
      if (player == self.player) {
        // maximize
        currentScore = [self minimax:nextBoard player:self.opponent].score;
        if (currentScore > bestMove.score) {
          bestMove.row = move.x;
          bestMove.column = move.y;
          bestMove.score = currentScore;
        }
      } else {
        // minimize
        currentScore = [self minimax:nextBoard player:self.player].score;
        if (currentScore < bestMove.score) {
          bestMove.row = move.x;
          bestMove.column = move.y;
          bestMove.score = currentScore;
        }
      }
    }
  }

  return bestMove;
}



@end
