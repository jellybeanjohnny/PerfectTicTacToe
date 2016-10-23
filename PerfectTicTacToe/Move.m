//
//  Move.m
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/22/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import "Move.h"

@implementation Move

- (instancetype)initWithRow:(NSInteger)row column:(NSInteger)column score:(NSInteger)score
{
  if (!(self = [super init])) {
    return nil;
  }
  
  _row = row;
  _column = column;
  _score = score;
  
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"\nRow: %li\nColumn: %li\nScore: %li", self.row, self.column, self.score];
}

@end
