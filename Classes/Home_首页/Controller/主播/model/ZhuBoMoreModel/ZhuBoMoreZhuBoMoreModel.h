//
//  ZhuBoMoreZhuBoMoreModel.h
//
//  Created by   on 16/11/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZhuBoMoreRelation;

@interface ZhuBoMoreZhuBoMoreModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double pageId;
@property (nonatomic, assign) double totalCount;
@property (nonatomic, assign) double maxPageId;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) ZhuBoMoreRelation *relation;
@property (nonatomic, assign) double ret;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
