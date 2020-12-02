//
//  CHGAudioTool.m
//  RecordVoiceDemo
//
//  Created by 姚立志 on 2020/11/26.
//  Copyright © 2020 allison. All rights reserved.
//

#import "ZSKJAudioTool.h"

@interface ZSKJAudioTool ()

@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, copy) NSString *documentPath;


@end

@implementation ZSKJAudioTool

static NSMutableDictionary *soundIDs;
static NSMutableDictionary *players;


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        soundIDs = [NSMutableDictionary dictionary];
        players = [NSMutableDictionary dictionary];
    }
    return self;
}







#pragma mark - 实例方法
/// 根据录音名称进行初始化
/// @param name 录音文件
- (void)setName:(NSString*)name
{
    // 获取tmp目录路径
    NSString *tempDirectory = NSTemporaryDirectory();
    NSString *tmpPath = [tempDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.caf",name]];
    NSLog(@"临时路径：%@",tmpPath);
    
    
                         
//         NSString *path =  [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.caf",name]];
    // url : 录音文件的路径 (这里为便于测试，我用桌面路径,项目中需要用沙盒路径)
//    [self setPath:@"/Users/yaolizhi/Desktop/audio/test.caf"];
    [self setDocumentPath:tmpPath];
    NSURL *url = [NSURL URLWithString:self.documentPath];
    
    // setting:录音的设置项
    NSDictionary *configDic = @{// 编码格式
                                AVFormatIDKey:@(kAudioFormatLinearPCM),
                                // 采样率
                                AVSampleRateKey:@(11025.0),
                                // 通道数
                                AVNumberOfChannelsKey:@(2),
                                // 录音质量
                                AVEncoderAudioQualityKey:@(AVAudioQualityMax)
                                };
    NSError *error = nil;
    self.audioRecorder = [[AVAudioRecorder alloc]initWithURL:url settings:configDic error:&error];
    [self.audioRecorder setDelegate:self];
    if (error)
    {
        NSLog(@"error:%@",error);
    }
    // 准备录音(系统会给我们分配一些资源)
    [self.audioRecorder prepareToRecord];
}



/// 开始录音
-(void)startRecord
{
    NSLog(@"开始录音");
    [self.audioRecorder record];
}

/// 停止录音
-(void)stopRecord
{
    NSLog(@"停止录音");
    [self.audioRecorder stop];
    [self recordDestroy];
}



/// 录制的时间
-(CGFloat)recordTime
{
    return self.audioRecorder.currentTime;
}


///销毁当前录音当前对象
-(void)recordDestroy
{
    /**
     把当前的对象设置为nil,然后在初始化
     */
    self.audioRecorder = nil;
}



/// 录制的路径
-(NSString*)recordPath
{
    return self.documentPath;
}






#pragma mark - Deletage Method
#pragma mark AVAudioRecorderDelegate
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag;
{
    if (flag)
    {
        NSString *path = [LameTool audioToMP3:self.documentPath isDeleteSourchFile:NO];
        NSLog(@"mp3文件转码成功\n路径为:%@",path);
        
    }
}


- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError * __nullable)error
{
    
}




#pragma mark AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
}

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error
{
    
}





#pragma mark - + 类方法
+ (void)initialize
{
    soundIDs = [NSMutableDictionary dictionary];
    players = [NSMutableDictionary dictionary];
}

//  播放音频
+ (void)playSoundWithSoundName:(NSString *)soundName
{
    // 1.从字典中取出之前保存的soundID
    SystemSoundID soundID = [[soundIDs objectForKey:soundName] unsignedIntValue];
    
    // 2.如果取出为0,表示之前没有加载当前声音
    if (soundID == 0) {
        // 2.1.根据资源文件加载soundID
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        AudioServicesCreateSystemSoundID(url, &soundID);
        
        // 2.2.存入字典
        [soundIDs setObject:@(soundID) forKey:soundName];
    }
    
    // 3.播放声音
    AudioServicesPlaySystemSound(soundID);
}


// 开始播放音乐
+ (AVAudioPlayer *)playMusicWithMusicName:(NSString *)musicName
{
    // 1.从字典中取出之前保存的播放器
    AVAudioPlayer *player = players[musicName];
    
    // 2.判断播放器是否为nil,如果为空,则创建播放器
    if (player == nil)
    {
        // 2.1.加载对应的资源
        
        
        NSString *tempDirectory = NSTemporaryDirectory();
        NSString *tmpPath = [tempDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.caf",musicName]];
        
        NSError *error = nil;
        // 2.2.创建播放器
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:tmpPath] error:&error];
        if (error)
        {
            return nil;
        }
        else
        {
            // 2.3.将播放器存入字典
            [players setObject:player forKey:musicName];
        }
        
        
    }
    
    // 3.播放音乐
    [player play];
    
    return player;
}





// 暂停播放音乐
+ (void)pauseMusicWithMusicName:(NSString *)musicName
{
    // 1.从字典中取出之前保存的播放器
    AVAudioPlayer *player = players[musicName];
    
    // 2.判断播放器是否为空,如果不为空,则暂停
    if (player)
    {
        [player pause];
    }
}

// 停止播放音乐
+ (void)stopMusicWithMusicName:(NSString *)musicName
{
    // 1.从字典中取出之前保存的播放器
    AVAudioPlayer *player = players[musicName];
    
    // 2.判断播放器是否为空,如果不为空,则停止音乐
    if (player)
    {
        [player stop];
        [players removeObjectForKey:musicName];
    }
}


@end
