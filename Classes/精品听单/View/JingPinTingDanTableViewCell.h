//
//  JingPinTingDanTableViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JingPinTingDanModel.h"

@interface JingPinTingDanTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverPath;
@property (weak, nonatomic) IBOutlet UILabel *coverTitle;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *footnote;

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView model:(JingPinTingDanModel *)model;

@end
