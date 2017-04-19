//
//  JingPinTingDanTableViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "JingPinTingDanTableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation JingPinTingDanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView model:(JingPinTingDanModel *)model{
    
    static NSString *identifer = @"JingPinTingDanIdentifier";
    
    JingPinTingDanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JingPinTingDanTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        [cell.coverPath sd_setImageWithURL:[NSURL URLWithString:model.coverPathSmall]];
        cell.subtitle.text = model.subtitle;
        cell.coverTitle.text = model.title;
        cell.footnote.text = model.footnote;
    }
    
    tableView.separatorStyle = NO;
    
    return cell;
    
}

@end
