//
//  NSUserDefaults+Category.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/3.
//

#import "NSUserDefaults+Category.h"

@implementation NSUserDefaults (Category)

+(void)setToken:(NSString*)token
{
    [[NSUserDefaults standardUserDefaults]  setObject:token forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(NSString*)tokenForKey:(NSString*)key
{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (token)
    {
        return token;
    }
    return @"token";
}





@end
