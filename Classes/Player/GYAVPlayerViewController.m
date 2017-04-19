//
//  AVPlayerViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/22.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "GYAVPlayerViewController.h"
#import "AVPlayerTopView.h"
#import <UIImageView+WebCache.h>
#import "AFNetWorking_Request.h"
#import "PlayerViewTopCollectionViewCell.h"
#import "ScetionTwoCollectionViewCell.h"
#import "XiangGuangTuiJianCollectionViewCell.h"
#import "XiangGuanTuiJianCollectionReusableView.h"
#import "TingZongDianPingCollectionViewCell.h"
#import "TingZongDianPingCollectionReusableView.h"

#import "TrackInfoModel.h"
#import "CommentList.h"
#import "NumberChangeTool.h"

#define STATUSKEY @"status"
#define LOADTIMERANGESKEY @"loadedTimeRanges"
#define TopCellIdentifier @"TopCellIdentifier"
#define SectionTwoCellIdentifier @"SectionTwoCellIdentifier"
#define XiangGuanTuiJianidentifier @"XiangGuanTuiJianidentifier"

#define XiangGuanTuiJianHeaderIndentifier @"XiangGuanTuiJianHeaderIndentifier"
#define NormalCollectionViewFooter @"NormalCollectionViewFooter"

#define TingZongDianPingHeaderIdentifier @"TingZongDianPingHeaderIdentifier"
#define TingZongDianPingCellIdentifier @"TingZongDianPingCellIdentifier"

static GYAVPlayerViewController *avPlayerVC = nil;

@interface GYAVPlayerViewController ()<AVPlayerTopViewDelegate,CAAnimationDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

//当前音频进度监听者
@property (nonatomic,strong)id timeObserver;
@property (nonatomic,strong)AVPlayerTopView *avPlayerTopView;
@property (nonatomic,strong) NSTimer *autoDismissTimer;
@property (nonatomic,strong)NSMutableArray *infoDataSource;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,assign)BOOL isDragSlider;
@property (nonatomic,assign)NSInteger indexRow;
@property (nonatomic,assign)CGFloat loadTime;   //用于得到缓存的状态

@property (nonatomic,strong)NSMutableDictionary *totalData;
@property (nonatomic,strong)NSMutableArray *associationAlbumsInfoArray;
@property (nonatomic,strong)NSMutableDictionary *albumPlaysDictionary;
@property (nonatomic,strong)NSMutableDictionary *albumTracksDictionary;
@property (nonatomic,strong)NSMutableArray *commentMArray;


@property (nonatomic,assign)NSInteger *count;


@end

@implementation GYAVPlayerViewController

+ (GYAVPlayerViewController *)shareInstance{
    
    if (avPlayerVC == nil) {
        avPlayerVC = [[GYAVPlayerViewController alloc] init];
    }
    return avPlayerVC;
}

//为了防止alloc或者new创建新的实例变量

+(id)allocWithZone:(struct _NSZone *)zone{
    
    /*
     @synchronized 创建一个互斥锁，保证此时没有其它线程对self对象进行修改，起到线程保护作用
     */
    @synchronized (self) {
        if (avPlayerVC == nil) {
            avPlayerVC = [super allocWithZone:zone];
        }
    }
    return avPlayerVC;
}

- (AVPlayer *)player{
    if (!_player) {
        AVPlayerItem *playerItem = [self getPlayItem:_row];
        
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        
        [self addNotification];
        
        [self addObserverToPlayerItem:playerItem];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTimer];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.avPlayerTopView.loadingImageView setImage:[UIImage imageNamed:@"toolbar_loading_n_p"]];
    
    [self setNavigationBar];

    //判断 上一次点击的节目是否与这一次相同
    if (_indexRow == _row) {
        [self.player play];
        _indexRow = _row;
    }
    else{
        
        [self removeObserverFromPlayerItem:self.player.currentItem];
        AVPlayerItem *playerItem = [self getPlayItem:_row];
        [self.player replaceCurrentItemWithPlayerItem:playerItem];
        [self addNotification];
        [self addObserverToPlayerItem:playerItem];
        [self.player play];
        _indexRow = _row;
    }
    [self netWorkRequestWithRow:_row];
}

