//
//  PieChartInformation.m
//
//  Created by Vitor Venturin on 14/08/15.
//  Copyright (c) 2015 Vitor Venturin. All rights reserved.
//
//  http://github.com/vitorventurin

#import "PieChartItem.h"

@implementation PieChartItem

+ (instancetype)itemWithTitle:(NSString*)title amount:(NSInteger)amount percentage:(CGFloat)percentage itemColor:(UIColor *)itemColor {
    PieChartItem* item = [[PieChartItem alloc] init];
    item.itemTitle = title;
    item.amount = amount;
    item.percentage = percentage;
    item.itemColor = itemColor;
    return item;
}

@end
