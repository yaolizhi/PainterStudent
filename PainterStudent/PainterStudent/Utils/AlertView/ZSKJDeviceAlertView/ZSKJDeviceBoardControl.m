//
//  ZSKJDeviceBoardControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/26.
//

#import "ZSKJDeviceBoardControl.h"
#import "ZSKJAudioTool.h"
#import "FMWModel.h"


@interface ZSKJDeviceBoardControl ()

@property (nonatomic, strong) ZSKJAudioTool *audioRecorder;
@property (nonatomic, assign) NSInteger step; //!< 记录当前步骤
/**
 告后来人，
 可以用UICollectionView实现,但是需要处理一些逻辑，
 我就直接了当，用这种方式处理了，代码能看懂就行。
 */
@property (nonatomic, strong) UIImageView *step1View;
@property (nonatomic, strong) UIImageView *step2View;
@property (nonatomic, strong) UIImageView *step3View;
@property (nonatomic, strong) UIImageView *step4View;
@property (nonatomic, strong) UIImageView *step5View;
@property (nonatomic, strong) UIImageView *iconView; //!< 预览图标


@property (nonatomic, strong) UIView *preview; //!< 视频预览图标


@property (nonatomic, strong) UILabel *tipLabel; //!< 上面提示标签
@property (nonatomic, strong) UILabel *topLabel; //!< 上面提示标签
@property (nonatomic, strong) UILabel *bottomLeftLabel; //!< 下面左边提示标签
@property (nonatomic, strong) UILabel *bottomRightLabel; //!< 下面面右边提示标签
@property (nonatomic, strong) UILabel *bootomLabel; //!< 底部标签用于不同场景


@property (nonatomic, strong) UIButton *optionBtn;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) FMWModel *fmodel;








@end

@implementation ZSKJDeviceBoardControl



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:KWhiteColor];
        [self setCornerRadius:CornerRadius_8];
        
        [self addSubview:self.tipLabel];
        [self addSubview:self.step1View];
        [self addSubview:self.step2View];
        [self addSubview:self.step3View];
        [self addSubview:self.step4View];
        [self  addSubview:self.step5View];
        [self addSubview:self.preview];
        [self addSubview:self.iconView];
        [self addSubview:self.topLabel];
        [self addSubview:self.bottomLeftLabel];
        [self addSubview:self.bottomRightLabel];
        [self addSubview:self.bootomLabel];
        
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
        [self addSubview:self.optionBtn];
        [self setStep:1];
        
        
        
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@(25));
        }];
        
        [self.step1View mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.tipLabel.mas_right).offset(20);
            make.centerY.equalTo(self.tipLabel);
                    
        }];
        
        [self.step2View mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.step1View.mas_right);
            make.centerY.equalTo(self.tipLabel);
                    
        }];
        
        
        [self.step3View mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.step2View.mas_right);
            make.centerY.equalTo(self.tipLabel);
                    
        }];
        
        
        [self.step4View mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.step3View.mas_right);
            make.centerY.equalTo(self.tipLabel);
                    
        }];
        
        
        [self.step5View mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.step4View.mas_right);
            make.centerY.equalTo(self.tipLabel);
                    
        }];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.tipLabel.mas_bottom).offset(20);
            make.centerX.equalTo(self.mas_centerX);
            make.height.width.equalTo(@(100));
            
        }];
        
        [self.preview mas_makeConstraints:^(MASConstraintMaker *make) {

            make.height.width.top.centerX.equalTo(self.iconView);
        }];
        
        [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.preview.mas_bottom).offset(20);
            make.centerX.equalTo(self.mas_centerX);
        }];
        
        
        [self.bootomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.topLabel.mas_bottom).offset(10);
            make.centerX.equalTo(self.topLabel);
            
        }];
        
        [self.bottomLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.topLabel.mas_bottom).offset(10);
            make.right.equalTo(self.mas_centerX);
        }];
        
        [self.bottomRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.bottomLeftLabel.mas_right);
            make.centerY.equalTo(self.bottomLeftLabel);
        }];
        
        
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.bottom.equalTo(self);
            make.height.equalTo(@(44));
            make.right.equalTo(self.mas_centerX);
            
        }];
        
        
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.leftBtn.mas_right);
            make.right.equalTo(self.mas_right);
            make.bottom.height.equalTo(self.leftBtn);
            
        }];
        
        [self.optionBtn mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.bottom.right.equalTo(self);
            make.height.equalTo(@(44));
                    
        }];
        
        
        
        
        
