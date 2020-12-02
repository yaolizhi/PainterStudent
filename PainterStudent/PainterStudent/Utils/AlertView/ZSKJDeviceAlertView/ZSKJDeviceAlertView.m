//
//  ZSKJDeviceAlertView.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/26.
//

#import "ZSKJDeviceAlertView.h"
#import "ZSKJDeviceBoardControl.h"


@interface ZSKJDeviceAlertView ()


@property (nonatomic, strong) ZSKJDeviceBoardControl *boardView; //!< 承载面板

@property (nonatomic, copy) void (^submitBlock)(NSString *code);






@end

@implementation ZSKJDeviceAlertView


+(void)showWithTitle:(NSString*)title witIcon:(NSString*)icon submitBlock:(void(^)(NSString *code))submitBlcok
{
    ZSKJDeviceAlertView *alert = [[ZSKJDeviceAlertView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [alert addTarget:alert action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    alert.submitBlock = submitBlcok;
    [alert show];
}





-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        
        
        [self addSubview:self.boardView];
        
        
        
        
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
    if (self.submitBlock)
    {
        self.submitBlock(@"确定");
    }
    [self removeFromSuperview];
}





#pragma mark - Getter / Setter
-(ZSKJDeviceBoardControl *)boardView
{
    if (nil == _boardView)
    {
        _boardView = [[ZSKJDeviceBoardControl alloc]initWithFrame:CGRectMake(0, 0, 500, 300)];
        [_boardView setBackgroundColor:KWhiteColor];
        [_boardView setCenter:CGPointMake(self.centerX, self.centerY)];
        [_boardView byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    }
    return _boardView;
}



@end

