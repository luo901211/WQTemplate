//
//  BaseListViewController.m
//  WQStartKit
//
//  Created by luo on 2017/3/10.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "BaseListViewController.h"
#import "UIColor+HEX.h"

@interface BaseListViewController () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@end

@implementation BaseListViewController

- (NSMutableArray *)datalist {
    if (!_datalist) {
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}

- (void)setLoading:(BOOL)loading
{
    if (self.isLoading == loading) {
        return;
    }
    
    _loading = loading;
    
    [self.tableView reloadEmptyDataSet];
}


- (void)fetchDataWithRefresh:(BOOL)refresh {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 隐藏多余的空白Cell
    self.tableView.tableFooterView = [UIView new];
    
    // 下拉刷新
    WQChiBaoZiHeader *header = [WQChiBaoZiHeader headerWithRefreshingBlock:^{}];
    self.tableView.mj_header = header;
    
    // 上拉加载更多
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{}];
    self.tableView.mj_footer = footer;
    self.tableView.mj_footer.hidden = YES;
    
    // 空数据展示代理
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
}

#pragma mark - DZNEmptyDataSetSource
/*
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.isLoading) {
        return nil;
    }
    NSString *text = @"No Contents";
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0];
    UIColor *textColor = [UIColor colorWithHexString:@"c9c9c9"];
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (!text) {
        return nil;
    }
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
*/

/*
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    text = @"When you have messages, you’ll see them here.";
    font = [UIFont systemFontOfSize:13.0];
    textColor = [UIColor colorWithHexString:@"cfcfcf"];
    paragraph.lineSpacing = 4.0;
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    return attributedString;
}
*/

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.isLoading) {
        return [UIImage imageNamed:@"loading_imgBlue_78x78"];
    }
    return nil;
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

#pragma mark - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return self.isLoading;
}

@end
