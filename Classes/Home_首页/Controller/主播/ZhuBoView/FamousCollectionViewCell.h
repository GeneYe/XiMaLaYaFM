//
//  FamousCollectionViewCell.h
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/21.
//  Copyright © 2016年 李东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"

@interface FamousCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *smallLogo;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *verifyTitle;

@property (weak, nonatomic) IBOutlet UIView *topBGView;

@property (nonatomic,strong)List *list;

@end
