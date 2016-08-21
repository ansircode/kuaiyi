//
//  XJWeatherView.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJWeatherView.h"


@implementation XJWeatherView

-(instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [[UIColor alloc] initWithRed:223.0/255.0 green:244.0/255.0 blue:248.0/255.0 alpha:1.0];

    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self prepareUI];
        [self prepareData];
        
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
        
        [self prepareData];
        
    }
    return self;
}

#pragma mark 准备UI
- (void)prepareUI {
    [self addSubview:self.weatherImageV];
    [self addSubview:self.weatherType];
    [self addSubview:self.address];
    [self addSubview:self.temperature];
    [self addSubview:self.date];
    
    [self.weatherImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.mas_equalTo(self).with.offset(2);
        make.size.mas_equalTo(CGSizeMake(WEATHER_High, WEATHER_High));
    }];
    [self.weatherType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.mas_equalTo(self.weatherImageV.mas_right).with.offset(2);
    }];
    [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.mas_equalTo(self.weatherType.mas_right).with.offset(15);
    }];
    [self.temperature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).with.offset(-0.25*WEATHER_High);
//        make.right.mas_equalTo(self.mas_right).with.offset(-5);
        make.centerX.equalTo(self).with.offset(0.25*SCREEN_WIDTH);
    }];
    [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).with.offset(0.25*WEATHER_High);
        make.centerX.equalTo(self).with.offset(0.25*SCREEN_WIDTH);
    }];
}

#pragma mark 准备数据
- (void)prepareData {
    [XJWeather loadWeatherModelWithCityName:self.weather.currentCity CompletionHandler:^(XJWeather *XJWeather, NSError *error) {
        self.weather = XJWeather;
        //设置地址
        [self.address setTitle:self.weather.currentCity forState:UIControlStateNormal];
        //设置日期
        self.date.text = self.weather.date;
        //设置温度
        NSString *temparetureN = self.weather.temperature;
        self.temperature.text = [NSString stringWithFormat:@"温度: %@",temparetureN];
        //设置天气类型
        self.weatherType.text = self.weather.weather;
        //设置天气图片
        if ([self.weatherType.text isEqualToString:@"晴"]) {
            [self.weatherImageV setImage:[UIImage imageNamed:@"icon_weather_qing"]];
        }else if ([self.weatherType.text isEqualToString:@"阴"]) {
            [self.weatherImageV setImage:[UIImage imageNamed:@"icon_weather_yintian"]];
        }else if ([self.weatherType.text isEqualToString:@"多云"]) {
            [self.weatherImageV setImage:[UIImage imageNamed:@"icon_weather_duoyun"]];
        }else if ([self.weatherType.text isEqualToString:@"雨"]) {
            [self.weatherImageV setImage:[UIImage imageNamed:@"icon_weather_rain"]];
        }else {
            [self.weatherImageV sd_setImageWithURL:self.weather.dayPictureUrl];
        }
    }];
    
    
}



//监听地址按钮的点击
- (void)activeAddress {
    //跳转界面
    [self.delegate weatherViewActionAddress];
}

#pragma mark 懒加载
-(UIImageView *)weatherImageV {
    if (_weatherImageV == nil) {
        UIImage *img = [UIImage imageNamed:@"icon_weather_rain"];
        _weatherImageV = [[UIImageView alloc] initWithImage:img];
    }
    return _weatherImageV;
}
-(UILabel *)weatherType {
    if (_weatherType == nil) {
        _weatherType = [[UILabel alloc] init];
        [_weatherType setTitleColor];
        [_weatherType sizeToFit];
    }
    return _weatherType;
}
-(UIButton *)address {
    if (_address == nil) {
        _address = [[UIButton alloc] init];
        [_address setTitleColor];
        [_address sizeToFit];
        //监听按钮的点击
        [_address addTarget:self action:@selector(activeAddress) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _address;
}
-(UILabel *)temperature {
    if (_temperature == nil) {
        _temperature = [[UILabel alloc] init];
        [_temperature setTitleColor];
        [_temperature sizeToFit];
    }
    return _temperature;
}
-(UILabel *)date {
    if (_date == nil) {
        _date = [[UILabel alloc] init];
        [_date setTitleColor];
        [_date sizeToFit];
    }
    return _date;
}

-(XJWeather *)weather {
    if (_weather == nil) {
        _weather = [[XJWeather alloc] init];
    }
    return _weather;
}

@end
