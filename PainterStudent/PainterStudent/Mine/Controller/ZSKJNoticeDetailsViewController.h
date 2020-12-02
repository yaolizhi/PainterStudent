//
//  ZSKJNoticeDetailsViewController.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/30.
//


#pragma mark 消息详情


typedef NS_ENUM(NSInteger,NoticeDetailsType)
{
    NoticeCourseType = 1,
    NoticeSystemType = 2,
};





#import "ZSKJBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJNoticeDetailsViewController : ZSKJBaseViewController



- (instancetype)initWithType:(NoticeDetailsType)type;


@end

NS_ASSUME_NONNULL_END
