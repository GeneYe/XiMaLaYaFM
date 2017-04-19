//
//  XiangGuangTuiJianCollectionViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/25.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiangGuangTuiJianCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverMiddle;
@property (weak, nonatomic) IBOutlet UILabel *coverTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumPlaysLabel;

@property (weak, nonatomic) IBOutlet UILabel *albumTracksLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLine;
@end
