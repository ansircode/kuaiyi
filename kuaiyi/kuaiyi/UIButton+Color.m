//
//  UIButton+Color.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIButton+Color.h"

@implementation UIButton (Color)

//设置字体颜色接口
- (void)setTitleColor {
    [self setTitleColor:[UIColor colorWithRed:79.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:22]];
}

@end
