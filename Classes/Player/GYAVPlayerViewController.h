//
//  AVPlayerViewController.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/22.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "RootViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface GYAVPlayerViewController : RootViewController

@property (weak, nonatomic) IBOutlet UISlider *playerSlider;

@property (nonatomic,strong)AVPlayer *player;

@property (nonatomic,assign)CGFloat sumPlayOperation;

@property (nonatomic,assign)NSInteger currentIndex;

@property (nonatomic,strong)NSString *coverPath;

@property (nonatomic,strong)NSString *trackId;

@property (nonatomic,strong)NSString *uid;

@property (nonatomic,strong)NSString *albumId;

@property (nonatomic,strong)NSMutableArray *data_Source;

@property (nonatomic,assign)NSInteger row;

//声明一个构造单粒的方法

+ (GYAVPlayerViewController *)shareInstance;

@end
