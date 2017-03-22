//
//  WQTargetConfigContants.h
//  WQTemplate
//
//  Created by luo on 2017/3/21.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#ifndef WQTargetConfigContants_h
#define WQTargetConfigContants_h


#if PRODUCT  //产品环境

static NSString* const MBTargetConfig_NetWork_s=@"";

//DDLog等级
static const int ddLogLevel = LOG_LEVEL_ERROR;

#else   //其它环境

//DDLog等级
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

#endif

#endif /* WQTargetConfigContants_h */
