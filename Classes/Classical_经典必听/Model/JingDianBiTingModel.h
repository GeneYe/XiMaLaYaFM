//
//  JingDianBiTingModel.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JingDianBiTingModel : NSObject

@property (nonatomic , strong) NSNumber              * Id;
@property (nonatomic , copy) NSString              * intro;
@property (nonatomic , strong) NSNumber              * playsCounts;
@property (nonatomic , strong) NSNumber              * tracks;
@property (nonatomic , strong) NSNumber              * tracksCounts;
@property (nonatomic , strong) NSNumber              * uid;
@property (nonatomic , copy) NSString              * coverSmall;
@property (nonatomic , strong) NSNumber              * isFinished;
@property (nonatomic , strong) NSNumber              * isPaid;
@property (nonatomic , copy) NSString              * coverMiddle;
@property (nonatomic , strong) NSNumber              * lastUptrackAt;
@property (nonatomic , copy) NSString              * tags;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * albumCoverUrl290;
@property (nonatomic , strong) NSNumber              * serialState;
@property (nonatomic , strong) NSNumber              * albumId;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , strong) NSNumber              * priceTypeId;
@property (nonatomic , strong) NSNumber              * lastUptrackId;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
