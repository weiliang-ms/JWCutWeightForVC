//
//  JWNetTool.h
//  JWCutWeightForVC
//
//  Created by 微凉 on 16/4/26.
//  Copyright © 2016年 微凉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CallBack)(id result);
@interface JWNetTool : NSObject
+ (void)getDataWithUrl:(NSString *)url CallBack:(CallBack)callBack;
@end
