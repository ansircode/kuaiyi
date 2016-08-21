//
//  XJUser.h
//  kuaiyi
//
//  Created by 许建安 on 16/8/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJUser : NSObject <NSCoding>


#pragma mark 联网加载的用户信息

//城市地址
@property (nonatomic, copy) NSString *city_address;

//单例
+ (instancetype)shareManager;

@end
