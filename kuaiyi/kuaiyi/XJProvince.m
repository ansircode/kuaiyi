//
//  XJProvince.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJProvince.h"

@implementation XJProvince

+ (NSArray *)provinceArray {
    NSMutableArray *muArray = [NSMutableArray array];
    //读取字典数组
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"province.plist" ofType:nil]];
    //字典数组转模型数组
    for (NSDictionary *dic in array) {
        XJProvince *province = [[XJProvince alloc] init];
        province.name = dic[@"name"];
        province.cityArray = [XJCity cityArray:dic[@"cities"]];
        
        
        [muArray addObject:province];
    }
    return muArray;
}

@end
