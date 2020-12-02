//
//  ZSKJCourseReadyTableView.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJCourseReadyTableView.h"


@interface ZSKJCourseReadyTableView () <UITableViewDelegate,UITableViewDataSource>

@end


@implementation ZSKJCourseReadyTableView


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerClass:[ZSKJCourseTableViewCell class] forCellReuseIdentifier:@"ZSKJCourseTableViewCell"];
        
        
        
        
        
    }
    return self;
}



#pragma mark - Deletage Method
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (ZSKJCourseTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZSKJCourseTableViewCell"];
    return cell;
}



#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
