//
//  FruitTableAdapter.m
//  panketong
//
//  Created by 燕文强 on 16/12/5.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "FruitTableAdapter.h"

@implementation FruitTableAdapter

- (void)loadTableView:(UITableView *)tableView
{
//    tableView.delegate = self;
    if (!tableView.dataSource) {
//        tableView.dataSource = self;
    }
    [tableView reloadData];
}

- (id)getItemData:(NSInteger)position
{
    return self.dataSource[position];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(!_dataSource){
        _dataSource = [NSMutableArray new];
    }
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"value1";
    
    UITableViewCell *nullableCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!nullableCell){
        nullableCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        NSLog(@"实例化一次");
    }
    
//    FruitEntity *fruit = _dataSource[indexPath.row];
//    
//    nullableCell.textLabel.text = fruit.name;
//    nullableCell.detailTextLabel.text = fruit.descriptions;
    
    return nullableCell;
}

@end
