//
//  XJWeatherView.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJWeatherView.h"

@implementation XJWeatherView

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
    self.backgroundColor = [[UIColor alloc] initWithRed:223.0 green:244.0 blue:248.0 alpha:1.0];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 55);
    
    
}

@end
