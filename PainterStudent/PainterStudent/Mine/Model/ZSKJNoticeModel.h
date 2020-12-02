//
//  ZSKJNoticeModel.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/27.
//

#import <Foundation/Foundation.h>



typedef NS_ENUM(NSInteger,ZSKJNoticeModelType)
{
    UnreadNoticeType = 0,
    HaveReadNoticeType = 1,
};












NS_ASSUME_NONNULL_BEGIN

@interface ZSKJNoticeModel : NSObject


@property (nonatomic, assign) ZSKJNoticeModelType type;


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *date;




@end

NS_ASSUME_NONNULL_END
