//
//  ViewController.m
//
//  Created by Vitor Venturin on 14/08/15.
//  Copyright (c) 2015 Vitor Venturin. All rights reserved.
//
//  http://github.com/vitorventurin

#import "ViewController.h"
#import "PieChartView.h"
#import "PieChartItem.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet PieChartView *pieChartView;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (strong, nonatomic) NSTimer *updateTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setup PieChart
    self.pieChartView.items = [self setupTestData];
    self.pieChartView.animationDuration = 0.3;
    
    [self setupButtons];
    
    [self resetTimer];
    
    [self updatedViewForSelectedIndex:0];
}

- (void)updateToNextItem {
    PieChartItem *currentlySelectedItem = self.pieChartView.selectedItem;
    NSInteger currentlySelectedItemIndex = [self.pieChartView.items indexOfObject:currentlySelectedItem];
    if (currentlySelectedItemIndex != NSNotFound) {
        currentlySelectedItemIndex++;
    }
    if (currentlySelectedItemIndex >= self.pieChartView.items.count) {
        currentlySelectedItemIndex = 0;
    }
    
    //Update the currently selected item index
    self.pieChartView.selectedItemIndex = currentlySelectedItemIndex;
    
    [self updatedViewForSelectedIndex:currentlySelectedItemIndex];
}

- (void)resetTimer {
    if ([self.updateTimer isValid]) {
        [self.updateTimer invalidate];
    }
    
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(updateToNextItem) userInfo:nil repeats:YES];
}

- (void)setupButtons {
    for (UIButton *button in self.buttons) {
        
        PieChartItem *associatedItem = self.pieChartView.items[button.tag];
        [button setTitleColor:associatedItem.itemColor forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
}

- (NSMutableArray*)setupTestData {
    return [@[
             [PieChartItem itemWithTitle:@"Main" amount:5000 percentage:0.45 itemColor:[UIColor colorWithRed:139.0/255.0 green:210.0/255.0 blue:228.0/255.0 alpha:1.0]],
             [PieChartItem itemWithTitle:@"Rainy Day" amount:1500 percentage:0.25 itemColor:[UIColor colorWithRed:76.0/255.0 green:151.0/255.0 blue:180.0/255.0 alpha:1.0]],
             [PieChartItem itemWithTitle:@"Wedding" amount:10000 percentage:0.1 itemColor:[UIColor colorWithRed:39.0/255.0 green:93.0/255.0 blue:116.0/255.0 alpha:1.0]],
             [PieChartItem itemWithTitle:@"Other" amount:3000 percentage:0.2 itemColor:[UIColor colorWithRed:26.0/255.0 green:62.0/255.0 blue:78.0/255.0 alpha:1.0]]
             ] mutableCopy];
}

#pragma mark - Actions

- (IBAction)updateSelectedItem:(id)sender {
    UIButton *selectedButton = (UIButton *)sender;
    
    NSInteger selectedIndex = selectedButton.tag;
    
    //Update the currently selected item
    self.pieChartView.selectedItemIndex = selectedIndex;
    
    //Update the associated button
    [self updatedViewForSelectedIndex:selectedIndex];
    
    [self resetTimer];
}

- (void)updatedViewForSelectedIndex:(NSInteger)selectedIndex {
    for (UIButton *button in self.buttons) {
        BOOL isSelected = (button.tag == selectedIndex);
        button.selected = isSelected;
        
        PieChartItem *associatedItem = self.pieChartView.items[button.tag];
        UIColor *backgroundColor = isSelected ? associatedItem.itemColor : [UIColor clearColor];
        [button setBackgroundColor:backgroundColor];
    }
    
    self.percentLabel.text = [NSString stringWithFormat:@"Percentage: %.2f%%", (self.pieChartView.selectedItem.percentage * 100)];
}

@end
