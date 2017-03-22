//
//  WQTargetConfigMacros.h
//  WQTemplate
//
//  Created by luo on 2017/3/21.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#ifndef WQTargetConfigMacros_h
#define WQTargetConfigMacros_h

#if PRODUCT  //产品环境

//输出转换成DDLog
//#define NSLog(...) DDLogVerbose(__VA_ARGS__)
//#define Log(...) DDLogVerbose(__VA_ARGS__)

#else   //其它环境

//输出转换成DDLog
//#define NSLog(...) DDLogVerbose(__VA_ARGS__)
//#define Log(...) DDLogVerbose(__VA_ARGS__)

#endif

#endif /* WQTargetConfigMacros_h */
