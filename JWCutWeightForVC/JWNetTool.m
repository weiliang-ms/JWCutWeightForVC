//
//  JWNetTool.m
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import "JWNetTool.h"
#import <AFNetworking.h>
@implementation JWNetTool
+ (void)getDataWithUrl:(NSString *)url CallBack:(CallBack)callBack
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html", @"text/json", @"text/javascript", @"text/plain",@"application/json", nil]];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            callBack(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}
@end
