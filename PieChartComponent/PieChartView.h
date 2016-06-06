//
//  PieChartView.h
//
//  Created by Vitor Venturin on 14/08/15.
//  Copyright (c) 2015 Vitor Venturin. All rights reserved.
//
//  http://github.com/vitorventurin

#import <UIKit/UIKit.h>

@class PieChartItem;

@interface PieChartView : UIView

@property(strong, nonatomic) NSMutableArray *items;
@property(assign, nonatomic) NSInteger selectedItemIndex;
@property(assign, nonatomic) CGFloat animationDuration;

- (PieChartItem *)selectedItem;

@end
