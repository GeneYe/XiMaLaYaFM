//
//  ReMenFenXiangTableViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenFenXiangTableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation ReMenFenXiangTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+(instancetype)initCustomCellWithtableView:(UITableView *)tableView WithReMenFenXiangModel:(ReMenFenXiangModel *)model Row:(NSInteger)row{
    
    static NSString *cellIdentifier = @"RemenFenXiangIdentifier";
    
    ReMenFenXiangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ReMenFenXiangTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        [cell.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.coverSmall]];
        cell.cellTitle.text = model.title;
        cell.nickname.text = model.nickname;
        
        CGFloat backgourndWidth = 40.0;
        
        cell.backgroundWidth.constant = backgourndWidth;
        cell.whiteColorBackView.layer.cornerRadius = backgourndWidth/2;
        cell.whiteColorBackView.layer.borderColor = GYCommonBgColor.CGColor;
        cell.whiteColorBackView.layer.borderWidth = 0.7;
        cell.whiteColorBackView.layer.masksToBounds = YES;
        cell.coverImageView.layer.cornerRadius = backgourndWidth/2 -3.0 ;
        cell.coverImageView.layer.masksToBounds = YES;
        
        cell.numberOfRow.text = [NSString stringWithFormat:@"%ld",(row+1)];
        
        if (row == 0) {
            cell.numberOfRow.textColor = GYCommonBgColor;
            
        }
        else if (row == 1){
            cell.numberOfRow.textColor = SecondColor;
        }
        else if (row == 2){
            cell.numberOfRow.textColor = ThridColor;
        }
        else{
            cell.numberOfRow.textColor = [UIColor blackColor];
        }
        
    }
    


    
    return cell;
    
}

+ (instancetype)initCustomCellWithtableView:(UITableView *)tableView WithJinRiZuiHuoListModel:(JinRIZuiHuoListModel *)model Row:(NSInteger)row{
    static NSString *cellIdentifier = @"JinRiZuiHuoCellIdentifier";
    
    ReMenFenXiangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ReMenFenXiangTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        [cell.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.coverSmall]];
        cell.cellTitle.text = model.title;
        cell.nickname.text = model.nickname;
        
        CGFloat backgourndWidth = 40.0;
        
        cell.backgroundWidth.constant = backgourndWidth;
        cell.whiteColorBackView.layer.cornerRadius = backgourndWidth/2;
        cell.whiteColorBackView.layer.borderColor = GYCommonBgColor.CGColor;
        cell.whiteColorBackView.layer.borderWidth = 0.7;
        cell.whiteColorBackView.layer.masksToBounds = YES;
        cell.coverImageView.layer.cornerRadius = backgourndWidth/2 -3.0 ;
        cell.coverImageView.layer.masksToBounds = YES;
        
        cell.numberOfRow.text = [NSString stringWithFormat:@"%ld",(row+1)];
        
        if (row == 0) {
            cell.numberOfRow.textColor = GYCommonBgColor;
            
        }
        else if (row == 1){
            cell.numberOfRow.textColor = SecondColor;
        }
        else if (row == 2){
            cell.numberOfRow.textColor = ThridColor;
        }
        else{
            cell.numberOfRow.textColor = [UIColor blackColor];
        }
        
    }
    
    tableView.separatorStyle = NO;
    
    
    return cell;

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
