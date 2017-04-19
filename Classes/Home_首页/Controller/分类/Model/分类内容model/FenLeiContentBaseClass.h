//
//  FenLeiContentBaseClass.h
//
//  Created by   on 16/11/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FenLeiContentCategoryContents, FenLeiContentKeywords, FenLeiContentFocusImages;

@interface FenLeiContentBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) FenLeiContentCategoryContents *categoryContents;
@property (nonatomic, assign) BOOL hasRecommendedZones;
@property (nonatomic, strong) FenLeiContentKeywords *keywords;
@property (nonatomic, strong) FenLeiContentFocusImages *focusImages;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
