//
//  YiJianZiXunListModel.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YiJianZiXunListModel : NSObject

@property (nonatomic , strong) NSNumber              * status;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , strong) NSNumber              * userSource;
@property (nonatomic , strong) NSNumber              * processState;
@property (nonatomic , strong) NSNumber              * duration;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , strong) NSNumber              * likes;
@property (nonatomic , copy) NSString              * playPathHq;
@property (nonatomic , copy) NSString              * coverMiddle;
@property (nonatomic , strong) NSNumber              * isPaid;
@property (nonatomic , strong) NSNumber              * shares;
@property (nonatomic , copy) NSString              * playPathAacv224;
@property (nonatomic , strong) NSNumber              * createdAt;
@property (nonatomic , copy) NSString              * smallLogo;
@property (nonatomic , strong) NSNumber              * albumId;
@property (nonatomic , strong) NSNumber              * playtimes;
@property (nonatomic , copy) NSString              * playUrl64;
@property (nonatomic , copy) NSString              * playPathAacv164;
@property (nonatomic , copy) NSString              * playUrl32;
@property (nonatomic , strong) NSNumber              * uid;
@property (nonatomic , copy) NSString              * coverSmall;
@property (nonatomic , copy) NSString              * coverLarge;
@property (nonatomic , strong) NSNumber              * comments;
@property (nonatomic , strong) NSNumber              * trackId;
@property (nonatomic , strong) NSNumber              * opType;
@property (nonatomic , strong) NSNumber              * isPublic;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
