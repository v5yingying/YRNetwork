//
//  YRFocusModel.m
//  YRNetwork
//
//  Created by cyy on 17/1/5.
//  Copyright © 2017年 youruogege. All rights reserved.
//

#import "YRFocusModel.h"

@implementation YRFocusDataMode

@end

@implementation YRFocusModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [YRFocusDataMode class]};
}
@end
