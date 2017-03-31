//
//  FruitTableAdapter.h
//  panketong
//
//  Created by 燕文强 on 16/12/5.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FruitTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy) NSMutableArray *dataSource;
@property (nonatomic,copy) UITableView *tableView;

- (void)loadTableView:(UITableView *)tableView;

@end
