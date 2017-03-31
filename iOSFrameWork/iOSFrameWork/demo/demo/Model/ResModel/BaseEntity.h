//
//  BaseEntity.h
//  PanKeTong
//
//  Created by 苏军朋 on 15/9/22.
//  Copyright (c) 2015年 苏军朋. All rights reserved.
//

/**
 *  移动A+ 实体基类
 *
 */

#import "MTLModel.h"
#import "MTLJSONAdapter.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"
#import "HKBaseApi.h"
#import "RequestManager.h"

@interface BaseEntity : MTLModel<MTLJSONSerializing,ResponseDelegate>
{
    RequestManager *_manager;
}

@property (nonatomic, assign) NSInteger  rCode;
@property (nonatomic, copy) NSString  *rMessage;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic, assign) NSInteger tag;

- (instancetype)initWithManage;

+ (NSMutableDictionary *)getBaseFieldWithOthers:(NSDictionary *)dic;

- (void) NetworkRequest:(HKBaseApi *)api;

- (id)convertDic:(NSDictionary *)dic
        toEntity:(Class)cls;
@end
