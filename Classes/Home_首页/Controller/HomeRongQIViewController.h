//
//  HomeRongQIViewController.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/16.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "RootViewController.h"
#import "SelecterToolsScrollView.h"
#import "SelecterContentsScrollView.h"

@interface HomeRongQIViewController : RootViewController

@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSMutableArray *vcArray;
@property (nonatomic,strong)SelecterToolsScrollView *selecterToolScrollView;
@property (nonatomic,strong)SelecterContentsScrollView *selecterContentScrollView;

@end
