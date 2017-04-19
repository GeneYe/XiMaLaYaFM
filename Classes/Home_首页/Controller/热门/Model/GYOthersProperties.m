//
//  GYOthersProperties.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYOthersProperties.h"


NSString *const kGYOthersPropertiesCityCode = @"cityCode";
NSString *const kGYOthersPropertiesIsPaid = @"isPaid";
NSString *const kGYOthersPropertiesCityTitle = @"cityTitle";
NSString *const kGYOthersPropertiesContentType = @"contentType";
NSString *const kGYOthersPropertiesCategoryId = @"categoryId";
NSString *const kGYOthersPropertiesRankingListId = @"rankingListId";
NSString *const kGYOthersPropertiesKey = @"key";


@interface GYOthersProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYOthersProperties

@synthesize cityCode = _cityCode;
@synthesize isPaid = _isPaid;
@synthesize cityTitle = _cityTitle;
@synthesize contentType = _contentType;
@synthesize categoryId = _categoryId;
@synthesize rankingListId = _rankingListId;
@synthesize key = _key;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cityCode = [self objectOrNilForKey:kGYOthersPropertiesCityCode fromDictionary:dict];
            self.isPaid = [[self objectOrNilForKey:kGYOthersPropertiesIsPaid fromDictionary:dict] boolValue];
            self.cityTitle = [self objectOrNilForKey:kGYOthersPropertiesCityTitle fromDictionary:dict];
            self.contentType = [self objectOrNilForKey:kGYOthersPropertiesContentType fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kGYOthersPropertiesCategoryId fromDictionary:dict] doubleValue];
            self.rankingListId = [[self objectOrNilForKey:kGYOthersPropertiesRankingListId fromDictionary:dict] doubleValue];
            self.key = [self objectOrNilForKey:kGYOthersPropertiesKey fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cityCode forKey:kGYOthersPropertiesCityCode];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kGYOthersPropertiesIsPaid];
    [mutableDict setValue:self.cityTitle forKey:kGYOthersPropertiesCityTitle];
    [mutableDict setValue:self.contentType forKey:kGYOthersPropertiesContentType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kGYOthersPropertiesCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rankingListId] forKey:kGYOthersPropertiesRankingListId];
    [mutableDict setValue:self.key forKey:kGYOthersPropertiesKey];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.cityCode = [aDecoder decodeObjectForKey:kGYOthersPropertiesCityCode];
    self.isPaid = [aDecoder decodeBoolForKey:kGYOthersPropertiesIsPaid];
    self.cityTitle = [aDecoder decodeObjectForKey:kGYOthersPropertiesCityTitle];
    self.contentType = [aDecoder decodeObjectForKey:kGYOthersPropertiesContentType];
    self.categoryId = [aDecoder decodeDoubleForKey:kGYOthersPropertiesCategoryId];
    self.rankingListId = [aDecoder decodeDoubleForKey:kGYOthersPropertiesRankingListId];
    self.key = [aDecoder decodeObjectForKey:kGYOthersPropertiesKey];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cityCode forKey:kGYOthersPropertiesCityCode];
    [aCoder encodeBool:_isPaid forKey:kGYOthersPropertiesIsPaid];
    [aCoder encodeObject:_cityTitle forKey:kGYOthersPropertiesCityTitle];
    [aCoder encodeObject:_contentType forKey:kGYOthersPropertiesContentType];
    [aCoder encodeDouble:_categoryId forKey:kGYOthersPropertiesCategoryId];
    [aCoder encodeDouble:_rankingListId forKey:kGYOthersPropertiesRankingListId];
    [aCoder encodeObject:_key forKey:kGYOthersPropertiesKey];
}

- (id)copyWithZone:(NSZone *)zone {
    GYOthersProperties *copy = [[GYOthersProperties alloc] init];
    
    
    
    if (copy) {

        copy.cityCode = [self.cityCode copyWithZone:zone];
        copy.isPaid = self.isPaid;
        copy.cityTitle = [self.cityTitle copyWithZone:zone];
        copy.contentType = [self.contentType copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.rankingListId = self.rankingListId;
        copy.key = [self.key copyWithZone:zone];
    }
    
    return copy;
}


@end
