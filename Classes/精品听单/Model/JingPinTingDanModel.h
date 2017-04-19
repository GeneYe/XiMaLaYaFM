//
//  JingPinTingDanModel.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JingPinTingDanModel : NSObject

@property (nonatomic , strong) NSNumber              * specialId;
@property (nonatomic , strong) NSNumber              * isPaid;
@property (nonatomic , copy) NSString              * subtitle;
@property (nonatomic , copy) NSString              * coverPathSmall;
@property (nonatomic , strong) NSNumber              * contentType;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * footnote;
@property (nonatomic , copy) NSString              * coverPathBig;
@property (nonatomic , strong) NSNumber              * releasedAt;
@property (nonatomic , strong) NSNumber              * isHot;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
