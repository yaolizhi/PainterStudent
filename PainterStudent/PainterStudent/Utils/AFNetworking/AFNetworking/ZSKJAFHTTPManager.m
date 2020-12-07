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
    success:(nullable void (^)(id responseObject))success
       failure:(nullable void (^)(NSError *error))failure
{
    
    [MBProgressHUD showHUDAddedTo:AppWindow animated:YES];
    
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        [MBProgressHUD hideHUDForView:AppWindow animated:YES];
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        NSString *msg = [responseObject objectForKey:@"msg"];
        switch (code)
        {
            case 0:
            case 401:
            {
                [MBHUD showError:msg];
                
                [ZSKJHelper setLogin:YES];
            }
                break;
        }
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
        [MBProgressHUD hideHUDForView:AppWindow animated:YES];
        failure(error);
    }];
}



-(void)getUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    [MBProgressHUD showHUDAddedTo:AppWindow animated:YES];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         [MBProgressHUD hideHUDForView:AppWindow animated:YES];
         NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
         NSString *msg = [responseObject objectForKey:@"msg"];
         switch (code)
         {
             case 0:
             case 401:
             {
                 [MBHUD showError:msg];
             }
                 break;
         }
        success(responseObject);
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
         [MBProgressHUD hideHUDForView:AppWindow animated:YES];
     }];
}







@end
