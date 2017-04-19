//
//  ZhuBoBBBViewController.m
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/24.
//  Copyright © 2016年 李东. All rights reserved.
//

#import "ZhuBoBBBViewController.h"
#import "AFNetWorking_Request.h"
#import "ZhuBoNormalDataModels.h"
#import "ZhuBoGeShouCollectionViewCell.h"
#import <UIImageView+WebCache.h>

#define FamousCellIdentifier @"FamousCellIdentifier"

@interface ZhuBoBBBViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ZhuBoBBBViewController
-(NSMutableArray *)dataSource{
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
    }
    return _dataSource;
}


-(UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        //列距
        flowLayout.minimumInteritemSpacing = 10;
        
        //        //每个item的大小
        //        CGFloat itemWidth = (ScreenWidth -60)/3;
        //        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth*5/3);
        
        //设置边距
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 10, 10);
        //设置滚动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height - 64) collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        //注册单元格
        [_collectionView registerNib:[UINib nibWithNibName:@"ZhuBoGeShouCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FamousCellIdentifier];
        
        
    }
    return _collectionView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主播大咖";
    
    [self topView];
    
    [self.view addSubview:self.collectionView];
    
    
}
- (void)topView{
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, -64, Screen_Width, 64)];
    topView.backgroundColor = ViewControllerBlackgroundColor;
    
    [self.view addSubview:topView];
}


-(instancetype)initWithUrl:(NSString *)url{

    [self netWorkRequest:url];

    return self;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.dataSource.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZhuBoNormalList *list = self.dataSource[indexPath.row];
    
    ZhuBoGeShouCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:FamousCellIdentifier forIndexPath:indexPath];
    
    cell.nickname.text = list.nickname;
    [cell.smallLogo sd_setImageWithURL:[NSURL URLWithString:list.smallLogo]];
    cell.verifyTitle.text = list.verifyTitle;
    cell.tracksCounts.text = [NSString stringWithFormat:@"%.0f",list.tracksCounts];
    
    if (list.followersCounts < 10000) {
        cell.followersCounts.text = [NSString stringWithFormat:@"%.0f",list.followersCounts];
    }
    else{
        cell.followersCounts.text = [NSString stringWithFormat:@"%.1f万",list.followersCounts/10000];
    }
    return cell;
}





#pragma  mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    CGFloat itemHeight = 72;
    return CGSizeMake(Screen_Width, itemHeight);
    
    
    
}


#pragma mark 网络请求
-(void)netWorkRequest:(NSString *)urlString{
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        ZhuBoNormalZhuBoNormalModel *model = [ZhuBoNormalZhuBoNormalModel modelObjectWithDictionary:result];
        
        NSArray *array = [NSArray arrayWithArray:model.list];
        
        
        for (ZhuBoNormalList *list in array) {
            
            [self.dataSource addObject:list];
            
        }
        
        [self.collectionView reloadData];

    }];
    
    
    
}









@end
