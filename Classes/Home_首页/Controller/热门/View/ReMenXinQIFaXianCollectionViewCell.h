//
//  ReMenXinQIFaXianCollectionViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYOthersBaseClass.h"
#import "GYOthersList.h"

#import "ReMenXinQiFaXianButton.h"

@interface ReMenXinQIFaXianCollectionViewCell : UICollectionViewCell


@property (nonatomic,strong)GYOthersDiscoveryColumns *discovery;

@property (nonatomic,strong)NSArray *list;

@property (nonatomic,strong)ReMenXinQiFaXianButton *faXianBtn;

@end
