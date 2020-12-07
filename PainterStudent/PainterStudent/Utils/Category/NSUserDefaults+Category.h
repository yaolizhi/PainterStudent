//
//  NSUserDefaults+Category.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (Category)


+(void)setToken:(NSString*)token;

+(NSString*)tokenForKey:(NSString*)key;


@end

NS_ASSUME_NONNULL_END
