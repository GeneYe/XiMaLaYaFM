//
//  DiscoveryTableViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "DiscoveryTableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation DiscoveryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView Model:(DiscoveryListModel *)model{
    
    static NSString *identifier = @"discoveryCellIdentifier";
    DiscoveryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DiscoveryTableViewCell" owner:nil options:nil] objectAtIndex:0];
        cell.coverTitle.text = model.title;
        cell.subtitle.text = model.subtitle;
        [cell.coverPath sd_setImageWithURL:[NSURL URLWithString:model.coverPath]];
        
//        if (model.subCoverPath) {
//            [cell.subCoverPath sd_setImageWithURL:[NSURL URLWithString:model.subCoverPath]];
//            cell.coverImageViewToCellArrow.constant = 36;
//            
//        }
//        else{
//            cell.coverImageViewToCellArrow.constant = 8;
//        }
        
        
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