- (void)setNavigationBar{
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_radio_show"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void)backAction:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//根据 row,改变播放图标,即如果row等于0，《为淡颜色；如果是最后一条，则》为淡颜色；

- (void)changeBofangIconWithRow:(NSInteger)row{
    if (row == 0) {
        [self.avPlayerTopView.lastSoundBtn setImage:[UIImage imageNamed:@"toolbar_prev_h_p"] forState:UIControlStateNormal];
        [self.avPlayerTopView.nextSoundBtn setImage:[UIImage imageNamed:@"toolbar_next_n_p"] forState:UIControlStateNormal];
    }
    else if (row == self.data_Source.count){
        [self.avPlayerTopView.lastSoundBtn setImage:[UIImage imageNamed:@"toolbar_prev_n_p"] forState:UIControlStateNormal];
        [self.avPlayerTopView.nextSoundBtn setImage:[UIImage imageNamed:@"toolbar_next_h_p"] forState:UIControlStateNormal];
    }
    else{
        [self.avPlayerTopView.lastSoundBtn setImage:[UIImage imageNamed:@"toolbar_prev_n_p"] forState:UIControlStateNormal];
        [self.avPlayerTopView.nextSoundBtn setImage:[UIImage imageNamed:@"toolbar_next_n_p"] forState:UIControlStateNormal];
    }
}

//通过索引取到item
- (AVPlayerItem *)getPlayItem:(NSInteger)videoIndex{
    
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.data_Source[videoIndex]];

    NSString *urlString = dic[@"playPathAacv224"];
    
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:urlString]];
    
    return playerItem;
}
//添加播放器通知
- (void)addNotification{
    //给 AVPlayerItem 添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinish:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}


- (void)playbackFinish:(NSNotification *)notification{
    
    [self nextSoundBtnAction:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.data_Source[_row]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HomeVCCenterImage" object:self userInfo:dic];
    NSLog(@"开始播放下一首");
}

- (void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
    通过KVO，给AVPlayerItem 添加监控
 */

- (void)addObserverToPlayerItem:(AVPlayerItem *)playerItem{
    //监控状态属性，注意 AVPlayer 也有一个status 属性，通过监控它的 status 也可以获得播放状态
    [playerItem addObserver:self forKeyPath:STATUSKEY options:NSKeyValueObservingOptionNew context:nil];
    //监控网路加载情况属性
    [playerItem addObserver:self forKeyPath:LOADTIMERANGESKEY options:NSKeyValueObservingOptionNew context:nil];
}

/**
 *  通过 KVO 监控播放器状态
 *
 *  @param keyPath 监控属性
 *  @param object  监视器
 *  @param change  状态改变
 *  @param context 上下文
 */
#pragma mark 播放相关
// 监听播放器的变化属性
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:STATUSKEY])
    {
        AVPlayerItemStatus statues = [change[NSKeyValueChangeNewKey] integerValue];
        switch (statues) {
            case AVPlayerItemStatusReadyToPlay:
            {
                // 最大值直接用sec，以前都是
                // CMTimeMake(帧数（slider.value * timeScale）, 帧/sec)
                self.avPlayerTopView.playerSilder.maximumValue = CMTimeGetSeconds(self.player.currentItem.duration);
                //准备播放时，给主页中间按钮发送通知
                NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.data_Source[_row]];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"HomeVCCenterImage" object:self userInfo:dic];
           }
                break;
            case AVPlayerItemStatusUnknown:
                
                break;
            case AVPlayerItemStatusFailed:
                break;
            default:
                break;
        }
    }
    else if ([keyPath isEqualToString:LOADTIMERANGESKEY]) // 监听缓存进度的属性
    {
        // 计算缓存进度
        NSTimeInterval timeInterval = [self availableDuration];
        // 获取总长度
        CMTime duration = self.player.currentItem.duration;
        
        CGFloat durationTime = CMTimeGetSeconds(duration);
        // 监听到了给进度条赋值
        [self.avPlayerTopView.progressStatus setProgress:timeInterval / durationTime animated:NO];
        _loadTime = timeInterval / durationTime;
        if (_loadTime >= 1.0) {
//            [self rotateStopActionWithView:self.avPlayerTopView.loadingImageView];
            [self.avPlayerTopView.loadingImageView setImage:[UIImage imageNamed:@"toolbar_loading_n_p"]];
        }
    }
}

