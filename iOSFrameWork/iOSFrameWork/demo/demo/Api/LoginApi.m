//
//  LoginApi.m
//  PanKeTong
//
//  Created by 王雅琦on 16/7/29.
//  Copyright © 2016年 苏军朋. All rights reserved.
//

#import "LoginApi.h"
#import "LoginEntity.h"
@implementation LoginApi



//请求体参数
- (NSDictionary *)getBody
{
    return @{
              @"DomainAccount":_account,
              @"DomainPass":_psd,
              };
}

- (NSString *)getPath
{
    return @"Login";
}


- (Class)getRespClass
{
    return LoginEntity.class;
}


@end
