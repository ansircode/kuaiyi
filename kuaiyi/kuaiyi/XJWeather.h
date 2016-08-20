//
//  XJWeather.h
//  kuaiyi
//
//  Created by 许建安 on 16/8/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJWeather : NSObject

//白天天气图片URL
@property (nonatomic, strong) NSURL *dayPictureUrl;

//晚上天气图片URL
@property (nonatomic, strong) NSURL *nightPictureUrl;

//天气状态
@property (nonatomic, copy) NSString *weather;

//当前城市
@property (nonatomic, copy) NSString *currentCity;

//天气日期
@property (nonatomic, copy) NSString *date;

//温度
@property (nonatomic, copy) NSString *temperature;

//加载百度天气
+ (void)loadWeatherModelWithCityName:(NSString *)city CompletionHandler:(void(^)(XJWeather *XJWeather,NSError *error))completionHandler;

+ (instancetype)weatherWithDic:(NSDictionary *)dic;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
