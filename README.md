# LSEmptyTableView
两行代码实现当tableview无内容时自动显示提示语，一键设置断网提示，头部可拉伸放大图片等功能
#开启无cell提示语当reloadata时会自动判断是否返回cell

  	self.tableView.startTip = YES;
    self.tableView.tipTitle = @"无新内容";
    //可以不设置 默认图片为nomessage 可以到分类中修改默认图片名
    self.tableView.tipImage=[UIImage imageNamed:@"nomessage"];
    
   ![image](https://github.com/lsmakethebest/LSEmptyTableView/blob/master/images/nocell.jpg)
    
#开启提示同时设置网络不好提示(仅在无cell而且网络不好时提示) 

	self.tableView.startTip = YES;
    self.tableView.tipTitle = @"无新内容";    
    typeof(self) weakSelf=self;
    self.tableView.retryBlock=^(){
        [weakSelf.tableView.mj_header beginRefreshing];
        
    };
![image](https://github.com/lsmakethebest/LSEmptyTableView/blob/master/images/badNetWork.gif)
判断数据源数组是否为空，当网络不好时设置 self.tableView.badNetwork=YES;
每次relodata会自动设置为NO

#头部可拉伸imageView
    UIImageView *view=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header"]];
    view.frame=CGRectMake(0, 0, self.view.frame.size.width, 100);
    LSStretchableTableHeaderView *strechView=[LSStretchableTableHeaderView stretchHeaderForTableView:self.tableView headerView:nil withView:view];
    self.strechView =strechView;

![image](https://github.com/lsmakethebest/LSEmptyTableView/blob/master/images/strechHeader.gif)
#头部背景纯色 上方有控件在上面悬浮

    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor colorWithRed:0.000 green:0.475 blue:0.765 alpha:1.000];
    view.frame=CGRectMake(0, 0, 	self.view.frame.size.width, 100);
  
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
![image](https://github.com/lsmakethebest/LSEmptyTableView/blob/master/images/suspension.gif)