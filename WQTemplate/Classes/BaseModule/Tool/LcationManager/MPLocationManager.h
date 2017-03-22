//
//  MPLocationManager.h
//  MobileProject
//
//  Created by wujunyang on 16/1/15.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KSystemLocationBlock)(CLLocation *loction, NSError *error);

@interface MPLocationManager : NSObject

+ (id)shareInstance;

/**
 *  启动系统定位
 *
 *  @param systemLocationBlock 系统定位成功或失败回调成功
 */
- (void)startSystemLocationWithRes:(KSystemLocationBlock)systemLocationBlock;

@end
