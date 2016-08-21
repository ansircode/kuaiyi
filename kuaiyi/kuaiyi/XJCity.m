//
//  XJCity.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJCity.h"

@implementation XJCity

+ (NSArray *)cityArray:(NSArray *)dic {
    NSMutableArray *muArray = [NSMutableArray array];
    for (NSString *dict in dic) {
        XJCity *city = [[XJCity alloc] init];
        city.name = dict;
        [muArray addObject:city];
    }
    
    return muArray;
}

@end
