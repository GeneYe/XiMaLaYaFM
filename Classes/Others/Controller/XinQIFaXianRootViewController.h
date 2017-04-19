//
//  XinQIFaXianRootViewController.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "RootViewController.h"
#import "SelecterToolsScrollView.h"
#import "SelecterContentsScrollView.h"

@interface XinQIFaXianRootViewController : RootViewController

@property (nonatomic,strong)SelecterToolsScrollView *selecterToolScrollView;
@property (nonatomic,strong)SelecterContentsScrollView *selecterContentScrollView;

- (void)setUpSelecterToolScrollViewWithTitleArray:(NSArray *)array;

- (void)setUpSelecterContenntsScrollViewWithVCArray:(NSMutableArray *)array;

@end
