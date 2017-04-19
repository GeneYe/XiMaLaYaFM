//
//  ScetionTwoCollectionViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/24.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScetionTwoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *albumInfoTitle;
@property (weak, nonatomic) IBOutlet UILabel *albumSubscribesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *trackInfoTitle;
@property (weak, nonatomic) IBOutlet UILabel *upDataDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *shortRichIntroLabel;
@end
