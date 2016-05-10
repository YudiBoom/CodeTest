//
//  ViewController.m
//  AnimationTest
//
//  Created by 乐校 on 16/5/3.
//  Copyright © 2016年 lexiao. All rights reserved.

//test2 提交测试
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#import "ViewController.h"
#import "LewBarChart.h"
#import "MacroDefinition.h"

@interface ViewController ()

@property (nonatomic, strong) LewBarChart *barChart;
@property (nonatomic, strong) UIButton *navButton;
@property (nonatomic, strong) UIView *navView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigationbar];
    [self createNavTitle];
    [self setupBarChart];
    
}

- (void)createNavTitle {
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
    self.navView.backgroundColor = [UIColor clearColor];
    self.navButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
    [self.navButton setTitle:@"05-04" forState:UIControlStateNormal];
    [self.navButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.navButton addTarget:self action:@selector(navButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.navButton];
    
    
    
    self.navigationItem.titleView = self.navView;
}

- (void)customNavigationbar {
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = BLUE_22C4FF;
    self.backView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.backView.layer.shadowOpacity = 0.5;
    self.backView.layer.shadowOffset = CGSizeMake(0, -5);
    
    self.barShadow.layer.shadowColor = [UIColor blackColor].CGColor;
    self.barShadow.layer.shadowOpacity = 0.5;
    self.barShadow.layer.shadowOffset = CGSizeMake(0, 8);
    
    UIBarButtonItem *setingItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(setingItemEvent:)];
    self.navigationItem.rightBarButtonItem = setingItem;
    
}

- (void)setingItemEvent:(UIBarButtonItem *)btn {
    
}

- (void)navButtonEvent:(UIButton *)button {
    if (self.backView.frame.origin.y == 0) {
        [UIView animateWithDuration:0.6 animations:^{
            CGPoint point = self.backView.center;
            self.backView.center = CGPointMake(point.x, point.y + 47);
        }];
    }else {
        [UIView animateWithDuration:0.6 animations:^{
            CGPoint point = self.backView.center;
            self.backView.center = CGPointMake(point.x, point.y - 47);
        }];
        
    }
    
}

- (void)setupBarChart {
    self.barChart = [[LewBarChart alloc]initWithFrame:CGRectMake(60, 0, 300, 169)];
    NSMutableArray *valueArr = [NSMutableArray arrayWithArray:@[@(400), @(360), @(200), @(20)]];
    
    LewBarChartDataSet *set = [[LewBarChartDataSet alloc]initWithYValues:valueArr label:@"数量"];
    
    /*
    [set setBarColor:[UIColor redColor]];//设置柱子颜色
    [set setBarbackGroudColor:[UIColor yellowColor]];//设置柱子背景颜色
    */
     
    NSMutableArray *dataSets = [NSMutableArray array];
    [dataSets addObject:set];
    
    LewBarChartData *data = [[LewBarChartData alloc]initWithDataSets:dataSets];
    data.xLabels = @[@"已发送", @"已收到", @"已拒收", @"发送失败"];
    data.groupSpace = 60;//设置柱子宽窄
    self.barChart.data = data;
    self.barChart.displayAnimated = YES;
    self.barChart.chartMargin = UIEdgeInsetsMake(20, 15, 45, 15);
    self.barChart.showYAxis = NO;
    self.barChart.showNumber = YES;
    self.barChart.legendView.alignment = LegendAlignmentHorizontal;
    
    [self.biaoView addSubview:self.barChart];
    [self.barChart show];
    
    CGPoint legendCenter = CGPointMake(SCREEN_WIDTH - self.barChart.legendView.bounds.size.width / 2, -18);
    self.barChart.legendView.center = legendCenter;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
