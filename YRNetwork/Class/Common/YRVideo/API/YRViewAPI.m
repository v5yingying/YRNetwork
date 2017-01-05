//
//  YRViewAPI.m
//  YRNetwork
//
//  Created by cyy on 17/1/5.
//  Copyright © 2017年 youruogege. All rights reserved.
//

#import "YRViewAPI.h"

@implementation YRViewAPI
-(id)init {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}
/**
 设置请求接口
 */
- (NSString *)requestUrl{
    return @"getFocusList";
}
/**
 设置请求超时时间
 */
- (NSTimeInterval)requestTimeoutInterval {
    return 5;
}

/**
 设置请求形式
 */
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

/**
 设置缓存请求时间
 */
- (NSInteger)cacheTimeInSeconds {
    return 60 * 3;
}
@end