//        self.fmodel = [[FMWModel alloc]initWithFMVideoViewType:TypeDefine superView:self.preview];
//
        
        
        [self.audioRecorder setName:@"audio"];
        
        
        
        
        
        
        
        
    }
    return self;
}




#pragma mark - Private Method
-(void)optionBtnAction:(UIButton *)sender
{
    switch (self.step)
    {
        case 1:
        {
            [self setStep:101];
        }
            break;
        case 2:
        {
            [self setStep:3];
        }
            break;
        case 3:
        {
            [self setStep:4];
        }
            break;
        case 5:
        {
            
        }
            break;
            
    }
}



-(void)leftBtnAction:(UIButton *)sender
{
    switch (self.step)
    {
        case 101:
        {
            [self setStep:1];
        }
            break;
    }
}

-(void)rightBtnAction:(UIButton*)sender
{
    switch (self.step)
    {
        case 101:
        {
            [self setStep:2];
            [self.optionBtn setTag:2];
        }
            break;
        case 4:
        {
            [self setStep:5];
            [self.optionBtn setTag:5];
        }
            break;
    }
}

#pragma mark 开始录音
/// 开始录音
-(void)startRecord
{
    [self.audioRecorder startRecord];
}

/// 停止录音
-(void)stopRecord
{
    [self.audioRecorder stopRecord];
    
    
    
}











