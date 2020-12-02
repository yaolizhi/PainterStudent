//
//  ZSKJCourseOptionControl.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//


#define NoticeDuration 0.2

#import "ZSKJCourseOptionControl.h"


@interface ZSKJCourseOptionControl ()

@property (nonatomic, strong) UIButton *oneBtn;
@property (nonatomic, strong) UIButton *twoBtn;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, assign) NSInteger index; //!< 记住当前选中的



@property (nonatomic,weak) id <ZSKJCourseOptionControlDeletage> deletage;





@end




@implementation ZSKJCourseOptionControl




- (instancetype)initWithFrame:(CGRect)frame withDeletage:(id<ZSKJCourseOptionControlDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setDeletage:deletage];
        
        [self setBackgroundColor:KWhiteColor];
        [self addSubview:self.oneBtn];
        [self addSubview:self.twoBtn];
        [self addSubview:self.lineView];
        
        [self.oneBtn setFrame:CGRectMake(0, 0, 100, frame.size.height)];
        [self.twoBtn setFrame:CGRectMake(self.oneBtn.right, 0, self.oneBtn.width, self.oneBtn.height)];
        
        [self.lineView setFrame:CGRectMake((self.oneBtn.width-30)/2.0, (frame.size.height-1.5),30 ,1.5)];
        
        //默认选中第一个
        [self setIndexTag:0];
    }
    return self;
}


-(void)setOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle
{
    [self.oneBtn setTitle:oneTitle forState:UIControlStateNormal];
    [self.twoBtn setTitle:twoTitle forState:UIControlStateNormal];
}


/// 选中第几个
/// @param index 默认选择第一个下标为0
-(void)setIndexTag:(NSInteger)index
{
    [self.oneBtn setSelected:NO];
    [self.twoBtn setSelected:NO];
    switch (index)
    {
        case 0:
        {
            [self.oneBtn setSelected:YES];
            [UIView animateWithDuration:NoticeDuration animations:^{
                    
                
                [self.lineView setCenterX:self.oneBtn.centerX];
                    
            }];
            
        }
            break;
        case 1:
        {
            [self.twoBtn setSelected:YES];
            [UIView animateWithDuration:NoticeDuration animations:^{
                    
                
                [self.lineView setCenterX:self.twoBtn.centerX];
                    
            }];
        }
            break;
    }
    
    
    if ([self.deletage respondsToSelector:@selector(optionItemAction:)])
    {
        [self.deletage optionItemAction:index];
    }
}


-(void)itemAction:(UIButton*)sender
{
    [self.oneBtn setSelected:NO];
    [self.twoBtn setSelected:NO];
    [sender setSelected:YES];
    
    [UIView animateWithDuration:NoticeDuration animations:^{
            
        
        [self.lineView setCenterX:sender.centerX];
            
    }];
    
    
    
    if (sender.tag != self.index)
    {
        [self setIndex:sender.tag];
        if ([self.deletage respondsToSelector:@selector(optionItemAction:)])
        {
            [self.deletage optionItemAction:sender.tag];
        }
        
    }
}




#pragma mark - Getter / Setter
-(UIButton *)oneBtn
{
    if (!_oneBtn)
    {
        _oneBtn = [[UIButton alloc]init];
        [_oneBtn addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [_oneBtn setTitleColor:KTextColor forState:UIControlStateNormal];
        [_oneBtn setTitleColor:KMainColor forState:UIControlStateSelected];
        [_oneBtn setTag:0];
    }
    return _oneBtn;
}


-(UIButton *)twoBtn
{
    if (!_twoBtn)
    {
        _twoBtn = [[UIButton alloc]init];
        [_twoBtn addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [_twoBtn setTitleColor:KTextColor forState:UIControlStateNormal];
        [_twoBtn setTitleColor:KMainColor forState:UIControlStateSelected];
        [_twoBtn setTag:1];
    }
    return _twoBtn;
}



-(UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:KMainColor];
    }
    return _lineView;
}











@end

