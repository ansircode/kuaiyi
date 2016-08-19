//
//  XJChooseCityController.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "XJChooseCityController.h"
#import "XJCity.h"

@interface XJChooseCityController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation XJChooseCityController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"city";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    XJCity *city = self.cityArray[indexPath.row];
    cell.textLabel.text = city.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //归档
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.plist"];
    XJUser *user = [XJUser shareManager];
    XJCity *city = self.cityArray[indexPath.row];
    user.city_address = city.name;
    [NSKeyedArchiver archiveRootObject:user toFile:file];
    //取得城市地址，返回首页修改地址
    XJFirstPageController *firstPageC = [[XJFirstPageController alloc] init];
    
    [self.navigationController pushViewController:firstPageC animated:YES];
}


@end
