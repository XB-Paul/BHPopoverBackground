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
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button1.frame = CGRectMake(10, 70, 100, 44.0);
    [button1 setTitle:@"显示弹出框1" forState:(UIControlStateNormal)];
    [button1 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(pressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *button2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button2.frame = CGRectMake(300, 70, 100, 44.0);
    [button2 setTitle:@"显示弹出框2" forState:(UIControlStateNormal)];
    [button2 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(pressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *button3 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button3.frame = CGRectMake(10, 350, 100, 44.0);
    [button3 setTitle:@"显示弹出框3" forState:(UIControlStateNormal)];
    [button3 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button3];
    [button3 addTarget:self action:@selector(pressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *button4 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button4.frame = CGRectMake(300, 350, 100, 44.0);
    [button4 setTitle:@"显示弹出框4" forState:(UIControlStateNormal)];
    [button4 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button4];
    [button4 addTarget:self action:@selector(pressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *button5 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button5.frame = CGRectMake(10, 600, 100, 44.0);
    [button5 setTitle:@"显示弹出框5" forState:(UIControlStateNormal)];
    [button5 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button5.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button5];
    [button5 addTarget:self action:@selector(pressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *button6 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button6.frame = CGRectMake(300, 600, 100, 44.0);
    [button6 setTitle:@"显示弹出框6" forState:(UIControlStateNormal)];
    [button6 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    button6.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button6];
    [button6 addTarget:self action:@selector(pressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"Done" forState:UIControlStateNormal];
    [btn setTitleColor:self.navigationController.navigationBar.tintColor forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(pressButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(pressButtonAction:)];
    
    self.navigationItem.rightBarButtonItems = @[doneItem,editItem];
}

- (void)pressButtonAction:(id)sender {
    //设置内容控制器模态显示类型为模态弹出窗
    self.contentVC.modalPresentationStyle = UIModalPresentationPopover;
    
    //创建popoverPresentVC模态弹出窗控制器,包装内容控制器
    self.popoverPresentVC = self.contentVC.popoverPresentationController;
    self.popoverPresentVC.delegate = self;
    //设置一直显示后,即使点击按钮，此时弹窗也关闭不了,所以不这么设置
    //[self.popoverPresentVC setPassthroughViews:@[self.view,sender]];
    
    //设置模态弹窗的显示区域
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        self.popoverPresentVC.barButtonItem = (UIBarButtonItem *)sender;
    }else if ([sender isKindOfClass:[UIView class]]) {
        self.popoverPresentVC.sourceView = sender;
        self.popoverPresentVC.sourceRect = [(UIView *)sender bounds];
    }

    
    self.popoverPresentVC.popoverBackgroundViewClass = [BHPopoverBackgroundView class];
    //设置箭头方向自适应
    self.popoverPresentVC.permittedArrowDirections = UIPopoverArrowDirectionAny;
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
