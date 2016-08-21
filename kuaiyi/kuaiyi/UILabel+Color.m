//
//  UILabel+Color.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UILabel+Color.h"

@implementation UILabel (Color)

//设置字体颜色接口
- (void)setTitleColor {
    self.textColor = [UIColor colorWithRed:79.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0];
    [self setFont:[UIFont systemFontOfSize:22]];
    [self setTextAlignment:NSTextAlignmentCenter];
}

@end
