//
//  HomeViewController.m
//  WQStartKit
//
//  Created by luo on 2017/3/9.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "NewsListViewController.h"
#import "UIColor+HEX.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "NewsDetailViewController.h"
#import "NewsListViewModel.h"

@interface NewsListViewController ()

@end



@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"资讯";
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithHexString:@"#333333"];
    
    __weak __typeof__(self) weakSelf = self;
    
    self.tableView.mj_header.refreshingBlock = ^{
        NSLog(@"viewDidLoad headerBlock");
        [weakSelf fetchDataWithRefresh:YES];
    };
    self.tableView.mj_footer.refreshingBlock = ^{
        NSLog(@"viewDidLoad footerBlock");
        [weakSelf fetchDataWithRefresh:NO];
    };
    
    [self.tableView registerClass:[NewsCell class] forCellReuseIdentifier:@"cell"];
    self.loading = YES;
    [self fetchDataWithRefresh:YES];
}

- (void)fetchDataWithRefresh:(BOOL)refresh {
    
    [NewsListViewModel executeGetNewsListTaskWithStart:self.datalist.count success:^(id obj) {
        self.loading = NO;
        [self.datalist addObjectsFromArray:obj];
        if (refresh) {
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer resetNoMoreData];
            self.tableView.mj_footer.hidden = NO;

        }else{
            if (((NSArray *)obj).count < 10) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
        }
        [self.tableView reloadData];
    } failed:^(id obj) {
        self.loading = NO;
        NSLog(@"error: %@",obj);
    }];
}

- (void)insertData {}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datalist.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.model = self.datalist[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsDetailViewController *vc = [[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - DZNEmptyDataSetSource

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

#pragma mark - DZNEmptyDataSetDelegate

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    self.loading = YES;
    [self fetchDataWithRefresh:YES];
}

@end
