//
//  XJUser.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJUser.h"

@implementation XJUser

//单例
+ (instancetype)shareManager {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ([super init]) {
        self.city_address = [aDecoder decodeObjectForKey:@"city_address"];
    }
    return self;
}

//归档
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.city_address forKey:@"city_address"];
}


@end
