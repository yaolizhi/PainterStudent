//
//  ZSKJAudioBtnControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/1.
//
#import "ZSKJAudioBtnControl.h"




@interface ZSKJAudioBtnControl ()

@property (nonatomic, strong) UILabel *titlelabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic,weak) id <ZSKJAudioBtnControlDeletage> deletage;




@end

@implementation ZSKJAudioBtnControl


- (instancetype)initWithDeletage:(id<ZSKJAudioBtnControlDeletage>)deletage
{
    self = [super init];
    if (self)
    {
        [self setDeletage:deletage];
        [self addActionTarget:self];
        [self addSubviews:YES];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame wihtDeletage:(id<ZSKJAudioBtnControlDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setDeletage:deletage];
        [self addActionTarget:self];
        [self addSubviews:YES];
    }
    return self;
}



#pragma mark - Private Method
-(void)addSubviews:(BOOL)view
{
    if (view)
    {
        [self addSubview:self.titlelabel];
        [self addSubview:self.iconView];
        
        
        [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.right.equalTo(self.titlelabel.mas_left).offset(-20);
            make.centerY.equalTo(self.mas_centerY);
            
        }];
        
        
    }
    
}






/// 添加数据源数据
/// @param target 代理对象
-(void)addActionTarget:(nullable id)target
{
    [self addTarget:target action:@selector(recordTouchDownAction:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:target action:@selector(recordTouchUpOutsideAction:) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:target action:@selector(recordTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:target action:@selector(recordTouchDragEnterAction:) forControlEvents:UIControlEventTouchDragEnter];
    [self addTarget:target action:@selector(recordTouchDragInsideAction:) forControlEvents:UIControlEventTouchDragInside];
    [self addTarget:target action:@selector(recordTouchDragOutsideAction:) forControlEvents:UIControlEventTouchDragOutside];
    [self addTarget:target action:@selector(recordTouchDragExitAction:) forControlEvents:UIControlEventTouchDragExit];
}











- (void)setButtonStateWithRecording
{
    [self.iconView setImageName:@"audioComment"];
    [self setBackgroundColor:UIColorFromRGB(0xFFECD9)];
}

- (void)setButtonStateWithNormal
{
    [self.iconView setImageName:@"audioCommentPrior"];
    [self setBackgroundColor:KMainColor];
}


#pragma mark - Private Method 事件方法回调
-(void)recordTouchDownAction:(UIControl*)sender;
{
    [self setButtonStateWithRecording];
    
    if ([self.deletage respondsToSelector:@selector(recordTouchDownAction:)])
    {
        [self.deletage recordTouchDownAction:sender];
    }
}



-(void)recordTouchUpOutsideAction:(UIControl*)sender
{
    [self setButtonStateWithNormal];
    
    if ([self.deletage respondsToSelector:@selector(recordTouchUpOutsideAction:)])
    {
        [self.deletage recordTouchUpOutsideAction:sender];
    }
}

-(void)recordTouchUpInsideAction:(UIControl*)sender
{
    [self setButtonStateWithNormal];
    if ([self.deletage respondsToSelector:@selector(recordTouchUpInsideAction:)])
    {
        [self.deletage recordTouchUpInsideAction:sender];
    }
}
-(void)recordTouchDragEnterAction:(UIControl*)sender
{
    if ([self.deletage respondsToSelector:@selector(recordTouchDragEnterAction:)])
    {
        [self.deletage recordTouchDragEnterAction:sender];
    }
}


-(void)recordTouchDragInsideAction:(UIControl*)sender
{
    if ([self.deletage respondsToSelector:@selector(recordTouchDragInsideAction:)])
    {
        [self.deletage recordTouchDragInsideAction:sender];
    }
}
-(void)recordTouchDragOutsideAction:(UIControl*)sender
{
    if ([self.deletage respondsToSelector:@selector(recordTouchDragOutsideAction:)])
    {
        [self.deletage recordTouchDragOutsideAction:sender];
    }
}
-(void)recordTouchDragExitAction:(UIControl*)sender
{
    if ([self.deletage respondsToSelector:@selector(recordTouchDragExitAction:)])
    {
        [self.deletage recordTouchDragExitAction:sender];
    }
}

#pragma mark - Getter / Setter
-(UILabel *)titlelabel
{
    if (!_titlelabel)
    {
        _titlelabel = [[UILabel alloc]init];
        [_titlelabel setText:@"按住进行语音点评"];
        [_titlelabel setFont:[UIFont systemFontOfSize:14]];
        [_titlelabel setTextColor:KWhiteColor];
    }
    return _titlelabel;
}



-(UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc]init];
        [_iconView setImageName:@"audioCommentPrior"];
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
        
    }
    return _iconView;
}








@end
