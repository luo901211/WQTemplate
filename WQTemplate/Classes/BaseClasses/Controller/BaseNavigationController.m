//
//  BaseNavigationController.m
//  WQStartKit
//
//  Created by luo on 2017/3/7.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIColor+Random.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor RandomColor];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        //第二级则隐藏底部Tab
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
