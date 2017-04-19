//
//  ReMenFenXiangModel.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReMenFenXiangModel : NSObject

@property (nonatomic , copy) NSString              * title;
@property (nonatomic , strong) NSNumber              * userSource;
@property (nonatomic , copy) NSString              * tags;
@property (nonatomic , strong) NSNumber              * duration;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , copy) NSString              * playPath32;
@property (nonatomic , copy) NSString              * playPath64;
@property (nonatomic , strong) NSNumber              * playsCounts;
@property (nonatomic , strong) NSNumber              * isAuthorized;
@property (nonatomic , strong) NSNumber              * createdAt;
@property (nonatomic , copy) NSString              * playPathAacv224;
@property (nonatomic , copy) NSString              * albumTitle;
@property (nonatomic , strong) NSNumber              * albumId;
@property (nonatomic , strong) NSNumber              * updatedAt;
@property (nonatomic , strong) NSNumber              * Id;
@property (nonatomic , copy) NSString              * coverSmall;
@property (nonatomic , copy) NSString              * playPathAacv164;
@property (nonatomic , strong) NSNumber              * sharesCounts;
@property (nonatomic , strong) NSNumber              * uid;
@property (nonatomic , strong) NSNumber              * priceTypeId;
@property (nonatomic , strong) NSNumber              * trackId;
@property (nonatomic , strong) NSNumber              * commentsCounts;
@property (nonatomic , strong) NSNumber              * favoritesCounts;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
