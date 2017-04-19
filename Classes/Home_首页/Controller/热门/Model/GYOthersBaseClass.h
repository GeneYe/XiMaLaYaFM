//
//  GYOthersBaseClass.h
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GYOthersDiscoveryColumns, GYOthersGuess, GYOthersHotRecommends, GYOthersCityColumn;

@interface GYOthersBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GYOthersDiscoveryColumns *discoveryColumns;
@property (nonatomic, strong) GYOthersGuess *guess;
@property (nonatomic, strong) GYOthersHotRecommends *hotRecommends;
@property (nonatomic, strong) GYOthersCityColumn *cityColumn;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
