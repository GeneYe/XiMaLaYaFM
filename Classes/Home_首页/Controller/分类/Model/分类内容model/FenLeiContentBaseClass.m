//
//  FenLeiContentBaseClass.m
//
//  Created by   on 16/11/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FenLeiContentBaseClass.h"
#import "FenLeiContentCategoryContents.h"
#import "FenLeiContentKeywords.h"
#import "FenLeiContentFocusImages.h"


NSString *const kFenLeiContentBaseClassCategoryContents = @"categoryContents";
NSString *const kFenLeiContentBaseClassHasRecommendedZones = @"hasRecommendedZones";
NSString *const kFenLeiContentBaseClassKeywords = @"keywords";
NSString *const kFenLeiContentBaseClassFocusImages = @"focusImages";
NSString *const kFenLeiContentBaseClassMsg = @"msg";
NSString *const kFenLeiContentBaseClassRet = @"ret";


@interface FenLeiContentBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FenLeiContentBaseClass

@synthesize categoryContents = _categoryContents;
@synthesize hasRecommendedZones = _hasRecommendedZones;
@synthesize keywords = _keywords;
@synthesize focusImages = _focusImages;
@synthesize msg = _msg;
@synthesize ret = _ret;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.categoryContents = [FenLeiContentCategoryContents modelObjectWithDictionary:[dict objectForKey:kFenLeiContentBaseClassCategoryContents]];
            self.hasRecommendedZones = [[self objectOrNilForKey:kFenLeiContentBaseClassHasRecommendedZones fromDictionary:dict] boolValue];
            self.keywords = [FenLeiContentKeywords modelObjectWithDictionary:[dict objectForKey:kFenLeiContentBaseClassKeywords]];
            self.focusImages = [FenLeiContentFocusImages modelObjectWithDictionary:[dict objectForKey:kFenLeiContentBaseClassFocusImages]];
            self.msg = [self objectOrNilForKey:kFenLeiContentBaseClassMsg fromDictionary:dict];
            self.ret = [[self objectOrNilForKey:kFenLeiContentBaseClassRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.categoryContents dictionaryRepresentation] forKey:kFenLeiContentBaseClassCategoryContents];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasRecommendedZones] forKey:kFenLeiContentBaseClassHasRecommendedZones];
    [mutableDict setValue:[self.keywords dictionaryRepresentation] forKey:kFenLeiContentBaseClassKeywords];
    [mutableDict setValue:[self.focusImages dictionaryRepresentation] forKey:kFenLeiContentBaseClassFocusImages];
    [mutableDict setValue:self.msg forKey:kFenLeiContentBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kFenLeiContentBaseClassRet];

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

    self.categoryContents = [aDecoder decodeObjectForKey:kFenLeiContentBaseClassCategoryContents];
    self.hasRecommendedZones = [aDecoder decodeBoolForKey:kFenLeiContentBaseClassHasRecommendedZones];
    self.keywords = [aDecoder decodeObjectForKey:kFenLeiContentBaseClassKeywords];
    self.focusImages = [aDecoder decodeObjectForKey:kFenLeiContentBaseClassFocusImages];
    self.msg = [aDecoder decodeObjectForKey:kFenLeiContentBaseClassMsg];
    self.ret = [aDecoder decodeDoubleForKey:kFenLeiContentBaseClassRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryContents forKey:kFenLeiContentBaseClassCategoryContents];
    [aCoder encodeBool:_hasRecommendedZones forKey:kFenLeiContentBaseClassHasRecommendedZones];
    [aCoder encodeObject:_keywords forKey:kFenLeiContentBaseClassKeywords];
    [aCoder encodeObject:_focusImages forKey:kFenLeiContentBaseClassFocusImages];
    [aCoder encodeObject:_msg forKey:kFenLeiContentBaseClassMsg];
    [aCoder encodeDouble:_ret forKey:kFenLeiContentBaseClassRet];
}

- (id)copyWithZone:(NSZone *)zone {
    FenLeiContentBaseClass *copy = [[FenLeiContentBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.categoryContents = [self.categoryContents copyWithZone:zone];
        copy.hasRecommendedZones = self.hasRecommendedZones;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.focusImages = [self.focusImages copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
