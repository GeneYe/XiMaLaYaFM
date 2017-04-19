//
//  HomeFenLeiViewController.m
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/15.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//

#define FenLeiIdentifier @"FenLeiIdentifier"
#define FooterViewIdentifier @"FooterViewIdentifier"
#define FenLeiFuFeiJingPinIdentifier @"FenLeiFuFeiJingPinIdentifier"

#import "HomeFenLeiViewController.h"
#import "HomeFenLeiCollectionViewCell.h"
#import "DataModels.h"
#import "AFNetWorking_Request.h"
#import "UIImageView+WebCache.h"
#import "HomeFenLeiFuFeiJingPinCollectionViewCell.h"
#import "CreateFenLeiRongQiViewController.h"

#import "HomeFenLeiFirstStyleViewController.h"
#import "HomeFenLeiSecondStyleViewController.h"
#import "HomeFenLeiThirdStyleViewController.h"
@interface HomeFenLeiViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *listArray;

@end

@implementation HomeFenLeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = ViewControllerBlackgroundColor;
    
    [self netWorkRequest];
    [self.view addSubview:self.collectionView];
}
#pragma
- (void)netWorkRequest{

    NSString *urlString = @"http://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=ios-b1&code=43_440000_4403&device=iPhone&picVersion=13&scale=2&version=5.4.45";
//    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
//            }];
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        HomeFenLeiBaseClass *model = [HomeFenLeiBaseClass modelObjectWithDictionary:result];
        NSArray *array = model.list;
        
        for (HomeFenLeiList *dic in array) {
            [self.listArray addObject:dic];
            [_collectionView reloadData];
        }
        
        for (int i = 0; i < 6; i++) {
            NSMutableArray *array = [NSMutableArray array];
            [self.dataSource addObject:array];
        }
        
        [self.dataSource[0] addObject:self.listArray[0]];
        
        for (int i = 1;  i < 7 ; i++) {
            [self.dataSource[1] addObject:self.listArray[i]];
        }
        for (int i = 7;  i < 13; i++) {
            [self.dataSource[2] addObject:self.listArray[i]];
        }
        for (int i = 13; i < 19; i++) {
            [self.dataSource[3] addObject:self.listArray[i]];
        }
        for (int i = 19; i < 25; i++) {
            [self.dataSource[4] addObject:self.listArray[i]];
        }
        for (int i = 25; i < self.listArray.count; i++) {
            [self.dataSource[5] addObject:self.listArray[i]];
        }

    }];
}

#pragma mark -- 懒加载 --
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
       
    }
    return _dataSource;
}
- (NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {

        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.footerReferenceSize = CGSizeMake(Screen_Width, 10);

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, Screen_Width, Screen_Height-64-40-49) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        //注册item、footer、顶部item
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeFenLeiCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FenLeiIdentifier];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterViewIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeFenLeiFuFeiJingPinCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier: FenLeiFuFeiJingPinIdentifier];
    }
    return _collectionView;
}

#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSUInteger count = self.listArray.count-1;
    if (section == 0) {
        return 1;
    }
    else if (count %6 == 0) {
        return 6;
    }
    else{
        if (section == count/6 + 1) {
            return count %6;
        }
        else{
            return 6;
        }
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(Screen_Width , TopPicHeight);
    }
    else{
        return CGSizeMake(Screen_Width/2, 40);
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray *array = self.dataSource[indexPath.section];
    
    if (indexPath.section == 0) {
        HomeFenLeiFuFeiJingPinCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FenLeiFuFeiJingPinIdentifier forIndexPath:indexPath];
        cell.homeFenLeiJingPinModel = [array lastObject];
        return cell;
    }
    else{
        HomeFenLeiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FenLeiIdentifier forIndexPath:indexPath];
        cell.homeFenLeiListModel = array[indexPath.row];
        
        return cell;
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSArray *array = self.dataSource[indexPath.section];
    HomeFenLeiList *list = array[indexPath.row];

    NSString *string = [NSString stringWithFormat:@"%.0lf",list.listIdentifier];
    int Aid = [string intValue];
    
    switch (Aid) {
        case 17: case 32: case 38:{
            
            HomeFenLeiSecondStyleViewController *vc = [HomeFenLeiSecondStyleViewController new];
            vc.ID = list.listIdentifier;
            vc.titlestring = list.title;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 34: case 30: case 40: case 29:{
            
            HomeFenLeiThirdStyleViewController *vc = [HomeFenLeiThirdStyleViewController new];
            vc.ID = list.listIdentifier;
            vc.titlestring = list.title;
            [self.navigationController pushViewController: vc animated:YES];
            break;
        }
        
            
        default:{
            HomeFenLeiFirstStyleViewController *vc = [HomeFenLeiFirstStyleViewController new];
            vc.ID = list.listIdentifier;
            vc.titlestring = list.title;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
    }

//    vc.ID = list.listIdentifier;
//    vc.rongQiCount = self.listArray.count;
}
//Footer
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterViewIdentifier forIndexPath:indexPath];
        footer.backgroundColor = ViewControllerBlackgroundColor;
        
        return footer;
    }
    return nil;
}


@end

















