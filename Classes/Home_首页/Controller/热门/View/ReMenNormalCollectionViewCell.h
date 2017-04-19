//
//  ReMenNormalCollectionViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface ReMenNormalCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *coverButton;

@property (weak, nonatomic) IBOutlet UILabel *trackTitle;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverButtonHeight;

@property (nonatomic,strong) GYOthersList *Otherlist;

@property (nonatomic,strong) GYList *list;

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;

@end
