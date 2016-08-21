//
//  XJWeatherView.h
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJWeather.h"

@protocol XJWeatherViewDelegate <NSObject>

- (void)weatherViewActionAddress;

@end

@interface XJWeatherView : UIView

@property (nonatomic, strong) UIImageView *weatherImageV;

@property (nonatomic, strong) UILabel *weatherType;

@property (nonatomic, strong) UIButton *address;

@property (nonatomic, strong) UILabel *temperature;

@property (nonatomic, strong) UILabel *date;

//天气model
@property (nonatomic, strong) XJWeather *weather;

//代理协议
@property (nonatomic, weak) id<XJWeatherViewDelegate> delegate;

@end
