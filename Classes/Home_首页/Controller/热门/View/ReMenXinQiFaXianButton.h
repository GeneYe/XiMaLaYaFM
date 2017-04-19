//
//  ReMenXinQiFaXianButton.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReMenXinQiFaXianButton : UIButton

@property (weak, nonatomic) IBOutlet UIImageView *XinQiFaXianBtnImageView;

@property (weak, nonatomic) IBOutlet UILabel *XinQiFaXianBtnTitle;


+ (instancetype)initCustomWithFrame:(CGRect)frame;
@end
