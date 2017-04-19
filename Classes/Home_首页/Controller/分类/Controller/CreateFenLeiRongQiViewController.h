//
//  CreateFenLeiRongQiViewController.h
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/17.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelecterToolsScrollView.h"
#import "SelecterContentsScrollView.h"

@interface CreateFenLeiRongQiViewController : UIViewController

@property (nonatomic,strong)NSMutableArray *fenLeiRongQiVC;
@property (nonatomic,assign)NSUInteger rongQiID;

@property (nonatomic,assign)NSUInteger ID;
@property (nonatomic,assign)NSUInteger rongQiCount;


@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)SelecterToolsScrollView *selecterToolsScrollView;
@property (nonatomic,strong)NSMutableArray *vcArray;
@property (nonatomic,strong)SelecterContentsScrollView *selecterContentsScrollView;

@end
