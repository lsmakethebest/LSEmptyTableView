//
//  StretchableTableHeaderView.m
//  StretchableTableHeaderView
//

#import "LSStretchableTableHeaderView.h"
#import <UIKit/UIKit.h>
@interface LSStretchableTableHeaderView ()

@property(nonatomic, assign) CGFloat defaultViewHeight;
@property(nonatomic, assign) CGRect initialFrame;

@property(nonatomic, weak) UITableView *tableView;
@property(nonatomic, weak) UIView *view;

@end

@implementation LSStretchableTableHeaderView

+ (instancetype)stretchHeaderForTableView:(UITableView *)tableView
                               headerView:(UIView *)headerView
                                 withView:(UIView *)view {

  LSStretchableTableHeaderView *stretchableTableHeaderView =
      [[LSStretchableTableHeaderView alloc] init];
  stretchableTableHeaderView.tableView = tableView;
  stretchableTableHeaderView.view = view;
  view.contentMode = UIViewContentModeScaleAspectFill;
  view.clipsToBounds = YES;
  stretchableTableHeaderView.initialFrame = view.frame;
  stretchableTableHeaderView.defaultViewHeight =
      stretchableTableHeaderView.initialFrame.size.height;

  UIView *emptyTableHeaderView = headerView;
  if (emptyTableHeaderView == nil) {
    emptyTableHeaderView =
        [[UIView alloc] initWithFrame:stretchableTableHeaderView.initialFrame];
    emptyTableHeaderView.backgroundColor = [UIColor clearColor];
  }
  stretchableTableHeaderView.tableView.tableHeaderView = emptyTableHeaderView;
  [stretchableTableHeaderView.tableView
      insertSubview:stretchableTableHeaderView.view
       belowSubview:emptyTableHeaderView];
  [tableView addObserver:stretchableTableHeaderView
              forKeyPath:@"contentOffset"
                 options:NSKeyValueObservingOptionNew
                 context:nil];
  return stretchableTableHeaderView;
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *, id> *)change
                       context:(void *)context {
  if (![keyPath isEqualToString:@"contentOffset"])
    return;
  CGRect f = _view.frame;
  f.size.width = _tableView.frame.size.width;
  _view.frame = f;

  if (self.tableView.contentOffset.y < 0) {
    CGFloat offsetY =
        (self.tableView.contentOffset.y + self.tableView.contentInset.top) * -1;
      CGRect frame=self.initialFrame;
      frame.origin.y=offsetY * -1;
      frame.size.height = self.defaultViewHeight + offsetY;
      self.initialFrame=frame;
    self.view.frame = frame;
  }
}
- (void)dealloc {
  [_tableView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
