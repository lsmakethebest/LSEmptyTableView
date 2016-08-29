//
//  StretchableTableHeaderView.m
//  StretchableTableHeaderView
//

#import "LSStretchableTableHeaderView.h"

@interface LSStretchableTableHeaderView ()
{
    CGRect initialFrame;
    CGFloat defaultViewHeight;
}
@property (nonatomic,weak) UITableView* tableView;
@property (nonatomic,weak) UIView* view;

@end

@implementation LSStretchableTableHeaderView


- (void)stretchHeaderForTableView:(UITableView *)tableView
                       headerView:(UIView *)headerView
                         withView:(UIView *)view
{
    _tableView = tableView;
    _view = view;
    view.contentMode=UIViewContentModeScaleAspectFill;
    view.clipsToBounds=YES;
    initialFrame = _view.frame;
    defaultViewHeight = initialFrame.size.height;
    
    UIView *emptyTableHeaderView=headerView;
    if (emptyTableHeaderView==nil) {
        emptyTableHeaderView= [[UIView alloc] initWithFrame:initialFrame];
        emptyTableHeaderView.backgroundColor = [UIColor clearColor];
    }
    _tableView.tableHeaderView = emptyTableHeaderView;
    [_tableView insertSubview:_view belowSubview:emptyTableHeaderView];
      [tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"]) return;
    CGRect f = _view.frame;
    f.size.width = _tableView.frame.size.width;
    _view.frame = f;
    
    if (_tableView.contentOffset.y < 0) {
        CGFloat offsetY =
        (_tableView.contentOffset.y + _tableView.contentInset.top) * -1;
        initialFrame.origin.y = offsetY * -1;
        initialFrame.size.height = defaultViewHeight + offsetY;
        _view.frame = initialFrame;
    }
    
}
-(void)dealloc
{
    [_tableView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
