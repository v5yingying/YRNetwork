//
//  YRShareView.m
//  YRNetwork
//
//  Created by cyy on 17/1/5.
//  Copyright © 2017年 youruogege. All rights reserved.
//

#import "YRShareView.h"

@implementation YRShareView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        int num = 4;
        CGFloat X, Y, W, H;
        Y = 0;
        W = frame.size.width/4;
        H = frame.size.height/4;
        for (int i = 0; i < num ; i ++) {
            X = W *i;
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(X, Y, W, H)];
            [self addSubview:btn];
            btn.tag = i;
            if (btn.tag == 0) {
                btn.backgroundColor = [UIColor redColor];
            }else if (btn.tag == 1){
                btn.backgroundColor = [UIColor greenColor];
            }else if (btn.tag == 2){
                btn.backgroundColor = [UIColor blueColor];
            }else if (btn.tag == 3){
                btn.backgroundColor = [UIColor yellowColor];
            }
            [btn setTitle:[NSString stringWithFormat:@"share%d",i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(shareTo:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

-(void)shareTo:(UIButton *)sender{
    
}
@end
