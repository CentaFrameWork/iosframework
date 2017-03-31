//
//  FMDBManager.h
//  iOSFrameWork
//
//  Created by 李慧娟 on 17/3/28.
//  Copyright © 2017年 中原集团. All rights reserved.
//----基于FMDB的数据库操作类工具

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import <sqlite3.h>

/*
 (1）FMDatabase:
 一个FMDatabase对象就代表一个单独的SQLite数据库
 用来执行SQL语句

 （2）FMResultSet:
 使用FMDatabase执行查询后的结果集

 （3）FMDatabaseQueue:
 用于在多线程中执行多个查询或更新，它是线程安全的

 */

@interface FMDBManager : NSObject


@property (nonatomic,strong)FMDatabase *dataBase;

//此方法返回DBManager的单例
+(FMDBManager *)shareManager;

/**
 *创建表
 sentence 表名（字段1，字段2...）
 **/
- (BOOL)createTableWithSQLSentence:(NSString *)sentence;

/**
 *插入数据
 **/
- (BOOL)insertDataWithTableName:(NSString *)tableName andParameterDic:(NSDictionary *)parmaDic;

/**
 *修改数据
 **/
- (BOOL)updateWithSQLSentence:(NSString *)sentence withParameterDic:(NSDictionary *)parmaDic;

/**
 *查询数据
 **/
- (FMResultSet *)selectWithTableName:(NSString *)tableName andCondition:(NSString *)condition;

/**
 *删除数据
 **/
- (BOOL)deleteDataWithTableName:(NSString *)tableName andSQLSentence:(NSString *)sentence;




@end
