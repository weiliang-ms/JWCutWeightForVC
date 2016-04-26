//
//  JWViewModel.m
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import "JWViewModel.h"
#import "JWWebViewController.h"
#import "JWModel.h"
#import "JWNetTool.h"
#import <MJRefresh.h>
#import "JWTableViewController.h"
@implementation JWViewModel
+ (void)getDataWithUrl:(NSString *)url TableView:(UITableView *)tableView ViewController:(JWTableViewController *)viewController
{
    __block NSMutableArray *dataArr = [NSMutableArray array];
    [JWNetTool getDataWithUrl:url CallBack:^(id result) {
        
        NSDictionary *dic = [result objectForKey:@"data"];
        NSArray *list = [dic objectForKey:@"list"];
        for (NSDictionary *temp in list) {
            JWModel *model = [JWModel modelWithDic:temp];
            [dataArr addObject:model];
        }
        viewController.models = dataArr;
        [tableView reloadData];
        [tableView.mj_header endRefreshing];
        
    }];

}

+ (void)getMoreDataWithUrl:(NSString *)url TableView:(UITableView *)tableView ViewController:(JWTableViewController *)viewController Models:(NSArray *)models
{
    static NSInteger index = 1;
    index++;
    NSString *urlTemp = [NSString stringWithFormat:url,index];
    __block NSMutableArray *arr = [NSMutableArray array];
    [JWNetTool getDataWithUrl:urlTemp CallBack:^(id result) {
        
        NSDictionary *dic = [result objectForKey:@"data"];
        NSArray *list = [dic objectForKey:@"list"];
        [arr addObjectsFromArray:models];
        for (NSDictionary *temp in list) {
            JWModel *model = [JWModel modelWithDic:temp];
            [arr addObject:model];
            viewController.models = arr;
            [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:arr.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        }
        
        [tableView.mj_footer endRefreshing];
        
    }];


}
+ (void)cellSeletedActionWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath ViewController:(UIViewController *)viewController Arr:(NSArray *)arr
{

    JWWebViewController *web = [[JWWebViewController alloc] init];
    JWModel *model = arr[indexPath.row];
    web.url = model.link;
    [viewController.navigationController pushViewController:web animated:YES];

}
@end
