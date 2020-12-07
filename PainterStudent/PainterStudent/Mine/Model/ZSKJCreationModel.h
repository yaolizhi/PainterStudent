//
//  ZSKJCreationModel.h
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJCreationModel : NSObject

@property (nonatomic, copy) NSString *report_time; //!< 作品时间
@property (nonatomic, copy) NSString *title; //!< 标题
@property (nonatomic, copy) NSString *user_report;  //!< 预览图片的URl地址

@end

NS_ASSUME_NONNULL_END
