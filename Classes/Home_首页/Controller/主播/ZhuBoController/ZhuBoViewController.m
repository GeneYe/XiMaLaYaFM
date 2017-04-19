//
//  ZhuBoViewController.m
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/16.
//  Copyright © 2016年 李东. All rights reserved.
//

#import "ZhuBoViewController.h"
#import "AFNetWorking_Request.h"
#import "BaseClass.h"
#import "FamousCollectionViewCell.h"
#import "ZhuBoHeaderCollectionReusableView.h"
#import "ZhuboFooterCollectionReusableView.h"
#import "ZhuBoGeShouCollectionViewCell.h"
#import "ZhuBoAAAViewController.h"
#import "ZhuBoMoreZhuBoMoreModel.h"
#import "ZhuBoMoreList.h"
#import "ZhuBoBBBViewController.h"


#import <UIImageView+WebCache.h>


#define CellIdentifier @"CellIdentifier"
#define  FamousCellIdentifier @"FamousCellIdentifier"
#define FamousHeaderCellIdentifier @"FamousHeaderCellIdentifier"
#define FamousFooterCellIdentifier @"FamousFooterCellIdentifier"
#define FamousGeShouCellIdentifier @"FamousGeShouCellIdentifier"
#define NormalCellIdentifier @"NormalCellIdentifier"


@interface ZhuBoViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    NSString *urlStringqqq;
    BOOL isHad;
}

@property (nonatomic,strong)UICollectionView *colloectionView;
@property (nonatomic,strong)NSMutableArray *dataSourceA;

@property (nonatomic,strong)NSMutableArray *idArray;
@property (nonatomic,strong)NSMutableArray *idMArray;

//@property (nonatomic,strong)

@end

@implementation ZhuBoViewController
-(NSMutableArray *)dataSourceA{

    if (!_dataSourceA) {
        
        _dataSourceA = [NSMutableArray array];
        
    }
    return _dataSourceA;
}

-(NSMutableArray *)idArray{

    if (!_idArray) {
        
        _idArray = [NSMutableArray array];
        
    }
    return _idArray;
}

-(NSMutableArray *)idMArray{

    if (!_idMArray) {
        
        _idMArray = [NSMutableArray array];
        
    }
    return _idMArray;
}


