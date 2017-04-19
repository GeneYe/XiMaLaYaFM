//
//  JinRiZuiHuoViewController.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "RootViewController.h"
#import "SelecterToolsScrollView.h"
#import "SelecterContentsScrollView.h"

@interface JinRiZuiHuoViewController : RootViewController

@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)NSMutableArray *vcArray;
@property (nonatomic,strong)NSMutableArray *idArray;
@property (nonatomic,strong)SelecterToolsScrollView *selecterToolScrollView;
@property (nonatomic,strong)SelecterContentsScrollView *selecterContentScrollView;

@end
