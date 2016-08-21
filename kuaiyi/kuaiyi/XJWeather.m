//
//  XJWeather.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJWeather.h"

@implementation XJWeather

-(NSString *)currentCity {
    
    // 设置地址的数据
    _currentCity = @"广州";
    //解档
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.plist"];
    XJUser *user = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    if (user) {
        if (user.city_address) {
            _currentCity = user.city_address;
        }
    }
    return _currentCity;
}

//加载百度天气
+ (void)loadWeatherModelWithCityName:(NSString *)city CompletionHandler:(void(^)(XJWeather *XJWeather,NSError *error))completionHandler {
    NSDictionary *parameters = @{@"location":city,@"output":@"json",@"ak":BDWeather_KEY};
//    NSString *url = [NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=%@",city,BDWeather_KEY];
    [[XJNetWorkTool shareManager] getURLString:BDWeather_URLString parameters:parameters CompletionHandler:^(NSDictionary *resultDict, NSError *error) {
        NSLog(@"%@",resultDict);
        if (error == nil && [resultDict[@"status"] isEqualToString:@"success"]) {
            //第一层字典
            NSDictionary *dic = resultDict[@"results"][0];
            //第二层字典
            NSDictionary *weatherDic = dic[@"weather_data"][0];
            //字典转模型
            XJWeather *weather = [[XJWeather alloc] init];
            weather.date = resultDict[@"date"];
            weather.dayPictureUrl = weatherDic[@"dayPictureUrl"];
            weather.nightPictureUrl = weatherDic[@"nightPictureUrl"];
            weather.temperature = weatherDic[@"temperature"];
            weather.weather = weatherDic[@"weather"];
            
            completionHandler(weather,nil);
            
        }else {
            completionHandler(nil,error);
        }
    }];
}

+ (instancetype)weatherWithDic:(NSDictionary *)dic {
    return [[XJWeather alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}



@end