#pragma mark 设置步骤
- (void)setStep:(NSInteger)step
{
    _step = step;
    /**
     先设置所有步骤都为灰色
     */
    
    [self.iconView setHidden:NO];
    [self.preview setHidden:YES];
    [self.optionBtn setHidden:YES];
    [self.leftBtn setHidden:YES];
    [self.rightBtn setHidden:YES];
    [self.topLabel setHidden:YES];
    [self.bottomLeftLabel setHidden:YES];
    [self.bottomRightLabel setHidden:YES];
    [self.bootomLabel setHidden:YES];
    
    [self.step1View setImageName:@"stepNormalr"];
    [self.step2View setImageName:@"stepNormalr"];
    [self.step3View setImageName:@"stepNormalr"];
    [self.step4View setImageName:@"stepNormalr"];
    [self.step5View setImageName:@"stepNormalr"];
    [self.iconView stopAnimating];
    
    
    
    switch (step)
    {
#pragma mark case 1
        case 1:
        {
            [self.optionBtn setHidden:NO];
            [self.topLabel setHidden:NO];
            [self.optionBtn setTitle:@"开始检测" forState:UIControlStateNormal];
            [self.topLabel setText:@"为了保证您能正常上课，现在我们进行设备检测"];
            [self.iconView setImageName:@"inspect"];
            
        }
            break;
#pragma mark case 101 是第一步的扩展
        case 101:
        {
            [self.optionBtn setHidden:YES];
            [self.iconView setHidden:YES];
            [self.preview setHidden:NO];
            [self.leftBtn setHidden:NO];
            [self.rightBtn setHidden:NO];
            [self.topLabel setHidden:NO];
            [self.bootomLabel setHidden:NO];
            
            [self.leftBtn setTitle:@"看不到" forState:UIControlStateNormal];
            [self.rightBtn setTitle:@"能看到" forState:UIControlStateNormal];
            [self.topLabel setText:@"视频检测"];
            [self.bootomLabel setText:@"是否可以正常看到自己？"];
            [self.iconView setImageName:@"inspect"];
            
            [self.step1View setImageName:@"stepSelect"];
            
            
            if (self.fmodel.recordState == FMRecordStateFinish)
            {
                [self.fmodel reset];
            }
            else
            {
                [self.fmodel stopRecord];
                [self.fmodel reset];
            }
            
        }
            break;
#pragma mark case 2 开始录音
        case 2:
        {
            [self.optionBtn setHidden:NO];
            [self.topLabel setHidden:NO];
            [self.bottomLeftLabel setHidden:NO];
            [self.bottomRightLabel setHidden:NO];
            [self.bottomRightLabel setTextColor:KRedColor];
            [self.optionBtn setTitle:@"开始录音" forState:UIControlStateNormal];
            [self.topLabel setText:@"话筒检测"];
            
            [self.iconView setImageName:@"record"];
            [self.step1View setImageName:@"stepSelect"];
            [self.step2View setImageName:@"stepSelect"];
        }
            break;
#pragma mark case 3  停止录音
        case 3:
        {
            [self.optionBtn setHidden:NO];
            [self.topLabel setHidden:NO];
            [self.bottomLeftLabel setHidden:NO];
            [self.bottomRightLabel setHidden:NO];
            [self.bottomRightLabel setTextColor:KRedColor];
            
            [self.optionBtn setTitle:@"停止录音" forState:UIControlStateNormal];
            [self.topLabel setText:@"话筒检测"];
            
            [self.iconView setImageName:@"record3"];
            [self.step1View setImageName:@"stepSelect"];
            [self.step2View setImageName:@"stepSelect"];
            [self.step3View setImageName:@"stepSelect"];
            
            [self.iconView setAnimationImagesArray:@[imageName(@"record"),imageName(@"record1"),imageName(@"record2"),imageName(@"record3")]];
            
            [self.iconView startAnimating];
            [self startRecord];
        }
            break;
#pragma mark case 4  播放录音
        case 4:
        {
            /**
             先停止录音
             */
            [self stopRecord];
            
            [self.leftBtn setHidden:NO];
            [self.rightBtn setHidden:NO];
            [self.topLabel setHidden:NO];
            [self.bootomLabel setHidden:NO];
            [self.leftBtn setTitle:@"听不到" forState:UIControlStateNormal];
            [self.rightBtn setTitle:@"能听到" forState:UIControlStateNormal];
            [self.topLabel setText:@"检测声音"];
            [self.bootomLabel setText:@"录音内容播放中是否听到声音"];
            [self.iconView setImageName:@"play3"];
            
    
            
            [self.step1View setImageName:@"stepSelect"];
            [self.step2View setImageName:@"stepSelect"];
            [self.step3View setImageName:@"stepSelect"];
            [self.step4View setImageName:@"stepSelect"];
            
            
            
            [self.iconView setAnimationImagesArray:@[imageName(@"play"),imageName(@"play1"),imageName(@"play2"),imageName(@"play3")]];
            [self.iconView startAnimating];
            
            [ZSKJAudioTool playMusicWithMusicName:@"audio"];
        }
            break;
#pragma mark case 5
        case 5:
        {
            [self.optionBtn setHidden:NO];
            [self.topLabel setHidden:NO];
            [self.bootomLabel setHidden:NO];
            [self.topLabel setTextColor:KGreenColor];
            
            
            
            [self.topLabel setText:@"恭喜您，您的网速极好！"];
            [self.bootomLabel setText:@"设备已通过检测，可以正常进行上课"];
            [self.optionBtn setTitle:@"确定" forState:UIControlStateNormal];
            [self.iconView setImageName:@"wifOk"];
            
            [self.step1View setImageName:@"stepSelect"];
            [self.step2View setImageName:@"stepSelect"];
            [self.step3View setImageName:@"stepSelect"];
            [self.step4View setImageName:@"stepSelect"];
            [self.step5View setImageName:@"stepSelect"];
        }
            break;
    }
}