-(UICollectionView *)colloectionView{

    if (!_colloectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //行距
        flowLayout.minimumLineSpacing = 10;
        //列距
        flowLayout.minimumInteritemSpacing = 10;
        
//        //每个item的大小
//        CGFloat itemWidth = (ScreenWidth -60)/3;
//        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth*5/3);
        
        //设置边距
//        flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 10, 10);
        //设置滚动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _colloectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 35, Screen_Width, Screen_Height - 64 - 49- 35) collectionViewLayout:flowLayout];
        
        _colloectionView.dataSource = self;
        _colloectionView.delegate = self;
        
        _colloectionView.showsVerticalScrollIndicator  = NO;
//        _colloectionView.backgroundColor = SBColor(241, 241, 241);
        _colloectionView.backgroundColor = [UIColor whiteColor];
        
        
        
        //注册单元格
        [_colloectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        
        [_colloectionView registerNib:[UINib nibWithNibName:@"FamousCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FamousCellIdentifier];
        
        //明星大咖更多
        [_colloectionView registerNib:[UINib nibWithNibName:@"ZhuBoHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:FamousHeaderCellIdentifier];
        
        //footer
        [_colloectionView registerNib:[UINib nibWithNibName:@"ZhuboFooterCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FamousFooterCellIdentifier];
        
        //歌手
        [_colloectionView registerNib:[UINib nibWithNibName:@"ZhuBoGeShouCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FamousGeShouCellIdentifier];
        
        //normal
        [_colloectionView registerNib:[UINib nibWithNibName:@"FamousCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NormalCellIdentifier];
        
        
        
        
    }

    return _colloectionView;
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.colloectionView];
    
    [self netWorkRequest];
    
}


#pragma mark  --UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
    }


}



#pragma mark --UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    
    
    return self.dataSourceA.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    if (section < 4) {
        
        return 6;
        
    }
    else{
    
        return 3;
        
    }
    return 0;
}


//cell样式
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section < self.dataSourceA.count && indexPath.section != 3) {
        if (indexPath.section < 3) {
            Famous *famous = self.dataSourceA[indexPath.section];
            FamousCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FamousCellIdentifier forIndexPath:indexPath];
            cell.tag = indexPath.section + 1;
            cell.list = famous.list[indexPath.row];
            

            return cell;
            
            
            
        }
        else{
//            NSLog(@"%ld",indexPath.section);
            Normal *normal = self.dataSourceA[indexPath.section];
            FamousCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NormalCellIdentifier forIndexPath:indexPath];
            cell.tag = indexPath.section + 1;
            cell.list = normal.list[indexPath.row];
            return cell;
        }
    }
    else if (indexPath.section == 3){
        Famous *famous = self.dataSourceA[indexPath.section];
        ZhuBoGeShouCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FamousGeShouCellIdentifier forIndexPath:indexPath];

        cell.list = famous.list[indexPath.row];
        return cell;
    }
    
//    else{
//
//
//    }
    
    return nil;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind == UICollectionElementKindSectionHeader) {
        ZhuBoHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:FamousHeaderCellIdentifier forIndexPath:indexPath];

        if (indexPath.section < 4) {
            Famous *famous = self.dataSourceA[indexPath.section];
            headerView.famous = famous;
            
            headerView.moreBtnAction.tag = (long)indexPath.section + 1 +100;

            [headerView.moreBtnAction addTarget:self action:@selector(presentToInner:) forControlEvents:UIControlEventTouchUpInside];
            
            return headerView;
        }
        else{
            Normal *normal = self.dataSourceA[indexPath.section];
            headerView.normal = normal;
            
            headerView.moreBtnAction.tag = (long)indexPath.section + 1 +100;
//            NSLog(@"%lu",headerView.moreBtnAction.tag);
            return headerView;
        }
    }
    else{
        ZhuboFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FamousFooterCellIdentifier forIndexPath:indexPath];
        
        return footerView;
    }
    return nil;
}




#pragma mark --UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

        return CGSizeMake(Screen_Width, 40);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeMake(Screen_Width, 10);

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 3) {
        
        CGFloat itemHeight = 72;
        return CGSizeMake(Screen_Width, itemHeight);
    }
    else{
    
        CGFloat itemWidth = (Screen_Width -60)/3;
        return  CGSizeMake(itemWidth, itemWidth*5/3);
    }
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 3) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    else{
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }
}







#pragma mark --网络请求--
-(void)netWorkRequest{

    NSString *urlString = @"http://mobile.ximalaya.com/mobile/discovery/v1/anchor/recommend?device=iPhone&version=5.4.45";
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        BaseClass *model = [BaseClass modelObjectWithDictionary:result];
        
        NSArray *Adata = [NSArray arrayWithArray:model.famous];
        
        NSArray *Bdata = [NSArray arrayWithArray:model.normal];
        
        NSDictionary *dic= [NSDictionary dictionaryWithDictionary:result];
        
        NSArray *famousArray = dic[@"famous"];
        //        NSLog(@"famous= %@",famousArray);
        
        //        NSLog(@"aaa = %@",famousArray[0]);
        //
        //        NSLog(@"id  = %@",[famousArray[0] objectForKey:@"id"]);
        
        for (int i = 0; i < famousArray.count; i++) {
            
            [self.idArray addObject:[famousArray[i] objectForKey:@"id"]];
            
        }
        
        NSMutableArray *normalArray = dic[@"normal"];
        
        
        for (int i = 0; i < normalArray.count; i ++) {
            
            [self.idMArray addObject:[normalArray[i] objectForKey:@"id"]];
            
        }
        [self.idMArray removeLastObject];
        
        
        for (Famous *dataModelA in Adata) {
            [self.dataSourceA addObject:dataModelA];
        }
        
        
        
        for (Normal *dataModelB in Bdata) {
            [self.dataSourceA addObject:dataModelB];
        }
        [self.dataSourceA removeLastObject];
        [self.colloectionView reloadData];
    }];
}