//移除对 AVPlayerItem 监控
- (void)removeObserverFromPlayerItem:(AVPlayerItem *)playerItem{
    [playerItem removeObserver:self forKeyPath:STATUSKEY];
    [playerItem removeObserver:self forKeyPath:LOADTIMERANGESKEY];
}

- (void)initTimer
{
    // player的定时器
    __weak typeof(self)weakSelf = self;
    // 每秒更新一次UI Slider
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        // 当前时间
        CGFloat nowTime = CMTimeGetSeconds(weakSelf.player.currentItem.currentTime);
        // 总时间
        CGFloat duration = CMTimeGetSeconds(weakSelf.player.currentItem.duration);
        // sec 转换成时间点
        weakSelf.avPlayerTopView.currentTime.text = [weakSelf timeFormatted:nowTime];
        weakSelf.avPlayerTopView.totalDuration.text = [weakSelf timeFormatted:(duration - nowTime)];
        if (_loadTime < 1.0) {
            [weakSelf rotateActionWithView:weakSelf.avPlayerTopView.loadingImageView];
        }
        else{
            [weakSelf.avPlayerTopView.loadingImageView stopAnimating];
        }

        // 不是拖拽中的话更新UI
        if (!weakSelf.isDragSlider)
        {
            weakSelf.avPlayerTopView.playerSilder.value = CMTimeGetSeconds(weakSelf.player.currentItem.currentTime);
        }
     
    }];
}

/**
 *  计算缓冲进度
 *
 *  @return 缓冲进度
 */
- (NSTimeInterval)availableDuration {
    NSArray *loadedTimeRanges = [self.player.currentItem loadedTimeRanges];
    CMTimeRange timeRange     = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    float startSeconds        = CMTimeGetSeconds(timeRange.start); // 开始的点
    float durationSeconds     = CMTimeGetSeconds(timeRange.duration); // 已缓存的时间点
    NSTimeInterval result     = startSeconds + durationSeconds;// 计算缓冲总进度
    return result;
}


//转换成时分秒
- (NSString *)timeFormatted:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d",minutes, seconds];
}

//移除监听音乐播放进度
-(void)removeTimeObserver
{
    if (self.timeObserver) {
        [self.player removeTimeObserver:self.timeObserver];
        self.timeObserver = nil;
    }
}

