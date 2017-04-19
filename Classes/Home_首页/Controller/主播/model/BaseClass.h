//
//  BaseClass.h
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Relation;

@interface BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *famous;
@property (nonatomic, strong) Relation *relation;
@property (nonatomic, strong) NSArray *normal;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
