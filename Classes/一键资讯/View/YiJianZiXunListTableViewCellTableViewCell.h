//
//  YiJianZiXunListTableViewCellTableViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YiJianZiXunListModel.h"

@interface YiJianZiXunListTableViewCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *coverTitle;
@property (weak, nonatomic) IBOutlet UIImageView *coverPath;
@property (weak, nonatomic) IBOutlet UILabel *createAt;
@property (weak, nonatomic) IBOutlet UILabel *playtimes;

@property (weak, nonatomic) IBOutlet UILabel *playDuration;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backgroundViewWidth;
@property (weak, nonatomic) IBOutlet UIButton *beginBtn;
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;

+ (instancetype)initCustomWithTableView:(UITableView *)tabelView Model:(YiJianZiXunListModel *)model;

@end
