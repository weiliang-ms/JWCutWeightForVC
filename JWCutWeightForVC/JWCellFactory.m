//
//  JWCellFactory.m
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import "JWCellFactory.h"
#import "JWModel.h"
@implementation JWCellFactory
+ (UITableViewCell *)creatTableViewCellWithModel:(JWModel *)model TableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    return [self creatTableViewCellWithModel:model TableView:tableView IndexPath:indexPath CellType:[self cellTypeWithModel:model]];
    
}
+ (UITableViewCell *)creatTableViewCellWithModel:(JWModel *)model TableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath CellType:(CellType)type
{
    UITableViewCell *cell = nil;
    switch (type) {
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"JWOnePictureCell"];
            tableView.rowHeight = 120;
            break;
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"JWBigPictureCell"];
            cell.backgroundColor = [UIColor yellowColor];
            tableView.rowHeight = 150;
            
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"JWThreePicsCell"];
            cell.backgroundColor = [UIColor greenColor];
            tableView.rowHeight = 180;
            
            break;
        default:
            break;
    }
    
    return cell;
}
+(CellType)cellTypeWithModel:(JWModel *)model
{
    if (![model.category isEqualToString:@"hdpic"]) {
        if ([model.category isEqualToString:@"cms"]) {
            return NewsOneImageCell;
        }else{
            
            return NewsOneBigImageCell;
        }
    }
    
    return NewsThreeImageCell;
}
@end

