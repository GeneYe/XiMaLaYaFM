//
//  DingYueNoDataView.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "DingYueNoDataView.h"

@implementation DingYueNoDataView

+ (instancetype)initCustomViewWithFrame:(CGRect)frame{
    
    DingYueNoDataView *view  = [[[NSBundle mainBundle] loadNibNamed:@"DingYueNoDataView" owner:nil options:nil] objectAtIndex:0];
    
    view.pushToTuiJianButton.layer.cornerRadius = 6.0;
    view.pushToTuiJianButton.layer.masksToBounds = YES;
    
    view.frame = frame;
    
    return view;
}

@end
