//
//  ZYGroup.h
//  汽车品牌
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZYCar;
@interface ZYGroup : NSObject
//首字母
@property(copy, nonatomic)NSString *title;
//汽车模型
@property(strong, nonatomic)NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
