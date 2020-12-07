//
//  ZSKJURL.h
//  Painteruser
//
//  Created by 姚立志 on 2020/12/3.
//

#ifndef ZSKJURL_h
#define ZSKJURL_h

#define ProductBaseServer @"http://1v1zhibo.zhengshangwl.com/"


/* 用户登录 */
#define Login_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/login"]

/* 设置密码 */
#define SetPasswod_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/setPasswod"]
/* 个人简历|个人信息 */
#define UserInfoByToken_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/getUserInfoByToken"]

/* 学生的排课信息 */
#define Schedules_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/tomorrowSchedules"]

/* 学生下次课程 */
#define NextSchedule_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/nextSchedule"]

/* 学生学习报告 */
#define MyReport_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/myReport"]

/* 学生课程列表 */
#define MySchedule_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/mySchedule"]

/* 学生作品 */
#define Myworks_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/myworks"]

/* 学生报告详情 */
#define ReadReport_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/readReport"]


/* 学生个人信息|我的 */
#define UserInfoByToken_URL [NSString stringWithFormat:@"%@%@",ProductBaseServer,@"index/user/getUserInfoByToken"]










#endif /* ZSKJURL_h */
