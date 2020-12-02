//
//  ZSKJAudioStatusBoardControl.m
//  ZZJRecord-Demo
//
//  Created by 姚立志 on 2020/12/2.
//  Copyright © 2020 chefuzzj. All rights reserved.
//

#import "ZSKJAudioStatusBoardControl.h"


@interface ZSKJAudioStatusBoardControl ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *animationView;
@property (nonatomic, strong) UILabel *titleLabel;



@end

@implementation ZSKJAudioStatusBoardControl



-(void)showWithTitle:(NSString*)title witIcon:(NSString*)icon withImages:(NSArray<UIImage *>*)images isAnimation:(BOOL)animation
{
    [self.animationView stopAnimating];
    if (animation)
    {
        [self.animationView setAnimationImagesArray:images];
        [self.animationView startAnimating];
    }
    else
    {
        [self.animationView setImage:[UIImage imageNamed:icon]];
    }
    
    [self.titleLabel setText:title];
    
}




- (instancetype)init
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self)
    {
        [self setBackgroundColor:[UIColor colorWithDisplayP3Red:0 green:0 blue:0 alpha:0.6]];
        
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.animationView];
        [self.bgView addSubview:self.titleLabel];
        
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.width.height.equalTo(@(300));
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
                    
        }];
        
        
        [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.height.equalTo(@(80));
            make.centerX.equalTo(self.bgView.mas_centerX);
            make.bottom.equalTo(self.bgView.mas_centerY).offset(20);
            
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
            
            make.top.equalTo(self.animationView.mas_bottom).offset(20);
            make.centerX.equalTo(self.bgView.mas_centerX);
    
        }];
        
        
        /**
         [self.titleLabel setBackgroundColor:[UIColor redColor]];
         [self.animationView setBackgroundColor:[UIColor orangeColor]];
         */
    }
    return self;
}


#pragma mark - Private Method
-(void)show
{
    [AppWindow addSubview:self];
}

// 隐藏
-(void)hide
{
    [self removeFromSuperview];
}






#pragma mark - Getter / Setter
-(UIView *)bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]init];
        [_bgView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        [_bgView setCornerRadius:CornerRadius_5];
    }
    return _bgView;
}



-(UIImageView *)animationView
{
    if (!_animationView)
    {
        _animationView = [[UIImageView alloc]init];
        [_animationView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _animationView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:KMainColor];
        [_titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}









@end