//siler
- (void)sliderTouchInsideAction:(UISlider *)sender{
    self.isDragSlider = YES;
}
- (void)sliderValueChangeSliderAction:(UISlider *)sender{
    self.isDragSlider = NO;
    // CMTimeMake(帧数（slider.value * timeScale）, 帧/sec)
    // 直接用秒来获取CMTime
    [self.player seekToTime:CMTimeMakeWithSeconds(sender.value, self.player.currentItem.currentTime.timescale)];
    
}
//开始、结束播放
- (void)startAndStopBtnAction:(UIButton *)sender{
    
    if (self.player.rate != 1.0f)
    {
        [_avPlayerTopView.StartAndEndBtn setImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateNormal];
        [self.player play];
        
    }
    else
    {
        [_avPlayerTopView.StartAndEndBtn setImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
        [self.player pause];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isPlayOrPause" object:self userInfo:@{@"rate":@(self.player.rate)}];
}

- (void)nextSoundBtnAction:(UIButton *)sender{
    if (_row < self.data_Source.count) {
        _row += 1;
        
        [self removeObserverFromPlayerItem:self.player.currentItem];
        
        AVPlayerItem *item = [self getPlayItem:_row];
        
        [self.player replaceCurrentItemWithPlayerItem:item];
        
        [self addObserverToPlayerItem:self.player.currentItem];
        
        [self netWorkRequestWithRow:_row];
    }
}

- (void)lastSoundBtnAction:(UIButton *)sender{
    if (_row > 0) {
        _row -= 1;
        
        [self removeObserverFromPlayerItem:self.player.currentItem];
        
        AVPlayerItem *item = [self getPlayItem:_row];
        
        [self.player replaceCurrentItemWithPlayerItem:item];
        
        [self addObserverToPlayerItem:self.player.currentItem];
        
        [self netWorkRequestWithRow:_row];
    }
}

- (NSMutableDictionary *)totalData{
    if (!_totalData) {
        _totalData = [NSMutableDictionary dictionary];
    }
    return _totalData;
}

- (NSMutableArray *)infoDataSource{
    if (!_infoDataSource) {
        _infoDataSource = [NSMutableArray array];
    }
    return _infoDataSource;
}

- (NSMutableArray *)associationAlbumsInfoArray{
    if (!_associationAlbumsInfoArray) {
        _associationAlbumsInfoArray = [NSMutableArray array];
    }
    return _associationAlbumsInfoArray;
}

- (NSMutableDictionary *)albumTracksDictionary{
    if (!_albumTracksDictionary) {
        _albumTracksDictionary = [NSMutableDictionary dictionary];
    }
    return _albumTracksDictionary;
}

- (NSMutableDictionary *)albumPlaysDictionary{
    if (!_albumPlaysDictionary) {
        _albumPlaysDictionary = [NSMutableDictionary dictionary];
    }
    return _albumPlaysDictionary;
}

- (NSMutableArray *)commentMArray{
    if (!_commentMArray) {
        _commentMArray = [NSMutableArray array];
    }
    return _commentMArray;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = ViewControllerBlackgroundColor;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"PlayerViewTopCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:TopCellIdentifier];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"ScetionTwoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:SectionTwoCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"XiangGuangTuiJianCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:XiangGuanTuiJianidentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"TingZongDianPingCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:TingZongDianPingCellIdentifier];
        
        //注册footer
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NormalCollectionViewFooter];
        //相关推荐
        [_collectionView registerNib:[UINib nibWithNibName:@"XiangGuanTuiJianCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XiangGuanTuiJianHeaderIndentifier];
    }
    return _collectionView;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 2) {
        return self.associationAlbumsInfoArray.count;
    }
    else if (section == 3){
        return self.commentMArray.count;
    }
    else{
        return 1;
    }
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        PlayerViewTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TopCellIdentifier forIndexPath:indexPath];
        cell.TopCollectionViewCellBackgroundView.delegate = self;
        [cell.TopCollectionViewCellBackgroundView.playerSilder setThumbImage:[UIImage imageNamed:@"dot"] forState:UIControlStateNormal];
        
        TrackInfoModel *model = [[TrackInfoModel alloc] initWithDictionary:self.infoDataSource[0]];
        
        [cell.TopCollectionViewCellBackgroundView.coverPathImageView sd_setImageWithURL:[NSURL URLWithString:model.coverLarge]];

        _avPlayerTopView = cell.TopCollectionViewCellBackgroundView;
        
        return cell;
    }
    else if (indexPath.section == 2){
        XiangGuangTuiJianCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XiangGuanTuiJianidentifier forIndexPath:indexPath];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.associationAlbumsInfoArray[indexPath.row]];
        
        [cell.coverMiddle sd_setImageWithURL:[NSURL URLWithString:dic[@"coverMiddle"]]];
        
        cell.coverTitleLable.text = dic[@"title"];
        
        cell.introLabel.text = dic[@"intro"];
        
        NSNumber *albumId = dic[@"albumId"];
        
        cell.albumTracksLabel.text = [NSString stringWithFormat:@"%@集",self.albumTracksDictionary[[NSString stringWithFormat:@"%@",albumId]]];
        
       
        cell.albumPlaysLabel.text = [NumberChangeTool changeNumberWithCount:self.albumPlaysDictionary[[NSString stringWithFormat:@"%@",albumId]]];
        
        return cell;
        
    }
    else if (indexPath.section == 3){
        
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.commentMArray[indexPath.row]];
        
        TingZongDianPingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TingZongDianPingCellIdentifier forIndexPath:indexPath];
        cell.smallLogoImageView.layer.cornerRadius = 25.0;
        cell.smallLogoImageView.layer.masksToBounds = YES;
        [cell.smallLogoImageView sd_setImageWithURL:[NSURL URLWithString:dic[@"smallHeader"]]];
        cell.nicknameLabel.text = dic[@"nickname"];
        cell.contentLabel.text = dic[@"content"];
        cell.likeCountLabel.text = [NSString stringWithFormat:@"%@",dic[@"likes"]];
        return cell;
        
    }
    
    else{
        ScetionTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SectionTwoCellIdentifier forIndexPath:indexPath];
        
        NSDictionary *trackInfoDic = [NSDictionary dictionaryWithDictionary:self.totalData[@"trackInfo"]];
        
        [cell.coverImageView sd_setImageWithURL:[NSURL URLWithString:trackInfoDic[@"coverSmall"]]];
        
        cell.shortRichIntroLabel.text = trackInfoDic[@"shortRichIntro"];
        
        cell.trackInfoTitle.text = trackInfoDic[@"title"];
        
        NSDictionary *albumInfoDic = [NSDictionary dictionaryWithDictionary:self.totalData[@"albumInfo"]];
        
        cell.albumInfoTitle.text = albumInfoDic[@"title"];
        
        return cell;
    }

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSDictionary *albumInfoDic = [NSDictionary dictionaryWithDictionary:self.totalData[@"albumInfo"]];
    
    CGFloat albumInfo_H = [albumInfoDic[@"title"] boundingRectWithSize:CGSizeMake(359, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:21]} context:nil].size.height;
    
    if (indexPath.section == 0) {
        return CGSizeMake(Screen_Width, Screen_Height/3 * 2);
    }
    else if (indexPath.section == 2){
        return CGSizeMake(Screen_Width, 100);
    }
    else if (indexPath.section == 3){
        
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.commentMArray[indexPath.row]];
        
        CGFloat content_H = [dic[@"content"] boundingRectWithSize:CGSizeMake(Screen_Width - 86, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
       
        
        return CGSizeMake(Screen_Width, 50 + content_H);
    }
    
    else{
        return CGSizeMake(Screen_Width, 130+ albumInfo_H);
    }
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionFooter) {
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NormalCollectionViewFooter forIndexPath:indexPath];
        
        footerView.backgroundColor =  ViewControllerBlackgroundColor;
        return footerView;
    }
    else{
        if (indexPath.section == 2) {
            XiangGuanTuiJianCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XiangGuanTuiJianHeaderIndentifier forIndexPath:indexPath];
            
            headerView.backgroundColor = [UIColor whiteColor];
            return  headerView;
        }
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return  CGSizeMake(Screen_Width, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(Screen_Width, 35);
    }
    else{
        return CGSizeMake(Screen_Width, 0);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 2 || section == 3) {
        return 0;
    }
    else{
        return 10;
    }
}



