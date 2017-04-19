//
//  HomeFenLeiThirdStyleViewController.m
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/18.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//

#define FenLeiHeaderIdentifier @"FenLeiHeaderIdentifier"
#define FenLeiFooterIdentifier @"FenLeiFooterIdentifier"
#define FenLeiSecondCellStyleIdentifier @"FenLeiSecondCellStyleIdentifier"
#define FenLeiHeaderScrollIdentifier @"FenLeiHeaderScrollIdentifier"


#import "HomeFenLeiThirdStyleViewController.h"
#import "RLScrollPic.h"
#import "AFNetWorking_Request.h"
#import "DataModels.h"
#import <UIImageView+WebCache.h>
#import "NumberChangeTool.h"
#import "HomeFenLeiSecondStyleCollectionViewCell.h"
#import "HomeFenLeiHeaderCollectionReusableView.h"


@interface HomeFenLeiThirdStyleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *scrollPicDataSource;
@property (nonatomic,strong)RLScrollPic *scrollView;
@property (nonatomic,strong)NSMutableArray *topImgArray;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation HomeFenLeiThirdStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setLeftNavigationItem];

    [self netWorkRequest];
    [self.view addSubview:self.collectionView];
//    [self.view addSubview:self.scrollView];
    
    self.navigationItem.title = _titlestring;
}
- (void)setLeftNavigationItem{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_back_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popAction:)];
    
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)popAction:(UINavigationItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -- 懒加载
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (NSMutableArray *)scrollPicDataSource{
    if (!_scrollPicDataSource) {
        _scrollPicDataSource = [NSMutableArray array];
    }
    return _scrollPicDataSource;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.footerReferenceSize = CGSizeMake(Screen_Width, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height-64-49) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeFenLeiSecondStyleCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FenLeiSecondCellStyleIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeFenLeiHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:FenLeiHeaderIdentifier];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:FenLeiHeaderScrollIdentifier];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FenLeiFooterIdentifier];
        
    }
    return _collectionView;
}
- (void)netWorkRequest{
    
    //    http://mobile.ximalaya.com/mobile/discovery/v3/category/recommends?category #Id=3# &contentType=album&device=iPhone&scale=2&statEvent=pageview%2Fcategory%40%E6%9C%89%E5%A3%B0%E4%B9%A6&statModule=%E6%9C%89%E5%A3%B0%E4%B9%A6&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB&version=5.4.45
    NSString *urlStringOne = @"http://mobile.ximalaya.com/mobile/discovery/v3/category/recommends?category";
    NSString *urlStringTow = @"&contentType=album&device=iPhone&scale=2&statEvent=pageview%2Fcategory%40%E6%9C%89%E5%A3%B0%E4%B9%A6&statModule=%E6%9C%89%E5%A3%B0%E4%B9%A6&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB&version=5.4.45";
    NSString *urlString = [NSString stringWithFormat:@"%@Id=%ld%@",urlStringOne,_ID,urlStringTow];
//    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
//        
//        
//    }];
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        NSDictionary *Adic = result[@"focusImages"];
        NSArray *dic = Adic[@"list"];
        for (NSDictionary *ddic in dic) {
            [self.scrollPicDataSource addObject:ddic];
        }
        _topImgArray = [NSMutableArray array];
        for (int i = 0; i < self.scrollPicDataSource.count; i ++) {
            NSDictionary *dic = self.scrollPicDataSource[i];
            [_topImgArray addObject:dic[@"pic"]];
        }
        _scrollView = [[RLScrollPic alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, TopPicHeight) WithImageName: self.topImgArray];
        _scrollView.AutoScrollDelay = 4.0;
        
        NSDictionary *columnsDic = result[@"categoryContents"];
        NSArray *array = columnsDic[@"list"];
        [self.dataSource addObject:@{}];
        for (int i = 0; i < array.count; i ++) {
            [self.dataSource addObject:array[i]];
        }
        [_collectionView reloadData];
    }];
}

#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout --
//设置item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.section == 0) {
        return CGSizeZero;
    }
    else{
        return CGSizeMake(Screen_Width, 85);
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSDictionary *dic = self.dataSource[section];
    NSArray *array = dic[@"list"];

    if (section == 0) {
        return 1;
    }
    else{
        return array.count;
    }
}

//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.dataSource[indexPath.section];
    NSArray *array = dic[@"list"];
    FenLeiContentList *list = [FenLeiContentList modelObjectWithDictionary:array[indexPath.row]];
    
    HomeFenLeiSecondStyleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FenLeiSecondCellStyleIdentifier forIndexPath:indexPath];
    if (list.isFinished == 2) {
        cell.wanBen.hidden = NO;
    }
    else{
        cell.wanBen.hidden = YES;
    }
    cell.titleStringLabel.text = list.title;
    [cell.bgImgView sd_setImageWithURL:[NSURL URLWithString:list.coverSmall]];
    cell.boFangLiang.text = [NumberChangeTool dealWithPlayNum:@(list.playsCounts)];
    cell.jiShu.text = [NSString stringWithFormat:@"%.0lf集",list.tracks];
    cell.contentStringLabel.text = list.intro;
    return cell;
    
    return cell;
}

//footer header
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.dataSource[indexPath.section];
    if (kind == UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 0) {
            
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:FenLeiHeaderScrollIdentifier forIndexPath:indexPath];
            [header addSubview:self.scrollView];
            return header;
        }
        else{
            HomeFenLeiHeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:FenLeiHeaderIdentifier forIndexPath:indexPath];
            header.titleStringLabel.text = dic[@"title"];
            return header;
        }
        
    }
    else{
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FenLeiFooterIdentifier forIndexPath:indexPath];
        footer.backgroundColor = ViewControllerBlackgroundColor;
        
        return footer;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return CGSizeMake(Screen_Width, TopPicHeight);
    }
    else{
        return CGSizeMake(Screen_Width, 30);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(Screen_Width, 10);
}
@end










