//
//  ZSKJAFHTTPManager.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/1.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZSKJAFHTTPManager : NSObject

+ (instancetype)shareManager;


-(void)postUrl:(NSString *)url
 parameters:(nullable id)parameters
    success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

- (void)getUrl:(NSString *)url
                   parameters:(nullable id)parameters
                      success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
