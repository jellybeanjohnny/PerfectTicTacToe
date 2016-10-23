//
//  Move.h
//  PerfectTicTacToe
//
//  Created by Matt Amerige on 10/22/16.
//  Copyright © 2016 BuildThings. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Move : NSObject

@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) NSInteger score;

- (instancetype)initWithRow:(NSInteger)row column:(NSInteger)column score:(NSInteger)score;

@end
