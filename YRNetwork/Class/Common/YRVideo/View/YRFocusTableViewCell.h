//
//  YRFocusTableViewCell.h
//  YRNetwork
//
//  Created by cyy on 17/1/5.
//  Copyright © 2017年 youruogege. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>
#import "YRFocusModel.h"

@interface YRFocusTableViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property (nonatomic,strong) YRFocusModel *model;

@end
