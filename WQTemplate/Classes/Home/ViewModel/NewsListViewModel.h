//
//  NewsListViewModel.h
//  WQStartKit
//
//  Created by luo on 2017/3/21.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "BaseViewModel.h"

@interface NewsListViewModel : BaseViewModel

@property (nonatomic, strong) NSMutableArray *list;

//资讯列表
+ (void)executeGetNewsListTaskWithStart:(NSInteger)start
                                success:(SuccessBlock)success
                                 failed:(FailedBlock)failed;

@end
