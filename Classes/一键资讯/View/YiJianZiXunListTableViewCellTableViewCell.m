//
//  YiJianZiXunListTableViewCellTableViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "YiJianZiXunListTableViewCellTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "TimeChangeTool.h"

@implementation YiJianZiXunListTableViewCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+ (instancetype)initCustomWithTableView:(UITableView *)tabelView Model:(YiJianZiXunListModel *)model{
    
    static NSString *identifier = @"YiJianZiXunIdentifier";
    
    YiJianZiXunListTableViewCellTableViewCell *cell = [tabelView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YiJianZiXunListTableViewCellTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        [cell.coverPath sd_setImageWithURL:[NSURL URLWithString:model.coverLarge]];
        cell.coverTitle.text = model.title;
        cell.playtimes.text = [NSString stringWithFormat:@"%@",model.playtimes];
        
        cell.playDuration.text = [TimeChangeTool timeChangeWithDuration:[model.duration integerValue]];
        
        cell.createAt.text = [TimeChangeTool timeChangeWithCreatedAt:[model.createdAt integerValue]];
        
        CGFloat w = 50;
        
        cell.backgroundViewWidth.constant = w;
        cell.background.layer.cornerRadius = w/2;
        cell.background.layer.masksToBounds = YES;
        cell.background.layer.borderColor = GYCommonBgColor.CGColor;
        cell.background.layer.borderWidth = 1;
        
        cell.coverPath.layer.cornerRadius = w/2 - 3;
        cell.coverPath.layer.masksToBounds = YES;
        
        
        
    }
    tabelView.separatorStyle = NO;
    return cell;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (IBAction)beiginOrStopAction:(UIButton *)sender {
}
- (IBAction)downLoadAction:(UIButton *)sender {
}

@end
