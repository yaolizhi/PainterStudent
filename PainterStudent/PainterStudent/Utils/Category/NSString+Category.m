//
//  NSString+Category.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/1.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)



+(NSString *)MD5:(NSString*)text
{
    const char *cStr = [text UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    return  output;
}

@end
