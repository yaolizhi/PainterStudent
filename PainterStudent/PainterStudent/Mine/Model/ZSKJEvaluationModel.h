//
//  ZSKJEvaluationModel.h
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJEvaluationModel : NSObject

@property (nonatomic, copy) NSString *course_id; //!< 课程id
@property (nonatomic, copy) NSString *date; //!< 日期
@property (nonatomic, copy) NSString *time; //!< 时间
@property (nonatomic, assign) NSInteger status; //!< 1未结束 2 已结束
@property (nonatomic, assign) NSInteger type; //!< 1 正式课 2临时课
@property (nonatomic, copy) NSString *title; //!< 课程标题
@property (nonatomic, copy) NSString *img; //!< 可能图片
@property (nonatomic, copy) NSString *type_text; //!< type中文标示
@property (nonatomic, copy) NSString *status_text; //!< status 中文标示



@end

NS_ASSUME_NONNULL_END
