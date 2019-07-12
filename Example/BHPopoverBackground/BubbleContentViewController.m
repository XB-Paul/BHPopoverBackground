//
//  BubbleContentViewController.m
//  BHPopoverBackground_Example
//
//  Created by 詹学宝 on 2019/4/24.
//  Copyright © 2019 仰望星空，让泪水倒流. All rights reserved.
//

#import "BubbleContentViewController.h"

@interface BubbleContentViewController ()<UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation BubbleContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置内容区域大小
    self.preferredContentSize = CGSizeMake(150, 120);
    
    //设置内容背景颜色
        self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:78/255.0 alpha:1];
    
//    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
//    button.frame = CGRectMake(0, 0, 80, 40.f);
//    //    button.center = CGPointMake(self.view.center.x, 120);
//    [button setTitle:@"框内按钮"
//            forState:(UIControlStateNormal)];
//    [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
//    button.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:button];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weioryweiorywr" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"row : %li",(long)indexPath.row];
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"weioryweiorywr"];
    }
    return _tableView;
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
