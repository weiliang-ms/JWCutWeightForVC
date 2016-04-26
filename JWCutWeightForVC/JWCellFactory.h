//
//  JWCellFactory.h
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JWModel;
typedef NS_ENUM(NSUInteger, CellType) {
    
    NewsOneImageCell = 0,
    NewsOneBigImageCell,
    NewsThreeImageCell,
    
};
@interface JWCellFactory : NSObject
+ (UITableViewCell *)creatTableViewCellWithModel:(JWModel *)model TableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;
@end