#pragma mark 网络请求
- (void)netWorkRequestWithRow:(NSInteger)row{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.data_Source[row]];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://mobile.ximalaya.com/v1/track/ca/playpage/%@?albumId=%@&device=iPhone&trackUid=%@",dic[@"trackId"],dic[@"albumId"],dic[@"uid"]];

    [AFNetWorking_Request getRequestWithUrl:urlStr Result:^(id result) {
        //返回的所有数据
        self.totalData = result;
        //相关推荐的部分信息
        self.associationAlbumsInfoArray = result[@"associationAlbumsInfo"];
        //相关推荐的播放数，以及集数
        NSDictionary *countInfoDictionary = result[@"countInfo"];
        //相关推荐的集数
        self.albumTracksDictionary = countInfoDictionary[@"albumTracks"];
        self.albumPlaysDictionary = countInfoDictionary[@"albumPlays"];
        //评论
        NSDictionary *commentDictionary = [NSDictionary dictionaryWithDictionary:result[@"commentInfo"]];
        self.commentMArray = commentDictionary[@"list"];
        
        //切换数据，先清空数组
        [self.infoDataSource removeAllObjects];
        //section2 的数据
        [self.infoDataSource addObject:result[@"trackInfo"]];
        
        [self.collectionView reloadData];
        
        [self.view addSubview:self.collectionView];
        
        [self.player play];
    }];
}

#pragma 旋转动画
- (void)rotateActionWithView:(UIImageView *)ImageView{
    ImageView.image = [UIImage imageNamed:@"toolbar_loading_h_p"];
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = @(0);
    rotation.toValue = @(M_PI * 2);
    rotation.duration = 1;
    rotation.repeatCount = 1;
    //控制运动节奏
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    rotation.delegate = self;
    //延时  CACurrentMediaTime()为图层当前的时间
    //    rotation.beginTime = CACurrentMediaTime() + 2;
    
    rotation.fillMode = kCAFillModeForwards;
    //如果一个动画是CAAnimation，需要将removedOnCompletion设置成NO，否则fillMode不起作用
    rotation.removedOnCompletion = NO;
    [ImageView.layer addAnimation:rotation forKey:nil];
}

//停止动画
- (void)rotateStopActionWithView:(UIImageView *)imageView{
    [imageView stopAnimating];
    imageView.image = [UIImage imageNamed:@"toolbar_loading_n_p"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
