//
//  YRFocusModel.h
//  YRNetwork
//
//  Created by cyy on 17/1/5.
//  Copyright © 2017年 youruogege. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YRFocusDataMode : NSObject

@property (nonatomic,copy) NSString *focusImage;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *tplName;

@end

@interface YRFocusModel : NSObject

@property (nonatomic,strong) NSArray *data;
@property (nonatomic,strong) NSNumber *isLogin;
@property (nonatomic,copy)   NSString *msg;
@property (nonatomic,strong) NSNumber *status;

@end
