//
//  PieChartInformation.h
//
//  Created by Vitor Venturin on 14/08/15.
//  Copyright (c) 2015 Vitor Venturin. All rights reserved.
//
//  http://github.com/vitorventurin

#import <UIKit/UIKit.h>

@interface PieChartItem : NSObject

@property (strong, nonatomic) NSString *itemTitle;
@property (assign, nonatomic) NSInteger amount;
@property (assign, nonatomic) CGFloat percentage;
@property (strong, nonatomic) UIColor *itemColor;

+ (instancetype)itemWithTitle:(NSString*)title amount:(NSInteger)amount percentage:(CGFloat)percentage itemColor:(UIColor *)itemColor;

@end
