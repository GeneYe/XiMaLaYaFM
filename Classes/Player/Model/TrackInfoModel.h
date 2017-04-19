//
//  TrackInfoModel.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/23.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackInfoModel : NSObject

@property (nonatomic , strong) NSNumber              * isFree;
@property (nonatomic , strong) NSNumber              * bulletSwitchType;
@property (nonatomic , strong) NSNumber              * status;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , strong) NSNumber              * processState;
@property (nonatomic , strong) NSNumber              * duration;
@property (nonatomic , copy) NSString              * categoryName;
@property (nonatomic , copy) NSString              * coverMiddle;
@property (nonatomic , copy) NSString              * playPathHq;
@property (nonatomic , strong) NSNumber              * isPaid;
@property (nonatomic , strong) NSNumber              * isAuthorized;
@property (nonatomic , strong) NSArray              * images;
@property (nonatomic , copy) NSString              * playPathAacv224;
@property (nonatomic , strong) NSNumber              * createdAt;
@property (nonatomic , strong) NSNumber              * sampleDuration;
@property (nonatomic , strong) NSNumber              * downloadSize;
@property (nonatomic , copy) NSString              * downloadAacUrl;
@property (nonatomic , copy) NSString              * playUrl64;
@property (nonatomic , copy) NSString              * playPathAacv164;
@property (nonatomic , copy) NSString              * playUrl32;
@property (nonatomic , strong) NSNumber              * uid;
@property (nonatomic , strong) NSArray              * priceTypes;
@property (nonatomic , copy) NSString              * coverSmall;
@property (nonatomic , copy) NSString              * coverLarge;
@property (nonatomic , strong) NSNumber              * priceTypeId;
@property (nonatomic , strong) NSNumber              * downloadAacSize;
@property (nonatomic , copy) NSString              * downloadUrl;
@property (nonatomic , copy) NSString              * shortRichIntro;
@property (nonatomic , strong) NSNumber              * trackId;
@property (nonatomic , strong) NSNumber              * isPublic;
@property (nonatomic , strong) NSNumber              * priceTypeEnum;
@property (nonatomic , strong) NSNumber              * categoryId;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
