//
//  BaseEntity.m
//  PanKeTong
//
//  Created by 苏军朋 on 15/9/22.
//  Copyright (c) 2015年 苏军朋. All rights reserved.
//

#import "BaseEntity.h"


@implementation BaseEntity

- (instancetype)initWithManage
{
    if ([super init]) {
        if (!_manager) {
            _manager = [RequestManager initManagerWithDelegate:self];
        }
    }
    return self;
}

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"rCode":@"RCode",
             @"rMessage":@"RMessage",
             @"total":@"Total",
             };
    
}

+ (NSMutableDictionary *)getBaseFieldMapping
{
    NSMutableDictionary *mdic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                 @"rCode":@"RCode",
                                                                                 @"rMessage":@"RMessage",
                                                                                 @"total":@"Total",
                                                                                 }];
    return mdic;
}

+ (NSMutableDictionary *)getBaseFieldWithOthers:(NSDictionary *)dic
{
    NSMutableDictionary *mdic = [self getBaseFieldMapping];
    [mdic addEntriesFromDictionary:dic];
    return mdic;
}


#pragma mark - <ResponseDelegate>
- (void)respSuc:(id)data andRespApi:(id)respApi
{
    
}


- (void)respFail:(NSError *)error andRespApi:(id)respApi
{
    NSLog(@"请求失败");
}

- (id)convertDic:(NSDictionary *)dic
        toEntity:(Class)cls
{
    return [MTLJSONAdapter modelOfClass:cls
                     fromJSONDictionary:dic
                                  error:nil];
}

@end
