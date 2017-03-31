//
//  ViewController.m
//  iOSFrameWork
//
//  Created by 李慧娟 on 17/2/17.
//  Copyright © 2017年 中原集团. All rights reserved.
//

#import "ViewController.h"
#import "FMDBManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

#warning ----多语言设置
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 150)/2, 100, 150,50)];
    textLabel.backgroundColor = [UIColor orangeColor];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
    textLabel.text = NSLocalizedString(@"皮皮虾，我们走", @"");

#warning ----数据库操作
    //数据库操作类
    FMDBManager *manager = [FMDBManager shareManager];

    //创建表
    NSString *createSql = @"CREATE TABLE IF NOT EXISTS User (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL)";

   BOOL isSuccend = [manager createTableWithSQLSentence:createSql];
    if (!isSuccend) {
        //创建表失败
        NSLog(@"eror");
    }

    //插入数据
    NSDictionary *dic = @{
                          @"id":@(1005),
                          @"name":@"lhj",
                          @"age":@(24)
                          };
    [manager insertDataWithSQLSentence:@"insert into User (id,name,age) values (:id,:name,:age);" andParameterDic:dic];

    //查询
    NSDictionary *resultDic = [manager selectWithSQLSentence:@"SELECT * FROM User"];
    NSLog(@"%@",resultDic);

#warning ----模拟网络请求
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
