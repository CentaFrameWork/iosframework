//
//  mainPresenter.h
//  demo
//
//  Created by 中原管家 on 2017/2/10.
//  Copyright © 2017年 王雅琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewDelegate.h"

@interface MainPresenter : NSObject

@property (nonatomic,assign) id<MainViewDelegate> mainView;

+ (MainPresenter *)initWithView:(id<MainViewDelegate>)mainView;

- (void)getPresenterDataSource;

- (void)loadTableView;
- (void)addItemClick;

@end
