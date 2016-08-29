//
//  UITableView+LSEmpty.h
//  自定义tableview
//
//  Created by 刘松 on 16/5/20.
//  Copyright © 2016年 kuaicheng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^RetryBlock)();
@interface UITableView (LSEmpty)

//开启无内容提示
@property (nonatomic,assign) BOOL startTip;
//无网时设置为YES 显示重新加载按钮
@property (nonatomic,assign) BOOL badNetwork;
//无内容提示语
@property (nonatomic,copy) NSString *tipTitle;
//无内容提示图片
@property(nonatomic,strong) UIImage *tipImage;


@property(nonatomic, weak) UIView *tipView;
@property(nonatomic, weak) UILabel *tipLabel;
@property (nonatomic,weak) UILabel *badNetworkLabel;
@property(nonatomic, weak) UIImageView *tipImageView;

@property (nonatomic,weak) UIButton *retryButton;

@property (nonatomic,copy) NSString *tempTitle;
@property (nonatomic,copy) RetryBlock retryBlock;
@property (nonatomic,assign) BOOL isFirstReloadData;

@end
