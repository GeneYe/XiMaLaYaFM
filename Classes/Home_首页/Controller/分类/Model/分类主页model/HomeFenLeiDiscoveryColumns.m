//
//  HomeFenLeiDiscoveryColumns.m
//
//  Created by   on 16/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeFenLeiDiscoveryColumns.h"


NSString *const kHomeFenLeiDiscoveryColumnsRet = @"ret";
NSString *const kHomeFenLeiDiscoveryColumnsTitle = @"title";
NSString *const kHomeFenLeiDiscoveryColumnsList = @"list";


@interface HomeFenLeiDiscoveryColumns ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeFenLeiDiscoveryColumns

@synthesize ret = _ret;
@synthesize title = _title;
@synthesize list = _list;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ret = [[self objectOrNilForKey:kHomeFenLeiDiscoveryColumnsRet fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kHomeFenLeiDiscoveryColumnsTitle fromDictionary:dict];
            self.list = [self objectOrNilForKey:kHomeFenLeiDiscoveryColumnsList fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kHomeFenLeiDiscoveryColumnsRet];
    [mutableDict setValue:self.title forKey:kHomeFenLeiDiscoveryColumnsTitle];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.list) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kHomeFenLeiDiscoveryColumnsList];

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

    self.ret = [aDecoder decodeDoubleForKey:kHomeFenLeiDiscoveryColumnsRet];
    self.title = [aDecoder decodeObjectForKey:kHomeFenLeiDiscoveryColumnsTitle];
    self.list = [aDecoder decodeObjectForKey:kHomeFenLeiDiscoveryColumnsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kHomeFenLeiDiscoveryColumnsRet];
    [aCoder encodeObject:_title forKey:kHomeFenLeiDiscoveryColumnsTitle];
    [aCoder encodeObject:_list forKey:kHomeFenLeiDiscoveryColumnsList];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeFenLeiDiscoveryColumns *copy = [[HomeFenLeiDiscoveryColumns alloc] init];
    
    
    
    if (copy) {

        copy.ret = self.ret;
        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
