//
//  ZSKJHelper.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJHelper : NSObject


+(ZSKJHelper *)shareHelper;


-(NSString*)getDocumentPath:(NSString*)name;



+ (UIViewController *)root;

+(void)pushViewController:(UIViewController*)object animated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
