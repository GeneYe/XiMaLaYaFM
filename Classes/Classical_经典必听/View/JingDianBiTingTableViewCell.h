//
//  JingDianBiTingTableViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JingDianBiTingModel.h"

@interface JingDianBiTingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverPath;

@property (weak, nonatomic) IBOutlet UILabel *coverTitle;
@property (weak, nonatomic) IBOutlet UILabel *tracksCounts;
@property (weak, nonatomic) IBOutlet UILabel *row;
@property (weak, nonatomic) IBOutlet UILabel *intro;

+ (instancetype)initCustomCellWith:(UITableView *)tableView
                             Model:(JingDianBiTingModel *)model
                               row:(NSInteger)row;

@end
