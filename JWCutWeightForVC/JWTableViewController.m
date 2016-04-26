//
//  JWTableViewController.m
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import "JWTableViewController.h"
#define URL @"http://api.sina.cn/sinago/list.json?uid=c6a4f5df5110dd57&s=20&p=1&channel=news_toutiao"
#define MORE @"http://api.sina.cn/sinago/list.json?uid=c6a4f5df5110dd57&s=20&p=%ld&channel=news_toutiao"
#import "JWNetTool.h"
#import "JWModel.h"
#import "JWViewModel.h"
#import <MJRefresh.h>
#import "JWCellFactory.h"
@interface JWTableViewController ()

@end

@implementation JWTableViewController
- (NSArray *)models
{
    if (!_models) {
        _models = [NSArray array];
    }
    
    return _models;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"JWOnePictureCell" bundle:nil] forCellReuseIdentifier:@"JWOnePictureCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JWBigPictureCell" bundle:nil] forCellReuseIdentifier:@"JWBigPictureCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JWThreePicsCell" bundle:nil] forCellReuseIdentifier:@"JWThreePicsCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [JWViewModel getDataWithUrl:URL TableView:self.tableView ViewController:self];
    }];
    [self.tableView.mj_header beginRefreshing];
#pragma mark - 下拉加载的实现
    self.tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
        [JWViewModel getMoreDataWithUrl:MORE TableView:self.tableView ViewController:self Models:self.models];
    }];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.models.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [JWCellFactory creatTableViewCellWithModel:self.models[indexPath.row] TableView:tableView IndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView insertRowsAtIndexPaths:<#(nonnull NSArray<NSIndexPath *> *)#> withRowAnimation:<#(UITableViewRowAnimation)#>]
    [JWViewModel cellSeletedActionWithTableView:tableView IndexPath:indexPath ViewController:self Arr:self.models];
}


@end
