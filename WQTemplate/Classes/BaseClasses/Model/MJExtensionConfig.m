//
//  MJExtensionConfig.m
//  WQStartKit
//
//  Created by luo on 2017/3/16.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "NewsModel.h"

@implementation MJExtensionConfig

+ (void)load {
    
    [NewsModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"description",
                 @"imageSrc": @"litpic"
                 };
    }];
}

@end