#pragma mark - Getter / Setter
-(UIImageView *)step1View
{
    if (!_step1View)
    {
        _step1View = [[UIImageView alloc]init];
        
    }
    return _step1View;
}

-(UIImageView *)step2View
{
    if (!_step2View)
    {
        _step2View = [[UIImageView alloc]init];
    }
    return _step2View;
}

-(UIImageView *)step3View
{
    if (!_step3View)
    {
        _step3View = [[UIImageView alloc]init];
    }
    return _step3View;
}

-(UIImageView *)step4View
{
    if (!_step4View)
    {
        _step4View = [[UIImageView alloc]init];
    }
    return _step4View;
}

-(UIImageView *)step5View
{
    if (!_step5View)
    {
        _step5View = [[UIImageView alloc]init];
    }
    return _step5View;
}


-(UIView *)preview
{
    if (!_preview)
    {
        _preview = [[UIView alloc]init];
        [_preview setCornerRadius:50];
        [_preview setBackgroundColor:KLineColor];
    }
    return _preview;
}

-(UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc]init];
    }
    return _iconView;
}





-(UILabel *)tipLabel
{
    if (!_tipLabel)
    {
        _tipLabel = [[UILabel alloc]init];
        [_tipLabel setFont:[UIFont systemFontOfSize:17]];
        [_tipLabel setTextColor:KTextColor];
        [_tipLabel setText:@"设备检测"];
    }
    return _tipLabel;
}



-(UILabel *)topLabel
{
    if (!_topLabel)
    {
        _topLabel = [[UILabel alloc]init];
        [_topLabel setFont:[UIFont systemFontOfSize:17]];
        [_topLabel setTextColor:KTextColor];
    }
    return _topLabel;
}


-(UILabel *)bottomLeftLabel
{
    if (!_bottomLeftLabel)
    {
        _bottomLeftLabel = [[UILabel alloc]init];
        [_bottomLeftLabel setFont:[UIFont systemFontOfSize:14]];
        [_bottomLeftLabel setTextColor:KTextColor];
        [_bottomLeftLabel setText:@"请点击“开始录音”并念出这句文字："];
    }
    return _bottomLeftLabel;
}


-(UILabel *)bottomRightLabel
{
    if (!_bottomRightLabel)
    {
        _bottomRightLabel = [[UILabel alloc]init];
        [_bottomRightLabel setFont:[UIFont systemFontOfSize:14]];
        [_bottomRightLabel setTextColor:KTextColor];
        [_bottomRightLabel setText:@"我正在检测话筒与扬声器"];
    }
    return _bottomRightLabel;
}



-(UILabel *)bootomLabel
{
    if (!_bootomLabel)
    {
        _bootomLabel = [[UILabel alloc]init];
        [_bootomLabel setFont:[UIFont systemFontOfSize:14]];
        [_bootomLabel setTextColor:KTextColor];
    }
    return _bootomLabel;
}


-(UIButton *)leftBtn
{
    if (!_leftBtn)
    {
        _leftBtn = [[UIButton alloc]init];
        [_leftBtn setBackgroundColor:KLineColor];
        [_leftBtn addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}



-(UIButton *)rightBtn
{
    if (!_rightBtn)
    {
        _rightBtn = [[UIButton alloc]init];
        [_rightBtn setBackgroundColor:KMainColor];
        [_rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}


-(UIButton *)optionBtn
{
    if (!_optionBtn)
    {
        _optionBtn = [[UIButton alloc]init];
        [_optionBtn setBackgroundColor:KMainColor];
        [_optionBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        [_optionBtn addTarget:self action:@selector(optionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _optionBtn;
}


-(ZSKJAudioTool *)audioRecorder
{
    if (!_audioRecorder)
    {
        _audioRecorder = [[ZSKJAudioTool alloc]init];
    }
    return _audioRecorder;
}



@end
