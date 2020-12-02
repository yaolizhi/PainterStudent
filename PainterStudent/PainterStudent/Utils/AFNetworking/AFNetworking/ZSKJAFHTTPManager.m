//
//  ZSKJAFHTTPManager.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/1.
//

#import "ZSKJAFHTTPManager.h"

@implementation ZSKJAFHTTPManager


#pragma mark - 创建单例方法
+ (instancetype)shareManager
{
    static ZSKJAFHTTPManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[ZSKJAFHTTPManager alloc]init];
        
    });
    return manager;
}


-(void)postUrl:(NSString *)url
 parameters:(nullable id)parameters
    success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager POST:url parameters:parameters progress:nil success:success failure:failure];
}



-(void)getUrl:(NSString *)url parameters:(id)parameters success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager GET:url parameters:parameters progress:nil success:success failure:failure];
}






@end
