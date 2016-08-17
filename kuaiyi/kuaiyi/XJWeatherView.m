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
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
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
        [_weatherType setText:@"小雨"];
        [_weatherType setTitleColor];
        [_weatherType sizeToFit];
    }
    return _weatherType;
}
-(UIButton *)address {
    if (_address == nil) {
        _address = [[UIButton alloc] init];
        [_address setTitle:@"广州" forState:UIControlStateNormal];
        [_address setTitleColor];
        [_address sizeToFit];
    }
    return _address;
}
-(UILabel *)temperature {
    if (_temperature == nil) {
        _temperature = [[UILabel alloc] init];
        _temperature.text = @"温度：11 ~ 16 C";
        [_temperature setTitleColor];
        [_temperature sizeToFit];
    }
    return _temperature;
}
-(UILabel *)date {
    if (_date == nil) {
        _date = [[UILabel alloc] init];
        _date.text = @"2016-08-17";
        [_date setTitleColor];
        [_date sizeToFit];
    }
    return _date;
}

@end
