//
//  XJProvince.h
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJCity.h"

@interface XJProvince : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) XJCity *citys;

@property (nonatomic, strong) NSArray *cityArray;

+ (NSArray *)provinceArray;

@end
