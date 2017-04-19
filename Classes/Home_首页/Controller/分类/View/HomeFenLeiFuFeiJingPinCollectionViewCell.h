//
//  HomeFenLeiFuFeiJingPinCollectionViewCell.h
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/17.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface HomeFenLeiFuFeiJingPinCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *coverImgeView;
@property (nonatomic,strong)HomeFenLeiList *homeFenLeiJingPinModel;

@end
