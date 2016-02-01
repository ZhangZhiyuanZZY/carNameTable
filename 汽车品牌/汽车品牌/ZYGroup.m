//
//  ZYGroup.m
//  汽车品牌
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYGroup.h"
#import "ZYCar.h"

@implementation ZYGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        NSArray *arrayCars = dict[@"cars"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in arrayCars) {
            ZYCar *car = [[ZYCar alloc]initWithDict:dict];
            [arrayM addObject:car];
        }
        self.cars = arrayM;
    }
    return self;
}

@end
