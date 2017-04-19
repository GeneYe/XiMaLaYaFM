//
//  GYOthersBaseClass.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYOthersBaseClass.h"
#import "GYOthersDiscoveryColumns.h"
#import "GYOthersGuess.h"
#import "GYOthersHotRecommends.h"
#import "GYOthersCityColumn.h"


NSString *const kGYOthersBaseClassDiscoveryColumns = @"discoveryColumns";
NSString *const kGYOthersBaseClassGuess = @"guess";
NSString *const kGYOthersBaseClassHotRecommends = @"hotRecommends";
NSString *const kGYOthersBaseClassCityColumn = @"cityColumn";
NSString *const kGYOthersBaseClassMsg = @"msg";
NSString *const kGYOthersBaseClassRet = @"ret";


@interface GYOthersBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYOthersBaseClass

@synthesize discoveryColumns = _discoveryColumns;
@synthesize guess = _guess;
@synthesize hotRecommends = _hotRecommends;
@synthesize cityColumn = _cityColumn;
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
            self.discoveryColumns = [GYOthersDiscoveryColumns modelObjectWithDictionary:[dict objectForKey:kGYOthersBaseClassDiscoveryColumns]];
            self.guess = [GYOthersGuess modelObjectWithDictionary:[dict objectForKey:kGYOthersBaseClassGuess]];
            self.hotRecommends = [GYOthersHotRecommends modelObjectWithDictionary:[dict objectForKey:kGYOthersBaseClassHotRecommends]];
            self.cityColumn = [GYOthersCityColumn modelObjectWithDictionary:[dict objectForKey:kGYOthersBaseClassCityColumn]];
            self.msg = [self objectOrNilForKey:kGYOthersBaseClassMsg fromDictionary:dict];
            self.ret = [[self objectOrNilForKey:kGYOthersBaseClassRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.discoveryColumns dictionaryRepresentation] forKey:kGYOthersBaseClassDiscoveryColumns];
    [mutableDict setValue:[self.guess dictionaryRepresentation] forKey:kGYOthersBaseClassGuess];
    [mutableDict setValue:[self.hotRecommends dictionaryRepresentation] forKey:kGYOthersBaseClassHotRecommends];
    [mutableDict setValue:[self.cityColumn dictionaryRepresentation] forKey:kGYOthersBaseClassCityColumn];
    [mutableDict setValue:self.msg forKey:kGYOthersBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kGYOthersBaseClassRet];

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

    self.discoveryColumns = [aDecoder decodeObjectForKey:kGYOthersBaseClassDiscoveryColumns];
    self.guess = [aDecoder decodeObjectForKey:kGYOthersBaseClassGuess];
    self.hotRecommends = [aDecoder decodeObjectForKey:kGYOthersBaseClassHotRecommends];
    self.cityColumn = [aDecoder decodeObjectForKey:kGYOthersBaseClassCityColumn];
    self.msg = [aDecoder decodeObjectForKey:kGYOthersBaseClassMsg];
    self.ret = [aDecoder decodeDoubleForKey:kGYOthersBaseClassRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_discoveryColumns forKey:kGYOthersBaseClassDiscoveryColumns];
    [aCoder encodeObject:_guess forKey:kGYOthersBaseClassGuess];
    [aCoder encodeObject:_hotRecommends forKey:kGYOthersBaseClassHotRecommends];
    [aCoder encodeObject:_cityColumn forKey:kGYOthersBaseClassCityColumn];
    [aCoder encodeObject:_msg forKey:kGYOthersBaseClassMsg];
    [aCoder encodeDouble:_ret forKey:kGYOthersBaseClassRet];
}

- (id)copyWithZone:(NSZone *)zone {
    GYOthersBaseClass *copy = [[GYOthersBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.discoveryColumns = [self.discoveryColumns copyWithZone:zone];
        copy.guess = [self.guess copyWithZone:zone];
        copy.hotRecommends = [self.hotRecommends copyWithZone:zone];
        copy.cityColumn = [self.cityColumn copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
