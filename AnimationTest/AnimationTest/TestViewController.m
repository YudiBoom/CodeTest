//
//  TestViewController.m
//  AnimationTest
//
//  Created by 乐校 on 16/5/5.
//  Copyright © 2016年 lexiao. All rights reserved.
//

#import "TestViewController.h"
#import <UIView+SDAutoLayout.h>

@interface TestViewController ()
{
    CGFloat _heightRatio;
}


@property (nonatomic, weak) UIView *backgroundView;
@property (nonatomic, weak) UIView *barView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _heightRatio = 0.05;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createView];
    
    
    
}

- (void)createView {
    UIView *view0 = [UIView new];
    view0.backgroundColor = [UIColor lightGrayColor];
    self.backgroundView = view0;
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor colorWithRed:80 / 255.0 green:134 / 255.0 blue:248 / 255.0 alpha:1];
    self.barView = view1;
    [self.view sd_addSubviews:@[view0, view1]];
    
    self.backgroundView.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(self.view, 10).heightIs(200).rightSpaceToView(self.view, 10);
    self.barView.sd_layout.bottomEqualToView(self.backgroundView).centerXEqualToView(self.backgroundView).widthRatioToView(self.backgroundView, 0.1).heightRatioToView(self.backgroundView, _heightRatio);
    self.barView.layer.shadowOpacity = 0.4;
    self.barView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.barView.layer.shadowOffset = CGSizeMake(5, -2);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_heightRatio == 0.05) {
        _heightRatio = 0.9;
    }else{
        _heightRatio = 0.05;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.barView.sd_layout.heightRatioToView(self.backgroundView, _heightRatio);
        [self.barView updateLayout];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
