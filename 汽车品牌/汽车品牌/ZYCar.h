//
//  ZYCar.h
//  汽车品牌
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYCar : NSObject
//名字
@property(nonatomic, copy)NSString *name;
//图片
@property(copy, nonatomic)NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
