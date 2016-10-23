//
//  Game.m
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/21/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import "Game.h"
#import "Board.h"
#import "PerfectPlayer.h"
#import "Move.h"

@interface Game ()

@property (nonatomic, assign) TicTacToeToken player;
@property (nonatomic, assign) TicTacToeToken opponent;

@end

@implementation Game

- (void)play
{
  Board *board = [[Board alloc] init];
  
  self.player = TicTacToeTokenX;
  self.opponent = TicTacToeTokenO;

  
  
  
}




@end
