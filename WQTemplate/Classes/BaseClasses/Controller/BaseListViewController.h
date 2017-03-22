//
//  BaseListViewController.h
//  WQStartKit
//
//  Created by luo on 2017/3/10.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQChiBaoZiHeader.h"
#import "MJRefreshAutoNormalFooter.h"
#import "UIScrollView+EmptyDataSet.h"

@interface BaseListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *datalist;

@property (nonatomic, getter=isLoading) BOOL loading;

- (void)fetchDataWithRefresh:(BOOL)refresh;

@end
