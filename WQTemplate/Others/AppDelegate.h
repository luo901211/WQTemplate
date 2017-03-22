//
//  AppDelegate.h
//  WQStartKit
//
//  Created by wenqi on 17/3/6.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPUmengHelper.h"
#import "WQHomeTabBarController.h"
#import "SYSafeCategory.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//登录页面
-(void)setupLoginViewController;
//跳转到首页
-(void)setupHomeViewController;

@end

