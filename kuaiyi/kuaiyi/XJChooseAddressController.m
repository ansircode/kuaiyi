//
//  XJChooseAddressController.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJChooseAddressController.h"
#import "XJProvince.h"
#import "XJChooseCityController.h"

@interface XJChooseAddressController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation XJChooseAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //更改返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"jiantou"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.provinceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //cell的重用
    static NSString *ID = @"province";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    //取出组
    XJProvince *province = self.provinceArray[indexPath.row];
    
    cell.textLabel.text = province.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //跳转到下一个控制器
    XJProvince *province = self.provinceArray[indexPath.row];
    self.cityArray = province.cityArray;
    XJChooseCityController *chooseCityC = [[XJChooseCityController alloc] init];
    chooseCityC.cityArray = self.cityArray;
    
    [self.navigationController pushViewController:chooseCityC  animated:YES];
    
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 

#pragma mark 懒加载
-(NSArray *)provinceArray {
    if (_provinceArray == nil) {
        _provinceArray = [XJProvince provinceArray];
    }
    return _provinceArray;
}


@end
