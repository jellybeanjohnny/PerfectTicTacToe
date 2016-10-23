//
//  main.m
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/17/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Game *game = [[Game alloc] init];
    
    [game play];
    
  }
  return 0;
}
