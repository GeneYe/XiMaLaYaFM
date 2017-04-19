//
//  ReMenViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/16.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenViewController.h"
#import "AFNetWorking_Request.h"
#import <UIImageView+WebCache.h>
#import "RemMenTopGunDongCollectionReusableView.h"
#import "ReMenHeaderViewCollectionReusableView.h"
#import "ReMenJingPinTingDanCollectionViewCell.h"

#import "ReMenXinQIFaXianCollectionViewCell.h"
#import "ReMenNormalCollectionViewCell.h"
#import "DataModels.h"

#import "NumberChangeTool.h"

#define CellIdentifier @"CellIdentifier"
#define CellHeaderIdentifer @"CellHeaderIdentifer"
#define CellFooterIdentifer @"CellFooterIdentifer"
#define ReMenXinQiFaXianCell @"ReMenXinQiFaXianCell"
#define ReMenNormalCellIdentifier @"ReMenNormalCellIdentifier"
#define ReMenGuangGaoIdentifier @"reMenGuangGaoIdentifier"
#define ReMenCellHeaderViewIdentifier @"ReMenCellHeaderViewIdentifier"
#define ReMenJingPinTingDanIdentifier @"ReMenJingPinTingDanIdentifier"

#define ItemWidth (Screen_Width - 40)/3
#define JingPinTingDanItemHeight 80

@interface ReMenViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *others_DataSource;

@property (nonatomic,strong)NSMutableArray *xiaoBianTuiJianJingPinData;

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)NSMutableArray *guangGaoArray;

@end

@implementation ReMenViewController

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 35, Screen_Width, Screen_Height- 64 - 49 - 35) collectionViewLayout:flowLayout];
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = GYCommonBgColor;
        //注册单元格
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        
        [_collectionView registerClass:[ReMenXinQIFaXianCollectionViewCell class] forCellWithReuseIdentifier:ReMenXinQiFaXianCell];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"ReMenNormalCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:ReMenNormalCellIdentifier];
        
//        [_collectionView registerClass:[ReMenJingPinTingDanCollectionViewCell class] forCellWithReuseIdentifier:ReMenJingPinTingDanIdentifier];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"ReMenJingPinTingDanCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:ReMenJingPinTingDanIdentifier];
        
        //注册头部
        [_collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellHeaderIdentifer];
        //顶部广告
        [_collectionView registerNib:[UINib nibWithNibName:@"RemMenTopGunDongCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ReMenGuangGaoIdentifier];
        //注册顶部顶部View
        [_collectionView registerClass:[ReMenHeaderViewCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ReMenCellHeaderViewIdentifier];
        
        //注册尾部
        [_collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CellFooterIdentifer];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}

- (NSMutableArray *)others_DataSource{
    if (!_others_DataSource) {
        _others_DataSource = [NSMutableArray array];
    }
    return _others_DataSource;
}

- (NSMutableArray *)xiaoBianTuiJianJingPinData{
    if (!_xiaoBianTuiJianJingPinData) {
        _xiaoBianTuiJianJingPinData = [NSMutableArray array];
    }
    return _xiaoBianTuiJianJingPinData;
}

- (NSMutableArray *)guangGaoArray{
    if (!_guangGaoArray) {
        _guangGaoArray = [NSMutableArray array];
    }
    return _guangGaoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cityCode = @"43_440000_4401";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self netWorkRequestForTopScrollViewAndXiaoBianTuiJian];
    
    [self.view addSubview:self.collectionView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(push:) name:@"VCWitchWillBePushed" object:nil];
    
    
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.others_DataSource.count + self.xiaoBianTuiJianJingPinData.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 3){
        GYEditorRecommendAlbums *editorRecommend = self.xiaoBianTuiJianJingPinData[1];
        
        return editorRecommend.list.count;
    }
    else{
        return 3;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //常规cell样式
    ReMenNormalCollectionViewCell *normalCell = [collectionView dequeueReusableCellWithReuseIdentifier:ReMenNormalCellIdentifier forIndexPath:indexPath];
    normalCell.coverButtonHeight.constant = ItemWidth - 10;
    //顶部横向滚动按钮栏
    if (indexPath.section == 0) {
        
        ReMenXinQIFaXianCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReMenXinQiFaXianCell forIndexPath:indexPath];

        GYOthersDiscoveryColumns *discovery = self.others_DataSource[0];
        
        cell.list = discovery.list;

//        NSDictionary *dic = @{@"list":discovery.list};
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"JingPinTuiJianTongZhi" object:nil userInfo:dic];
        
        return cell;
    }
    //小便推荐
    else if (indexPath.section == 1){
        GYEditorRecommendAlbums *xiaobianTuijian = self.xiaoBianTuiJianJingPinData[indexPath.section - 1];
        NSArray *array = xiaobianTuijian.list;
        GYList *list = array[indexPath.row];
        normalCell.list = list;
        return normalCell;
    }
    //听广州
    else if (indexPath.section == 2){
        GYOthersCityColumn *city = self.others_DataSource[indexPath.section - 1];
        NSArray *array = city.list;
        GYOthersList *list = array[indexPath.row];
        normalCell.Otherlist = list;
        
        return normalCell;
    }
    //精品听单
    else if (indexPath.section == 3){
        
        ReMenJingPinTingDanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReMenJingPinTingDanIdentifier forIndexPath:indexPath];
        
        GYEditorRecommendAlbums *editorRecommend = self.xiaoBianTuiJianJingPinData[1];
        NSArray *array = editorRecommend.list;
        GYList *list = array[indexPath.row];
        cell.list = list;
        cell.row = indexPath.row;
        
        return cell;
    }
    else{
        
        GYOthersList *OthersList = self.others_DataSource[indexPath.section - 2];

        normalCell.Otherlist = OthersList.list[indexPath.row];
        
        return normalCell;
    }
    
}

