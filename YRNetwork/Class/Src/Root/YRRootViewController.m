//
//  YRRootViewController.m
//  YRNetwork
//
//  Created by cyy on 17/1/5.
//  Copyright © 2017年 youruogege. All rights reserved.
//

#import "YRRootViewController.h"
#import <SDCycleScrollView.h>
#import "YRFocusTableViewCell.h"
#import "YRViewAPI.h"
#import "YYModel.h"
//#import "YRFocusModel.h"

#define SCREEN [UIScreen mainScreen].bounds.size

static NSString *cellId = @"YRFocusTableViewCell";

@interface YRRootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) YRFocusModel *focusModel;

@end

@implementation YRRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self setupUI];
    
    [self loadData];
}

- (void) setupUI{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, SCREEN.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 500.f;
    
    // 配置tableView的inset使其全屏显示
    UIEdgeInsets adjustTableInsets = UIEdgeInsetsMake(0, 0, -CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
    tableView.contentInset = adjustTableInsets;
    tableView.scrollIndicatorInsets = adjustTableInsets;
    
    [tableView registerClass:[YRFocusTableViewCell class] forCellReuseIdentifier:cellId];
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    
}

- (void) loadData{
    
    YRViewAPI *api = [[YRViewAPI alloc]init];
    
    if ([api loadCacheWithError:nil]) {
        NSDictionary *json = [api responseJSONObject];
        NSLog(@"json = %@", json);
        
        YRFocusModel *focusModel = [YRFocusModel yy_modelWithJSON:json];
        self.focusModel = focusModel;
        [self.tableView reloadData];
        // show cached data
    }
    
    __weak typeof(self) weakSelf = self;
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        YRFocusModel *model = [YRFocusModel yy_modelWithJSON:request.responseObject];
        weakSelf.focusModel = model;
        [weakSelf.tableView reloadData];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YRFocusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.model = self.focusModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 180;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
