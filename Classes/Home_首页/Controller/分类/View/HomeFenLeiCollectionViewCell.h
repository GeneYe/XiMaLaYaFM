//
//  HomeFenLeiCollectionViewCell.h
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/15.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface HomeFenLeiCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic,strong)HomeFenLeiList *homeFenLeiListModel;

@end
