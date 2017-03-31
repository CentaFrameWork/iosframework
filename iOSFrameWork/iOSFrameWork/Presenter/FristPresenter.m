//
//  FristPresenter.m
//  demo
//
//  Created by 中原管家 on 2017/2/12.
//  Copyright © 2017年 王雅琦. All rights reserved.
//

#import "FristPresenter.h"
#import "FruitTableAdapter.h"
#import "LoginApi.h"

@implementation FristPresenter 
{
    FruitTableAdapter *adapter;
    LoginEntity *_entity;
}


+ (MainPresenter *)initWithView:(id<MainViewDelegate>)mainView
{
    MainPresenter *mainPresenter = [[FristPresenter alloc]init];
    mainPresenter.mainView = mainView;
    
    return mainPresenter;
}

- (void)addItemClick
{
//    [[self.mainView getTableView] reloadData];
}

- (void)getPresenterDataSource
{
    LoginApi *api = [LoginApi new];
    api.account = @"Ceshitj2016040181";
    api.psd = @"111222";
    
    _entity = [[LoginEntity alloc] initWithManage];
    _entity.delegate = self;
    [_entity NetworkRequest:api];
}


- (void)loadTableView
{
//    adapter = [[FruitTableAdapter alloc]init];
//    [adapter loadTableView:[self.mainView getTableView]];
}


- (void)loginDelegate:(id)entity
{
    LoginEntity *loginEntity = (LoginEntity *)entity;
    
    NSMutableArray *arr = [self.mainView getDataSourceArr];
    [arr addObject:loginEntity];
    
    // 刷新
    [[self.mainView getTableView] reloadData];
    
}


@end
