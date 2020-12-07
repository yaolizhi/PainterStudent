//
//  ZSKJUserinfoModel.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/27.
//

#import "ZSKJUserinfoModel.h"

@implementation ZSKJUserinfoModel

static ZSKJUserinfoModel *shareUserinfo = nil;

+(ZSKJUserinfoModel *)shareUserinfo
{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken,
        ^{
            shareUserinfo = [[self alloc] init];
        });
  
    return shareUserinfo;
}


-(void)setToken:(NSString *)token
{
    _token = token;
    [NSUserDefaults setToken:token];
}

- (BOOL)isLogin
{
    [self setToken:[NSUserDefaults tokenForKey:@"token"]];
    if ([self.token isEqualToString:@"token"])
    {
        [self setIsLogin:NO];
        return NO;
    }
    else
    {
        [self setIsLogin:YES];
        return YES;
    }
    
}






/// 设置数据源对象
/// @param object 数据源对象
-(void)setItemObject:(NSDictionary*)object
{
    [self setName:[object objectForKey:@"name"]];
    [self setAge:[object objectForKey:@"age"]];
    [self setAddress:[object objectForKey:@"address"]];
    [self setMobile:[object objectForKey:@"mobile"]];
    [self setSchool:[object objectForKey:@"school"]];
    [self setHeadimgurl:[object objectForKey:@"headimgurl"]];
    [self setSex:[[object objectForKey:@"sex"] integerValue]];
    [self setUid:[object objectForKey:@"id"]];
    
    [self.imgs setArray:[object objectForKey:@"imgs"]];
    [self.nature setArray:[object objectForKey:@"nature"]];
    [self.hobby setArray:[object objectForKey:@"hobby"]];
    
}



-(void)setSex:(NSInteger)sex
{
    _sex = sex;
    switch (sex)
    {
        case 1:
        {
            [self setSexOption:@"男"];
        }
            break;
        case 2:
        {
            [self setSexOption:@"女"];
        }
            break;
    }
}



-(NSMutableArray *)imgs
{
    if (!_imgs)
    {
        _imgs = [NSMutableArray array];
    }
    return _imgs;
}


-(NSMutableArray *)nature
{
    if (!_nature)
    {
        _nature = [NSMutableArray array];
    }
    return _nature;
}

-(NSMutableArray *)hobby
{
    if (!_hobby)
    {
        _hobby = [NSMutableArray array];
    }
    return _hobby;
}







@end
