//
//  PerfectPlayer.h
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/21/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@class Move;

@interface PerfectPlayer : NSObject

- (instancetype)initWithToken:(TicTacToeToken)token;
- (Move *)nextMoveForBoard:(Board *)board;

@end
