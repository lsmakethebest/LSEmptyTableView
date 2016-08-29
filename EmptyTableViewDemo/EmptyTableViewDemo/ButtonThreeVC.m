

//
//  ButtonThreeVC.m
//  EmptyTableViewDemo
//
//  Created by 刘松 on 16/8/29.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "ButtonThreeVC.h"

@interface ButtonThreeVC ()
@property(nonatomic, strong) NSMutableArray *datas;
@end

@implementation ButtonThreeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MJRefreshNormalHeader *header= [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    self.tableView.mj_header=header;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.startTip = YES;
    self.tableView.tipTitle = @"无新内容";
    typeof(self) weakSelf=self;
    self.tableView.retryBlock=^(){
        [weakSelf.tableView.mj_header beginRefreshing];
        
    };
    
    self.datas=[NSMutableArray array];

    
}
-(void)refresh
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        static BOOL v=YES;
        [self.tableView.mj_header endRefreshing];
        if (!v) {
            for (int i=0; i<17; i++) {
                [self.datas addObject:@1];
            }
        }else{
            [self.datas removeAllObjects];
        }
        v=!v;
        if (self.datas.count==0) {
            self.tableView.badNetwork=YES;
        }else{
            [self.tableView reloadData];
        }
    });
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text=@"fdsfdkfhkfdsk";

    return cell;
    
}


@end
