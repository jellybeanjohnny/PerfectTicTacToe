//
//  main.m
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/17/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Board *board1 = [[Board alloc] init];
    [board1 placeToken:TicTacToeTokenO atRow:0 column:0];
    NSLog(@"Original");
    [board1 printBoard];
    
    
    Board *board2 = [board1 copy];
    [board2 placeToken:TicTacToeTokenO atRow:0 column:1];
    NSLog(@"Copy");
    [board2 printBoard];
    NSLog(@"Original");
    [board1 printBoard];
    
  }
    return 0;
}
