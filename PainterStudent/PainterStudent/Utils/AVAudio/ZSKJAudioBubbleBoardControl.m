//
//  ZSKJAudioBubbleBoardControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJAudioBubbleBoardControl.h"



@interface ZSKJAudioBubbleBoardControl () <AVAudioPlayerDelegate>

@property (nonatomic, strong) UIImageView *bubbleView; //!< 气泡
@property (nonatomic, strong) UILabel *timeLabel; //!< 时间标签





@end




@implementation ZSKJAudioBubbleBoardControl


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:UIColorFromRGB(0xFFE1CC)];
        
        
        [self addSubview:self.bubbleView];
        [self addSubview:self.timeLabel];
        
        
        [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self).offset(20);
            make.centerY.equalTo(self);
            make.width.height.equalTo(@(30));
                    
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.right.equalTo(self.mas_right).offset(-20);
            make.centerY.equalTo(self.mas_centerY);
            
        }];
        
        
        
        
        
        
        
    }
    return self;
}



/// 开始播放
/// @param name 播放的名字
-(void)startPlayWithName:(NSString*)name
{
    [self.bubbleView setAnimationImagesArray:@[imageName(@"bubblePlay1"),imageName(@"bubblePlay2"),imageName(@"bubblePlay3")]];
    [self.bubbleView startAnimating];
    AVAudioPlayer *player = [ZSKJAudioTool playMusicWithMusicName:name];
    [player setDelegate:self];
}


/// 录音时长
/// @param time CGFloat 的时间
-(void)recordTime:(CGFloat)time
{
    [self.timeLabel setText:[NSString stringWithFormat:@"%.2f“",(time >= 60 ? 60 : time)]];
}


#pragma mark - Deletage Method
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (flag)
    {
        [self.bubbleView stopAnimating];
    }
}


- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error
{
    if (error)
    {
        [self.bubbleView stopAnimating];
    }
}

#pragma mark - Getter / Setter
-(UIImageView *)bubbleView
{
    if (!_bubbleView)
    {
        _bubbleView = [[UIImageView alloc]init];
        [_bubbleView setImageName:@"bubblePlay3"];
        [_bubbleView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _bubbleView;
}




-(UILabel *)timeLabel
{
    if (!_timeLabel)
    {
        _timeLabel = [[UILabel alloc]init];
        [_timeLabel setFont:[UIFont systemFontOfSize:13]];
        [_timeLabel setTextColor:KMainColor];
    }
    return _timeLabel;
}








@end
