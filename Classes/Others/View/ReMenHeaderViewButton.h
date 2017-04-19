//
//  ReMenHeaderViewButton.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReMenHeaderViewButton : UIButton

@property (weak, nonatomic) IBOutlet UILabel *reMenHeaderViewTitleLabel;

+ (instancetype)initCustomHeaderButtonWithFrame:(CGRect)frame;

@end
