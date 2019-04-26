//
//  BHViewController.m
//  BHPopoverBackground
//
//  Created by XB-Paul on 04/24/2019.
//  Copyright (c) 2019 XB-Paul. All rights reserved.
//

#import "BHViewController.h"
#import "BubbleContentViewController.h"
#import <BHPopoverBackground/BHPopoverBackgroundView.h>

@interface BHViewController ()<UIPopoverPresentationControllerDelegate>
@property (strong,nonatomic)UIPopoverPresentationController *popoverPresentVC;//声明模态弹出窗控制器
@property (strong,nonatomic)BubbleContentViewController *contentVC; //声明内容控制器
@end

@implementation BHViewController {
    BOOL _isOpenPop;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button4 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button4.frame = CGRectMake(300, 250, 100, 44.0);
    [button4 setTitle:@"显示弹出框" forState:(UIControlStateNormal)];
    [button4 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button4];
    [button4 addTarget:self action:@selector(button4Action:) forControlEvents:(UIControlEventTouchUpInside)];
}


- (void)button4Action:(UIButton *)btn {
    //设置内容控制器模态显示类型为模态弹出窗
    self.contentVC.modalPresentationStyle = UIModalPresentationPopover;
    
    //创建popoverPresentVC模态弹出窗控制器,包装内容控制器
    self.popoverPresentVC = self.contentVC.popoverPresentationController;
    self.popoverPresentVC.delegate = self;
    //设置一直显示后,即使点击按钮，此时弹窗也关闭不了,所以不这么设置
    //[self.popoverPresentVC setPassthroughViews:@[self.view,sender]];
    
    //设置模态弹窗的显示区域
    self.popoverPresentVC.sourceView = btn;
    self.popoverPresentVC.sourceRect = btn.bounds;
    
    self.popoverPresentVC.popoverBackgroundViewClass = [BHPopoverBackgroundView class];
    //设置箭头方向自适应
    //        self.popoverPresentVC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    //        self.popoverPresentVC.backgroundColor = [UIColor blackColor];
    //打开模态窗口
    [self presentViewController:self.contentVC animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}
#pragma mark-
#pragma mark- Private Methods

#pragma mark-
#pragma mark- Getters && Setters
- (BubbleContentViewController *)contentVC {
    if (_contentVC == nil) {
        //创建内容控制器
        _contentVC = [[BubbleContentViewController alloc]init];
    }
    return _contentVC;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
