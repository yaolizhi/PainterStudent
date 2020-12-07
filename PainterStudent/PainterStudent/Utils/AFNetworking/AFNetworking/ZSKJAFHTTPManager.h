//
//  ZSKJAFHTTPManager.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/1.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "ZSKJNetworkModel.h"



NS_ASSUME_NONNULL_BEGIN

@interface ZSKJAFHTTPManager : NSObject

+ (instancetype)shareManager;


-(void)postUrl:(NSString *)url
 parameters:(nullable id)parameters
       success:(nullable void (^)(id responseObject))success
       failure:(nullable void (^)(NSError *error))failure;

-(void)getUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
