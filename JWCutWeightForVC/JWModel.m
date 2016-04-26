//
//  JWModel.m
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import "JWModel.h"

@implementation JWModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)modelWithDic:(NSDictionary *)dic
{
    return [[JWModel alloc] initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
