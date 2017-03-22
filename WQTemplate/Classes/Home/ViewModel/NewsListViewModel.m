//
//  NewsListViewModel.m
//  WQStartKit
//
//  Created by luo on 2017/3/21.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "NewsListViewModel.h"
#import "NewsModel.h"

@implementation NewsListViewModel
+ (void)executeGetNewsListTaskWithStart:(NSInteger)start
                                success:(SuccessBlock)success
                                 failed:(FailedBlock)failed {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                  @"appid": @1,
                                                                                  @"classmore": @"indexpic",
                                                                                  @"start": @(start)}];
    [HttpTool getWithPath:API_NEWS_LIST params:params success:^(id json) {
        
        
        NSInteger error = ![json isKindOfClass:[NSArray class]];
        if (!error) {
            
            NSArray *list = [NewsModel mj_objectArrayWithKeyValuesArray:json];
            
            success(list);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];
    
}

@end
