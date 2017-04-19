//
//  GYList.h
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GYList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *trackTitle;
@property (nonatomic, assign) BOOL isShare;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, assign) double subType;
@property (nonatomic, assign) BOOL isExternalUrl;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double columnType;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, assign) double isFinished;
@property (nonatomic, assign) double trackId;
@property (nonatomic, strong) NSString *provider;
@property (nonatomic, assign) double specialId;
@property (nonatomic, assign) double serialState;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, strong) NSString *footnote;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) double priceTypeId;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double tracks;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *longTitle;
@property (nonatomic, strong) NSString *coverPath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *albumCoverUrl290;
@property (nonatomic, strong) NSString *coverSmall;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