//设置section的头部和尾部样式
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //一般头部样式
    ReMenHeaderViewCollectionReusableView *normalHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ReMenCellHeaderViewIdentifier forIndexPath:indexPath];
    
    if (kind == UICollectionElementKindSectionHeader) {
        //顶部滚动样式
        if (indexPath.section == 0) {
        RemMenTopGunDongCollectionReusableView *topScrollheaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ReMenGuangGaoIdentifier forIndexPath:indexPath];
            
            topScrollheaderView.bannerTopImageArray = self.guangGaoArray;
            
            return topScrollheaderView;
        }
        //小便推荐
        else if(indexPath.section == 1){
            GYEditorRecommendAlbums *xiaobianTuijian = self.xiaoBianTuiJianJingPinData[indexPath.section - 1];
            
            normalHeaderView.titleString = xiaobianTuijian.title;
    
            return normalHeaderView;
        }
        //听广州
        else if (indexPath.section == 2){
            
            GYOthersCityColumn *city = self.others_DataSource[indexPath.section - 1];
            normalHeaderView.titleString = city.title;
            
            return normalHeaderView;
        }
        //精品听单
        else if (indexPath.section == 3){
            GYSpecialColumn *specialColum = self.xiaoBianTuiJianJingPinData[indexPath.section - 2];
            normalHeaderView.titleString = specialColum.title;
            
            return normalHeaderView;
        }
        else{
            GYOthersList *list = self.others_DataSource[indexPath.section - 2];
        
            normalHeaderView.titleString = list.title;
            
            return normalHeaderView;
        }
        
    }
    else{
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CellFooterIdentifer forIndexPath:indexPath];
        
        footerView.backgroundColor =  ViewControllerBlackgroundColor;
        return footerView;
    }
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(Screen_Width, Screen_Width/2.13);
    }
    
    else{
        return CGSizeMake(Screen_Width, 40);
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(Screen_Width, 10);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(Screen_Width, 80);
    }
    
    else if (indexPath.section == 3){
        return CGSizeMake(Screen_Width, JingPinTingDanItemHeight);
    }
    else{
        return CGSizeMake(ItemWidth, ItemWidth + 50);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    if (section == 0) {
        return UIEdgeInsetsMake(10, 0, 0, 0);
    }
    else if (section == 3){
        return UIEdgeInsetsMake(-5, 0, 0, 0);
    }
    else{
        return UIEdgeInsetsMake(0, 10,5, 10);
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 0 || section == 3) {
        return 0;
    }
    else{
        return 10;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0 || section == 3) {
        return  0;
    }
    else{
        return 10;
    }
}

- (void)netWorkRequestForTopScrollViewAndXiaoBianTuiJian{
    
    NSString *urlStr = @"http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&inreview=true&scale=2&version=5.4.45";
    
    [AFNetWorking_Request getRequestWithUrl:urlStr Result:^(id result) {
        GYBaseClass *base = [GYBaseClass modelObjectWithDictionary:result];
        //小便推荐
        GYEditorRecommendAlbums *editorRecommend = base.editorRecommendAlbums;
        [self.xiaoBianTuiJianJingPinData addObject:editorRecommend];
        
        //精品听单
        GYSpecialColumn *specialColum = base.specialColumn;
        [self.xiaoBianTuiJianJingPinData addObject:specialColum];
        
        //顶部草泥马广告
        GYFocusImages *focusImages = base.focusImages;
        NSArray *array = focusImages.list;
        for (int i = 0; i < array.count; i++) {
            GYList *list = array[i];
            [self.guangGaoArray addObject:list];
        }

        [self netWorkRequestForOthers];
        
    }];
}

- (void)netWorkRequestForOthers{
    
//    NSString *urlStr = @"http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_440000_4401&device=iPhone&inreview=true&version=5.4.45";
    
    NSString *urlString = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=%@&device=iPhone&inreview=true&version=5.4.45",_cityCode];
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        GYOthersBaseClass *base = [GYOthersBaseClass modelObjectWithDictionary:result];
        
        //发现你麻痹(发现新奇)
        GYOthersDiscoveryColumns *discovery =  base.discoveryColumns;
        [self.others_DataSource addObject:discovery];
        
        //听某个地区
        GYOthersCityColumn *city = base.cityColumn;
        [self.others_DataSource addObject:city];
        
        //热门推荐
        GYOthersHotRecommends *hot = base.hotRecommends;
        [self.others_DataSource addObjectsFromArray:hot.list];
        

        
        [self.collectionView reloadData];
    }];
    
}


- (void)push:(NSNotification *)notification{
    
    UIViewController *vc = notification.userInfo[@"VC"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
