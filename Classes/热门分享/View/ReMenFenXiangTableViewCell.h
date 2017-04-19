//
//  ReMenFenXiangTableViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReMenFenXiangModel.h"

#import "JinRIZuiHuoListModel.h"

@interface ReMenFenXiangTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *whiteColorBackView;

@property (weak, nonatomic) IBOutlet UIButton *statusBtn;
@property (weak, nonatomic) IBOutlet UILabel *numberOfRow;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backgroundWidth;

+ (instancetype)initCustomCellWithtableView:(UITableView *)tableView WithReMenFenXiangModel:(ReMenFenXiangModel *)model Row:(NSInteger)row;

+ (instancetype)initCustomCellWithtableView:(UITableView *)tableView WithJinRiZuiHuoListModel:(JinRIZuiHuoListModel *)model Row:(NSInteger)row;

@end
