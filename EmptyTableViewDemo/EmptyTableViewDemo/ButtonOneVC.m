






//
//  ButtonOneVC.m
//  EmptyTableViewDemo
//
//  Created by 刘松 on 16/8/29.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "ButtonOneVC.h"
#import "LSStretchableTableHeaderView.h"

@interface ButtonOneVC ()
@property(nonatomic,strong) LSStretchableTableHeaderView *strechView;
@end

@implementation ButtonOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView=[[UIView alloc]init];
    
    
    UIImageView *view=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header"]];
    view.frame=CGRectMake(0, 0, self.view.frame.size.width, 100);
    LSStretchableTableHeaderView *strechView=[LSStretchableTableHeaderView stretchHeaderForTableView:self.tableView headerView:nil withView:view];
    self.strechView =strechView;
    

}



@end
