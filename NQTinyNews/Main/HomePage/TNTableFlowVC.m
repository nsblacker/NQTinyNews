//
//  TNTableFlowVC.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/27.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNTableFlowVC.h"
#import "TNNetworkManager.h"
#import "TNHomeNewsModel.h"
#import "TNImageTitleStyleTBCell.h"
#import <MJRefresh/MJRefresh.h>

NSString *const TNImageTitleStyleTBCellIndentifier = @"TNImageTitleStyleTBCellIndentifier";

@interface TNTableFlowVC ()
@property (strong, nonatomic) UITableView *hp_newsTB;
@property (strong, nonatomic) NSMutableArray *hp_newsArr;
@end

@implementation TNTableFlowVC

- (instancetype)init{
    if(self = [super init]){
        
        _hp_newsArr = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    MethodLog;

    [self setupUI];
    
    [self loadData];
    
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

    [self.view addSubview:self.hp_newsTB];
}

- (UITableView *)hp_newsTB{
    if(!_hp_newsTB){
    
        CGRect frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        _hp_newsTB = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        _hp_newsTB.dataSource = self;
        _hp_newsTB.delegate = self;
        _hp_newsTB.backgroundColor = [UIColor redColor];
        _hp_newsTB.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        //[_hp_newsTB registerClass:[TNImageTitleStyleTBCell class] forCellReuseIdentifier:TNImageTitleStyleTBCellIndentifier];
        [_hp_newsTB registerNib:[UINib nibWithNibName:NSStringFromClass([TNImageTitleStyleTBCell class]) bundle:[NSBundle mainBundle]]forCellReuseIdentifier:TNImageTitleStyleTBCellIndentifier];
        
        _hp_newsTB.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    }
    return _hp_newsTB;
}

#pragma -mark Data Loading
- (void)loadData {
    
    WeakSelf(weakSelf);
    [[TNNetworkManager sharedInstance]requestNewsWithType:_newsType success:^(id response) {
        
        id result = [response valueForKey:@"result"];
        if(result && [result isKindOfClass:[NSDictionary class]]){
            
            id data = [result valueForKey:@"data"];
            if(data && [data isKindOfClass:[NSArray class]]){
                
                NSError *err = nil;
                [weakSelf.hp_newsArr removeAllObjects];
                for(NSDictionary *dic in data){
                    
                    TNHomeNewsModel *tn_homeNewsModel = [[TNHomeNewsModel alloc]initWithDictionary:dic error:&err];
                    if(err){
                        
                        return;
                    }else{
                        
                        [weakSelf.hp_newsArr addObject:tn_homeNewsModel];
                    }
                }
            }
            [weakSelf.hp_newsTB reloadData];
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

#pragma -mark ZJScrollPageViewChildVcDelegate
//如果使用VC生命周期下的函数能够满足加载数据，可以不去实现这套Delegate
- (void)zj_viewWillAppearForIndex:(NSInteger)index{
    
}
- (void)zj_viewDidLoadForIndex:(NSInteger)index{
    //like @selector(viewDidLoad)
}
- (void)zj_viewDidAppearForIndex:(NSInteger)index{
    
}

- (void)zj_viewWillDisappearForIndex:(NSInteger)index{
    
}
- (void)zj_viewDidDisappearForIndex:(NSInteger)index{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _hp_newsArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TNImageTitleStyleTBCell *cell = [tableView dequeueReusableCellWithIdentifier:TNImageTitleStyleTBCellIndentifier forIndexPath:indexPath];
    
    TNHomeNewsModel *model = _hp_newsArr[indexPath.row];
    
    // Configure the cell...
    [cell configCellWithModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma -mark Override
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
