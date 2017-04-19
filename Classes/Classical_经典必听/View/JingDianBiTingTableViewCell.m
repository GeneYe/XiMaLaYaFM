//
//  JingDianBiTingTableViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "JingDianBiTingTableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation JingDianBiTingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



+(instancetype)initCustomCellWith:(UITableView *)tableView Model:(JingDianBiTingModel *)model row:(NSInteger)row{
    
    static NSString *identifier = @"JingDianBiTingCellIdentifier";
    
    JingDianBiTingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JingDianBiTingTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        [cell.coverPath sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle]];
        cell.coverTitle.text = model.title;
        cell.intro.text = model.intro;
        cell.tracksCounts.text = [NSString stringWithFormat:@"%@集",model.tracksCounts];
        cell.row.text = [NSString stringWithFormat:@"%ld",(long)row];
        
        if (row == 0) {
            cell.row.textColor = GYCommonBgColor;
            
        }
        else if (row == 1){
            cell.row.textColor = SecondColor;
        }
        else if (row == 2){
            cell.row.textColor = ThridColor;
        }
        else{
            cell.row.textColor = [UIColor blackColor];
        }
    
    tableView.separatorStyle = NO;

        
    }
    
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
