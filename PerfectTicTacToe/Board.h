//
//  Board.h
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/17/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(char, TicTacToeToken) {
  TicTacToeTokenX = 'X',
  TicTacToeTokenO = 'O',
  TicTacToeTokenEmpty = '-'
};

@interface Board : NSObject <NSCopying>


- (void)placeToken:(TicTacToeToken)token atRow:(NSInteger)row column:(NSInteger)column;
- (TicTacToeToken)tokenForRow:(NSInteger)row column:(NSInteger)column;

- (void)printBoard;

@end
