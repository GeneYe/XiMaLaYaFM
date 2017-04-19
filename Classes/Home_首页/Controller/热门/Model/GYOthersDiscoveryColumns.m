//
//  GYOthersDiscoveryColumns.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYOthersDiscoveryColumns.h"
#import "GYOthersList.h"


NSString *const kGYOthersDiscoveryColumnsRet = @"ret";
NSString *const kGYOthersDiscoveryColumnsTitle = @"title";
NSString *const kGYOthersDiscoveryColumnsList = @"list";


@interface GYOthersDiscoveryColumns ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYOthersDiscoveryColumns

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
            self.ret = [[self objectOrNilForKey:kGYOthersDiscoveryColumnsRet fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kGYOthersDiscoveryColumnsTitle fromDictionary:dict];
    NSObject *receivedGYOthersList = [dict objectForKey:kGYOthersDiscoveryColumnsList];
    NSMutableArray *parsedGYOthersList = [NSMutableArray array];
    
    if ([receivedGYOthersList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGYOthersList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGYOthersList addObject:[GYOthersList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGYOthersList isKindOfClass:[NSDictionary class]]) {
       [parsedGYOthersList addObject:[GYOthersList modelObjectWithDictionary:(NSDictionary *)receivedGYOthersList]];
    }

    self.list = [NSArray arrayWithArray:parsedGYOthersList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kGYOthersDiscoveryColumnsRet];
    [mutableDict setValue:self.title forKey:kGYOthersDiscoveryColumnsTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGYOthersDiscoveryColumnsList];

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

    self.ret = [aDecoder decodeDoubleForKey:kGYOthersDiscoveryColumnsRet];
    self.title = [aDecoder decodeObjectForKey:kGYOthersDiscoveryColumnsTitle];
    self.list = [aDecoder decodeObjectForKey:kGYOthersDiscoveryColumnsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kGYOthersDiscoveryColumnsRet];
    [aCoder encodeObject:_title forKey:kGYOthersDiscoveryColumnsTitle];
    [aCoder encodeObject:_list forKey:kGYOthersDiscoveryColumnsList];
}

- (id)copyWithZone:(NSZone *)zone {
    GYOthersDiscoveryColumns *copy = [[GYOthersDiscoveryColumns alloc] init];
    
    
    
    if (copy) {

        copy.ret = self.ret;
        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
