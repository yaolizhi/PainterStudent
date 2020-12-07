//
//  ZSKJOptionScrollView.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/4.
//

#import "ZSKJOptionScrollView.h"

@interface ZSKJOptionScrollView () <UIScrollViewDelegate>

@property (nonatomic,weak) id <ZSKJOptionScrollViewDeletage> optionDeletage;
@property (nonatomic, assign) CGFloat optionWidth; //!< 记录当前视图的宽度
@property (nonatomic, assign) NSInteger page;



@end

@implementation ZSKJOptionScrollView


- (instancetype)initWithFrame:(CGRect)frame witDeletage:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setOptionWidth:frame.size.width];
        [self setOptionDeletage:delegate];
        [self setDelegate:self];
        [self setBounces:NO];
    }
    return self;
}



/// 设置滚动到某个位置
/// @param page 滚动到第几页
-(void)setContentOffPage:(NSInteger)page
{
    [self setContentOffset:CGPointMake(page*self.optionWidth, 0) animated:YES];
}




#pragma mark - Deletage Method UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    
   
    if (page != self.page)
    {
        if ([self.optionDeletage respondsToSelector:@selector(optionScrollPage:)])
        {
            [self.optionDeletage optionScrollPage:page];
            [self setPage:page];
        }
    }
}
@end
