



//
//  ButtonTwoVC.m
//  EmptyTableViewDemo
//
//  Created by 刘松 on 16/8/29.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "ButtonTwoVC.h"

@interface ButtonTwoVC ()

@end

@implementation ButtonTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    
    self.tableView.startTip = YES;
    self.tableView.tipTitle = @"无新内容";
    //可以不设置 默认图片为nomessage 可以到分类中修改默认图片名
    self.tableView.tipImage=[UIImage imageNamed:@"nomessage"];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
