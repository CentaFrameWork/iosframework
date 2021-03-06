//
//  FMDBManager.m
//  iOSFrameWork
//
//  Created by 李慧娟 on 17/3/28.
//  Copyright © 2017年 中原集团. All rights reserved.
//

#import "FMDBManager.h"

static FMDBManager *dbManager = nil;

@implementation FMDBManager

//此方法返回FMDBManager的单例
+(FMDBManager *)shareManager{
    if (dbManager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dbManager = [[FMDBManager alloc] init];
        });
    }
    return dbManager;
}

//自定义init方法，创建数据库
- (instancetype)init{
    self = [super init];
    if (self) {
        //为数据库文件指定创建的路径
        NSString *dbPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/sqlite.db"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
//        [fileManager removeItemAtPath:dbPath error:nil];
        if (![fileManager fileExistsAtPath:dbPath]) {
            //创建数据库
            _dataBase = [[FMDatabase alloc] initWithPath:dbPath];
        }else{
            //获取数据库
            _dataBase = [FMDatabase databaseWithPath:dbPath];
        }
    }
    return self;
}

//检查表是否存在
- (BOOL) isTableExist:(NSString *)tableName
{
    FMResultSet *rs = [_dataBase executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];

    while ([rs next])
    {

        NSInteger count = [rs intForColumn:@"count"];

        if (0 == count)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }

    return NO;
}



/**
 *创建表
 **/
- (BOOL)createTableWithSQLSentence:(NSString *)sqlSentence{

    if (![_dataBase open]) {
        //数据库打开失败
        return NO;
    }

    //创建一个表
    //    NSString *createSql = [NSString stringWithFormat:@"create table if not exists %@",sentence];
    BOOL isSuccessed =[_dataBase executeUpdate:sqlSentence];

    if (!isSuccessed) {
        //创建表失败,lastErrorMessage 获取到出错的信息
        NSLog(@"error:%@",_dataBase.lastErrorMessage);
    }

    //关闭数据库
    [_dataBase close];
    return isSuccessed;
}


/**
 *插入数据
 **/
- (BOOL)insertDataWithTableName:(NSString *)tableName andParameterDic:(NSDictionary *)parmaDic{

    if (![_dataBase open]) {
        //数据库打开失败
        NSLog(@"************数据库打开失败**************");
        return NO;
    }

    if (![self isTableExist:tableName]) {
        //数据库该表不存在
        NSLog(@"-------%@表不存在-------",tableName);
        return NO;
    }


    NSArray *allKeysArr = [parmaDic allKeys];
    NSString *keyStr = [allKeysArr componentsJoinedByString:@","];

    NSMutableArray *mArr = [NSMutableArray array];
    for (NSString *keyStr in allKeysArr) {
        NSString *newKeyStr = [NSString stringWithFormat:@":%@",keyStr];
        [mArr addObject:newKeyStr];
    }

    NSString *newKeyStr = [mArr componentsJoinedByString:@","];

    
    NSString *inserSql = [NSString stringWithFormat:@"INSERT INTO %@(%@) VALUES(%@)",tableName,keyStr,newKeyStr];
    mArr = nil;

    //开始操作事物
    [_dataBase beginTransaction];
    BOOL isSuccessed = [_dataBase executeUpdate:inserSql withParameterDictionary:parmaDic];

    if (isSuccessed) {
        //插入数据成功
        NSLog(@"**********表%@插入数据成功**********",tableName);
    }else{
        //插入数据失败
        NSLog(@"error:%@",_dataBase.lastErrorMessage);
    }

    //提交事务
    [_dataBase commit];
    [_dataBase close];
    return isSuccessed;
}


/**
 *修改数据
 **/
- (BOOL)updateWithSQLSentence:(NSString *)sentence withParameterDic:(NSDictionary *)parmaDic{
    if (![_dataBase open]) {
        //数据库打开失败
        return NO;
    }

    BOOL isSuccessed = [_dataBase executeUpdate:sentence withParameterDictionary:parmaDic];

    if (!isSuccessed) {
        //修改失败
        NSLog(@"ERROR: %d - %@", _dataBase.lastErrorCode, _dataBase.lastErrorMessage);

    }
    [_dataBase close];
    return isSuccessed;
}



/**
 *查询数据
 **/
- (FMResultSet *)selectWithTableName:(NSString *)tableName andCondition:(NSString *)condition{
    if (![_dataBase open]) {
        //数据库打开失败
        return nil;
    }

    if (![self isTableExist:tableName]) {
        NSLog(@"-------%@表不存在-------",tableName);
        return nil;
    }

    NSString *sqlString;

    if (condition == nil) {
        sqlString = [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
    }else{
        sqlString = [NSString stringWithFormat:@"SELECT * FROM %@ WHIERE %@",tableName,condition];
    }
    
    FMResultSet *rs = [_dataBase executeQuery:sqlString];

    return rs;
}



/**
 *删除数据
 **/
- (BOOL)deleteDataWithTableName:(NSString *)tableName andSQLSentence:(NSString *)sentence{
    if (![_dataBase open]) {
        //数据库打开失败
        return NO;
    }

    if (![self isTableExist:tableName]) {
        NSLog(@"-------%@表不存在-------",tableName);
        return NO;
    }

    BOOL isSuccessed = [_dataBase executeUpdate:sentence];

    if (!isSuccessed) {
        //删除失败
        NSLog(@"ERROR: %d - %@", _dataBase.lastErrorCode, _dataBase.lastErrorMessage);

    }

    [_dataBase close];
    return isSuccessed;



}

@end
