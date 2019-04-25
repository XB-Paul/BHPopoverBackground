//
//  BubbleContentViewController.m
//  BHPopoverBackground_Example
//
//  Created by 詹学宝 on 2019/4/24.
//  Copyright © 2019 仰望星空，让泪水倒流. All rights reserved.
//

#import "BubbleContentViewController.h"

@interface BubbleContentViewController ()

@end

@implementation BubbleContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置内容区域大小
    self.preferredContentSize = CGSizeMake(100, 200);
    
    //设置内容背景颜色
    //    self.view.backgroundColor = [UIColor clearColor];
    //    self.view.backgroundColor = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:78/255.0 alpha:1];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.frame = CGRectMake(10, 20, 100, 44.f);
    //    button.center = CGPointMake(self.view.center.x, 120);
    [button setTitle:@"显示弹出框1" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
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
