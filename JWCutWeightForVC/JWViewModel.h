//
//  JWViewModel.h
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JWTableViewController;
@interface JWViewModel : NSObject
/*下拉刷新*/
+ (void)getDataWithUrl:(NSString *)url TableView:(UITableView *)tableView ViewController:(JWTableViewController *)viewController;
/*上拉加载*/
+ (void)getMoreDataWithUrl:(NSString *)url TableView:(UITableView *)tableView ViewController:(JWTableViewController *)viewController Models:(NSArray *)models;
/*cell点击方法*/
+ (void)cellSeletedActionWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath ViewController:(UIViewController *)viewController Arr:(NSArray *)arr;
@end
