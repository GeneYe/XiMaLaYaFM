//
//  GYOthersList.h
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GYOthersProperties;

@interface GYOthersList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double categoryType;
@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, strong) NSString *trackTitle;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double priceTypeEnum;
@property (nonatomic, strong) NSString *displayPrice;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double score;
@property (nonatomic, assign) BOOL isExternalUrl;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, assign) BOOL isFinished;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double trackId;
@property (nonatomic, strong) NSString *displayDiscountedPrice;
@property (nonatomic, assign) BOOL filterSupported;
@property (nonatomic, strong) NSString *provider;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double serialState;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *sharePic;
@property (nonatomic, assign) double discountedPrice;
@property (nonatomic, strong) GYOthersProperties *properties;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) double priceTypeId;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double tracks;
@property (nonatomic, strong) NSString *coverPath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *albumCoverUrl290;
@property (nonatomic, assign) BOOL enableShare;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
