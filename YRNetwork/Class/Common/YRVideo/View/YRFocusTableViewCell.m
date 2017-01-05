//
//  YRFocusTableViewCell.m
//  YRNetwork
//
//  Created by cyy on 17/1/5.
//  Copyright © 2017年 youruogege. All rights reserved.
//

#import "YRFocusTableViewCell.h"

#define RATE(x) ([UIScreen mainScreen].bounds.size.width*x)/750 // 750*1334分辨率设计稿适配

@interface YRFocusTableViewCell()

@property (nonatomic,weak) SDCycleScrollView *cycleScrollView;
@property (nonatomic,weak) UILabel *titleLabel;

@end

@implementation YRFocusTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 情景一：采用本地图片实现
        NSArray *imageNames = @[@"h1.jpg",
                                @"h2.jpg",
                                @"h3.jpg",
                                @"h4.jpg",
                                @"h7" // 本地图片请填写全名
                                ];
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, RATE(750), 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
        self.cycleScrollView = cycleScrollView;
        cycleScrollView.delegate = self;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        [self.contentView addSubview:cycleScrollView];
        cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        [self.contentView addSubview:cycleScrollView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, RATE(750), 180)];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
        
    }
    return self;
}

- (void)setModel:(YRFocusModel *)model{
    
    _model = model;
    
    NSMutableArray *imgUrlArr = [NSMutableArray arrayWithCapacity:model.data.count];
    
    for (YRFocusDataMode *dataModel in model.data) {
        
        NSString *imageUrl = dataModel.focusImage;
        [imgUrlArr addObject:imageUrl];
    }
    
    self.cycleScrollView.imageURLStringsGroup = imgUrlArr;
    
    YRFocusDataMode *data = [model.data firstObject];
    self.titleLabel.text = data.title;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
