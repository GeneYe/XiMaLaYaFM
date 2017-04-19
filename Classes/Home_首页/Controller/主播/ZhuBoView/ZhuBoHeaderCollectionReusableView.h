//
//  ZhuBoHeaderCollectionReusableView.h
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/21.
//  Copyright © 2016年 李东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Famous.h"
#import "Normal.h"

@interface ZhuBoHeaderCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (nonatomic,strong)Famous *famous;

@property (nonatomic,strong)Normal *normal;

@property (nonatomic,strong)NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UIButton *moreBtnAction;
@end
