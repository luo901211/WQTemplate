//
//  NewsModel.h
//  WQStartKit
//
//  Created by luo on 2017/3/13.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "BaseModel.h"

@interface NewsModel : BaseModel

@property (nonatomic) NSInteger aid;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *desc;
@property (nonatomic) NSString *imageSrc;

@end
