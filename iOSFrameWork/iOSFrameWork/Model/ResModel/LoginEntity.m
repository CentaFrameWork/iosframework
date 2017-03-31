//
//  LoginEntity.m
//  PanKeTong
//
//  Created by 苏军朋 on 15/9/30.
//  Copyright (c) 2015年 苏军朋. All rights reserved.
//

#import "LoginEntity.h"
#import "LoginApi.h"

@implementation LoginEntity

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"result":@"Result",
             };
    
}

+(NSValueTransformer *)resultJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[LoginResultEntity class]];
}

- (void)NetworkRequest:(HKBaseApi *)api
{
    [_manager sendRequest:api];
}

- (void)respSuc:(id)data andRespClass:(id)cls
{
    
   LoginEntity *entity = [self convertDic:data toEntity:cls];
    
    NSLog(@"entity = %@",entity);
    
    if ([self.delegate respondsToSelector:@selector(loginDelegate:)]) {
        [self.delegate loginDelegate:entity];
    }
}


@end
