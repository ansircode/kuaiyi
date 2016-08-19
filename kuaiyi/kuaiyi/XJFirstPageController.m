//
//  XJFirstPageController.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJFirstPageController.h"
#define NAV_HIGH 64

@interface XJFirstPageController ()<XJWeatherViewDelegate>


@end

@implementation XJFirstPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏navigation返回按钮
    self.navigationItem.hidesBackButton = YES;
    
    //设置UI
    [self prepareUI];
    
    //指定代理
    self.weatherView.delegate = self;
}

- (void)prepareUI {
    [self.view addSubview:self.weatherView];
    
    [self.weatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(NAV_HIGH);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, WEATHER_High));
    }];
}

#pragma mark XJWeatherViewDelegate
-(void)weatherViewActionAddress {
    //跳转界面
    XJChooseAddressController *chooseAddressC = [[XJChooseAddressController alloc] init];
    [self.navigationController pushViewController:chooseAddressC animated:YES];
}

#pragma mark 懒加载
-(XJWeatherView *)weatherView {
    if (_weatherView == nil) {
        _weatherView = [[XJWeatherView alloc] init];

//        NSLog(@"%f,%f",_weatherView.frame.size.width,_weatherView.frame.size.height);
//        NSLog(@"%f",self.navigationController.navigationBar.frame.size.height);
        
    }
    return _weatherView;
}


@end
