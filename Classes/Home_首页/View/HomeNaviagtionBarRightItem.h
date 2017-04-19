//
//  HomeNaviagtionBarRightItem.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeNaviagtionBarRightItem : UIButton
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

+ (instancetype)initWithCustomRightItemWithFrame:(CGRect)frame
                                           Image:(NSString *)imageName;

@end
