//
//  ZSKJUserinfoModel.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/27.
//

#pragma mark 全局单例，用于项目中需要访问用户信息的数据模型




#import <Foundation/Foundation.h>
#import "NSUserDefaults+Category.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZSKJUserinfoModel : NSObject

@property (nonatomic, assign) BOOL isLogin; //!< 是否登录

@property (nonatomic, copy) NSString *token; //!< 用户的token
@property (nonatomic, copy) NSString *name; //!< 姓名
@property (nonatomic, copy) NSString *age; //!< 年龄
@property (nonatomic, copy) NSString *address; //!< 地域
@property (nonatomic, copy) NSString *mobile; //!< 手机号码
@property (nonatomic, copy) NSString *school; //!< 毕业学校
@property (nonatomic, copy) NSString *headimgurl; //!< 头像
@property (nonatomic, copy) NSString *password; //!< 密码
@property (nonatomic, copy) NSString *uid; //!< 用户ID
@property (nonatomic, copy) NSString *sexOption; //!< 向别
@property (nonatomic, assign) NSInteger sex; //!<    1男 2女





@property (nonatomic, strong) NSMutableArray *imgs; //!< 作品
@property (nonatomic, strong) NSMutableArray *nature; //!< 性格
@property (nonatomic, strong) NSMutableArray *hobby; //!< 兴趣





+(ZSKJUserinfoModel *)shareUserinfo;



/// 设置数据源对象
/// @param object 数据源对象
-(void)setItemObject:(NSDictionary*)object;





@end

NS_ASSUME_NONNULL_END
