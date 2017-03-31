//
//  ViewController.m
//  demo
//
//  Created by 中原管家 on 2017/2/10.
//  Copyright © 2017年 王雅琦. All rights reserved.
//

#import "DemoViewController.h"
#import "FristPresenter.h"
#import "ArrayDataSource.h"
#import "LoginEntity.h"
#import "ViewControllerCell.h"
#import "UIView+YYAdd.h"


static NSString * const CellIdentifier = @"ViewControllerCell";


@interface DemoViewController ()<UITableViewDelegate,MainViewDelegate>
{
    UITableView *_mainTableView;
    MainPresenter *_mainPersenter;
    ArrayDataSource *_arrayDataSource;
    NSMutableArray *_dataSourceArr;

}

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];

}

- (void)initData
{
//    FruitEntity *model = [FruitEntity new];
//    model.name = @"王雅琦";
//    model.descriptions = @"a";
    
    _dataSourceArr = [NSMutableArray array];
//    [_dataSourceArr addObject:model];
    
    _mainPersenter = [FristPresenter initWithView:self];
   
} 

- (void)initView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((self.view.frame.size.width - 150)/2, 50, 150,50);
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitle:@"请求数据" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, button.bottom + 50, self.view.frame.size.width, self.view.frame.size.height - 100)];
    _mainTableView.delegate = self;
    [self.view addSubview:_mainTableView];
    
    TableViewCellConfigureBlock configureCell = ^(ViewControllerCell *cell, LoginEntity *model,NSIndexPath *indexPath) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;//取消点击效果
        cell.model = model;
    };
    
    _arrayDataSource = [[ArrayDataSource alloc] initWithItems:_dataSourceArr
                                               cellIdentifier:CellIdentifier
                                           configureCellBlock:configureCell];
    _mainTableView.dataSource = _arrayDataSource;
    [_mainTableView registerNib:[ViewControllerCell nib] forCellReuseIdentifier:CellIdentifier];
}

- (void)buttonAction
{
    // 请求数据
     [_mainPersenter getPresenterDataSource];
}

- (id)getTableView
{
    return _mainTableView;
}

- (NSMutableArray *)getDataSourceArr
{
    return _dataSourceArr;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点我啦");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
