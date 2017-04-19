//
//  DiscoveryTableViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoveryListModel.h"

@interface DiscoveryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverPath;
@property (weak, nonatomic) IBOutlet UILabel *coverTitle;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UIImageView *subCoverPath;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverImageViewToCellArrow;

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView Model:(DiscoveryListModel *)model;


@end
