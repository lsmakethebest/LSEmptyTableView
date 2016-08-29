//
//  StretchableTableHeaderView.h
//  StretchableTableHeaderView
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LSStretchableTableHeaderView : NSObject

/**
 *
 *
 *  @param tableView  
 *  @param headerView 就是正常显示的内容 可为nil 当两个值都传时 两个view 高度应该相等
 *  @param view       用于放大图片或者拉伸用于普通的tableView顶部可拉伸效果（处于headerView底下）
 */
+(instancetype)stretchHeaderForTableView:(UITableView *)tableView
                       headerView:(UIView *)headerView
                         withView:(UIView *)view;

@end
