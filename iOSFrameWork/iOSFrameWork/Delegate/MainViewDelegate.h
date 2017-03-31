//
//  MainViewDelegate.h
//  demo
//
//  Created by 中原管家 on 2017/2/12.
//  Copyright © 2017年 王雅琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MainViewDelegate <NSObject>

- (UITableView *)getTableView;
- (NSString *)getName;
- (NSString *)getDescription;
- (NSMutableArray *)getDataSourceArr;
@end
