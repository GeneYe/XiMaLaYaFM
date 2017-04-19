//
//  TingZongDianPingCollectionViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/25.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TingZongDianPingCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *smallLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *paytimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;

@property (nonatomic,assign)BOOL bottomLineIsHidden;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLine;

@end