#pragma mark presentToInner
-(void)presentToInner:(UIButton *)sender{
 

   NSInteger section =  sender.tag - 101;
    
    NSLog(@"%ld",section);
    
    if (section <=  3) {
        
        NSInteger aaa = sender.tag - 100;
        
        NSString *a = @"http://mobile.ximalaya.com/mobile/discovery/v1/anchor/famous?category_id=";
        
        NSString *b = @"&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%98%8E%E6%98%9F%E5%A4%A7%E5%92%96&statModule=%E6%98%8E%E6%98%9F%E5%A4%A7%E5%92%96_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=";
        
        urlStringqqq = [NSString stringWithFormat:@"%@%@%@%ld",a,self.idArray[section],b,aaa];
        
        ZhuBoAAAViewController *ZhuBoAAAVC = [[ZhuBoAAAViewController alloc] initWithUrl:urlStringqqq];
        


        [self.navigationController pushViewController:ZhuBoAAAVC animated:YES];
        
    }
//    else{
    
        
        switch (section) {
            case 4:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=emotion&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%83%85%E6%84%9F%E7%94%9F%E6%B4%BB&statModule=%E6%83%85%E6%84%9F%E7%94%9F%E6%B4%BB_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=5";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 5:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=finance&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%95%86%E4%B8%9A%E8%B4%A2%E7%BB%8F&statModule=%E5%95%86%E4%B8%9A%E8%B4%A2%E7%BB%8F_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=6";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 6:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=culture&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%8E%86%E5%8F%B2%E4%BA%BA%E6%96%87&statModule=%E5%8E%86%E5%8F%B2%E4%BA%BA%E6%96%87_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=7";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 7:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=news&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%96%B0%E9%97%BB&statModule=%E6%96%B0%E9%97%BB_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=8";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 8:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=book&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%9C%89%E5%A3%B0%E5%B0%8F%E8%AF%B4&statModule=%E6%9C%89%E5%A3%B0%E5%B0%8F%E8%AF%B4_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=9";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 9:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=comic&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%9B%B8%E5%A3%B0%E8%AF%84%E4%B9%A6&statModule=%E7%9B%B8%E5%A3%B0%E8%AF%84%E4%B9%A6_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=10";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 10:
            {
                urlStringqqq = @"http://180.153.255.5/m/explore_user_list?category_name=entertainment&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%BB%BC%E8%89%BA%E5%A8%B1%E4%B9%90&statModule=%E7%BB%BC%E8%89%BA%E5%A8%B1%E4%B9%90_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=11";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 11:
            {
                urlStringqqq = @"http://180.153.255.5/m/explore_user_list?category_name=entertainment&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%BB%BC%E8%89%BA%E5%A8%B1%E4%B9%90&statModule=%E7%BB%BC%E8%89%BA%E5%A8%B1%E4%B9%90_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=12";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 12:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=train&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%A4%96%E8%AF%AD&statModule=%E5%A4%96%E8%AF%AD_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=13";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 13:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=music&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E9%9F%B3%E4%B9%90%E5%8F%B0&statModule=%E9%9F%B3%E4%B9%90%E5%8F%B0_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=14";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 14:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=trip&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%97%85%E6%B8%B8&statModule=%E6%97%85%E6%B8%B8_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=15";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 15:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=chair&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%9F%B9%E8%AE%AD%E8%AE%B2%E5%BA%A7%E8%BE%BE%E4%BA%BA&statModule=%E5%9F%B9%E8%AE%AD%E8%AE%B2%E5%BA%A7%E8%BE%BE%E4%BA%BA_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=16";
                
                NSLog(@"楚湘杰是sb");
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 16:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=kid&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%84%BF%E7%AB%A5&statModule=%E5%84%BF%E7%AB%A5_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=17";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 17:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=radio&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%94%B5%E5%8F%B0&statModule=%E7%94%B5%E5%8F%B0_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=18";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 18:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=car&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%B1%BD%E8%BD%A6&statModule=%E6%B1%BD%E8%BD%A6_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=19";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 19:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=njdj&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%94%B5%E5%8F%B0DJ&statModule=%E7%94%B5%E5%8F%B0DJ_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=20";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 20:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=opera&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%88%8F%E6%9B%B2&statModule=%E6%88%8F%E6%9B%B2_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=21";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 21:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=it&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40IT%E7%A7%91%E6%8A%80&statModule=IT%E7%A7%91%E6%8A%80_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=22";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 22:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=health&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%81%A5%E5%BA%B7%E5%85%BB%E7%94%9F&statModule=%E5%81%A5%E5%BA%B7%E5%85%BB%E7%94%9F_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=23";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 23:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=cover&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%BF%BB%E5%94%B1&statModule=%E7%BF%BB%E5%94%B1_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=24";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 24:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=storytelling&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E8%AF%B4%E4%B9%A6%E4%BA%BA&statModule=%E8%AF%B4%E4%B9%A6%E4%BA%BA_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=25";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 25:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=character&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%A3%B0%E4%BC%98%2F%E9%85%8D%E9%9F%B3&statModule=%E5%A3%B0%E4%BC%98%2F%E9%85%8D%E9%9F%B3_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=26";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 26:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=corporation&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%A4%BE%E5%9B%A2%E6%9C%BA%E6%9E%84&statModule=%E7%A4%BE%E5%9B%A2%E6%9C%BA%E6%9E%84_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=27";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 27:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=campus&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E6%A0%A1%E5%9B%AD%E7%94%B5%E5%8F%B0&statModule=%E6%A0%A1%E5%9B%AD%E7%94%B5%E5%8F%B0_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=28";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 28:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=mm&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%BE%8E%E5%A5%B3%E4%B8%BB%E6%92%AD&statModule=%E7%BE%8E%E5%A5%B3%E4%B8%BB%E6%92%AD_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=29";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 29:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=other&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%85%B6%E4%BB%96&statModule=%E5%85%B6%E4%BB%96_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=30";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 30:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=baishitong&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E7%99%BE%E8%A7%86%E9%80%9A%E4%B8%93%E5%8C%BA&statModule=%E7%99%BE%E8%A7%86%E9%80%9A%E4%B8%93%E5%8C%BA_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=31";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            case 31:
            {
                urlStringqqq = @"http://mobile.ximalaya.com/m/explore_user_list?category_name=ygwyzs&condition=hot&device=iPhone&page=1&per_page=20&statEvent=pageview%2Fuserlist%40%E5%A4%AE%E5%B9%BF%E6%96%87%E8%89%BA%E4%B9%8B%E5%A3%B0&statModule=%E5%A4%AE%E5%B9%BF%E6%96%87%E8%89%BA%E4%B9%8B%E5%A3%B0_%E6%9B%B4%E5%A4%9A&statPage=tab%40%E5%8F%91%E7%8E%B0_%E4%B8%BB%E6%92%AD&statPosition=32";
                
                ZhuBoBBBViewController *ZhuBoBBBVC = [[ZhuBoBBBViewController alloc]initWithUrl:urlStringqqq];
                [self.navigationController pushViewController:ZhuBoBBBVC animated:YES];
            }
                break;
            
            
            default:
                break;
        }
        
    }

    
        
    

//}




























@end
