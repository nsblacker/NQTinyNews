//
//  TNTableFlowVC.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/27.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNTableFlowVC.h"
#import "TNHomeNewsModel.h"
#import "TNFetchTableFlowDataVM.h"
#import "TNImageTitleStyleTBCell.h"
#import <MJRefresh/MJRefresh.h>
#import <SVProgressHUD.h>

static NSString *const TNImageTitleStyleTBCellIndentifier = @"TNImageTitleStyleTBCellIndentifier";

@interface TNTableFlowVC ()
@property (strong, nonatomic) UITableView *flowTable;
@property (strong, nonatomic) NSMutableArray *flowTableData;
@end

@implementation TNTableFlowVC

- (instancetype)init{
    if(self = [super init]){
        
        _flowTableData = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    
    [self createFetchTableFlowDataVM];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
}

- (void)dealloc{
    
    MethodLog;
}

#pragma -mark UI
- (void)setupUI{

    [self.view addSubview:self.flowTable];
}

- (UITableView *)flowTable{
    if(!_flowTable){
        CGRect frame = CGRectMake(0, 0, ScreenWidth, height_ViewWithNav_Tab_Seg);
        _flowTable = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        _flowTable.dataSource = self;
        _flowTable.delegate = self;
        _flowTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_flowTable registerClass:[TNImageTitleStyleTBCell class] forCellReuseIdentifier:TNImageTitleStyleTBCellIndentifier];
        _flowTable.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(createFetchTableFlowDataVM)];
    }
    return _flowTable;
}

#pragma -mark Data Loading
-(void)createFetchTableFlowDataVM{
    TNFetchTableFlowDataVM *fetchDataVM = [[TNFetchTableFlowDataVM alloc]init];
    [fetchDataVM setBlockWithReturnBlock:^(id returnValue) {
        _flowTableData = returnValue;
        [self.flowTable reloadData];
        [self recoverView];
        NSLog(@"return value = %@",returnValue);
    } errorBlock:^(id errorCode) {
        [self recoverView];
        NSLog(@"ereorcode error = %@",errorCode);
    } failureBlock:^(id errorCode) {
        [self recoverView];
        NSLog(@"failure error = %@",errorCode);
    }];
    [fetchDataVM fetchDataWithNewsType:_newsType];
    [SVProgressHUD show];
    
}

#pragma -mark Actions
- (void)recoverView{
    [SVProgressHUD dismiss];
    if([_flowTable.mj_header isRefreshing]){
        [_flowTable.mj_header endRefreshing];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _flowTableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TNImageTitleStyleTBCell *cell = [tableView dequeueReusableCellWithIdentifier:TNImageTitleStyleTBCellIndentifier forIndexPath:indexPath];
    
    TNHomeNewsModel *model = _flowTableData[indexPath.row];
    
    // Configure the cell...
    [cell configCellWithModel:model];
    
    return cell;
}

#pragma mark - Table view Delegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TNFetchTableFlowDataVM *fetchTableFlowDataVM = [[TNFetchTableFlowDataVM alloc]init];
    [fetchTableFlowDataVM tinynewsDetailWithModel:_flowTableData[indexPath.row] topViewController:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}


#pragma -mark Override
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
