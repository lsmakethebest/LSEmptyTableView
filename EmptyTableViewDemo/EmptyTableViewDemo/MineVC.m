

//
//  ButtonFourVC.m
//  EmptyTableViewDemo
//
//  Created by 刘松 on 16/8/29.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "MineVC.h"
#import "LSStretchableTableHeaderView.h"
@interface MineVC ()

@property(nonatomic,strong) LSStretchableTableHeaderView *strechView;
@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"我的界面常用下拉效果";
    self.tableView.tableFooterView=[[UIView alloc]init];
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor colorWithRed:0.000 green:0.475 blue:0.765 alpha:1.000];
    view.frame=CGRectMake(0, 0, self.view.frame.size.width, 100);
    UIView *v=[[UIView alloc]initWithFrame:view.frame];
    UIButton *btn=[[UIButton alloc]init];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor colorWithRed:0.699 green:1.000 blue:0.927 alpha:1.000];
    btn.layer.borderColor=[UIColor redColor].CGColor;
    btn.layer.borderWidth=1;
    btn.frame=CGRectMake(50, 20, 50, 30);
    [v addSubview:btn];
    LSStretchableTableHeaderView *strechView=[LSStretchableTableHeaderView stretchHeaderForTableView:self.tableView headerView:v withView:view];
    self.strechView =strechView;
    
    
}
@end
