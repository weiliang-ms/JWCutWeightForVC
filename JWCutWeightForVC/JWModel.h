//
//  JWModel.h
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWModel : NSObject
@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *kpic;

@property (nonatomic, copy) NSString *comments;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *link;

+ (instancetype)modelWithDic:(NSDictionary *)dic;
@end
