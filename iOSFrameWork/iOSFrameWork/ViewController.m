//
//  ViewController.m
//  iOSFrameWork
//
//  Created by 李慧娟 on 17/2/17.
//  Copyright © 2017年 中原集团. All rights reserved.
//

#import "ViewController.h"
#import "FMDBManager.h"
#import "UIView+YYAdd.h"
#import "DemoViewController.h"

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
    for (int i = 0; i < 5; i ++) {
        int idNum = 2000 + i;
        NSDictionary *dic = @{
                              @"id":@(idNum),
                              @"name":@"lhj",
                              @"age":@(24)
                              };
        [manager insertDataWithTableName:@"User" andParameterDic:dic];
    }


    //查询
    FMResultSet *rs = [manager selectWithTableName:@"User" andCondition:nil];
    NSLog(@"%@",rs);
    NSMutableArray *mArr = [NSMutableArray array];
    while ([rs next]){
        //遍历数据库
        int idNum = [rs intForColumn:@"id"];
        NSString *name = [rs stringForColumn:@"name"];
        int age = [rs intForColumn:@"age"];

        NSDictionary *dic = @{
                              @"id":@(idNum),
                              @"name":name,
                              @"age":@(age)
                              };
        [mArr addObject:dic];

    }

    NSLog(@"%@",mArr);
    //在查询数据库的方法中没有关闭数据库，得到查询结果之后，要关闭数据库
    [manager.dataBase close];


#warning ----模拟网络请求
    UIButton *imitateRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imitateRequestButton.frame = CGRectMake(textLabel.left, textLabel.bottom + 50, textLabel.width, textLabel.height);
    [imitateRequestButton setTitle:@"模拟网络请求" forState:UIControlStateNormal];
    imitateRequestButton.backgroundColor = [UIColor orangeColor];
    [imitateRequestButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [imitateRequestButton addTarget:self action:@selector(imitateRequestAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:imitateRequestButton];
    
}

/**
 *  模拟网络请求
 */
- (void)imitateRequestAction
{
    DemoViewController *demoVC = [DemoViewController new];
    
    [self presentViewController:demoVC animated:YES completion:^{
        
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
