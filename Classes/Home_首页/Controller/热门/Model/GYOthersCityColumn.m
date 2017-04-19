//
//  GYOthersCityColumn.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYOthersCityColumn.h"
#import "GYOthersList.h"


NSString *const kGYOthersCityColumnCode = @"code";
NSString *const kGYOthersCityColumnTitle = @"title";
NSString *const kGYOthersCityColumnCount = @"count";
NSString *const kGYOthersCityColumnList = @"list";
NSString *const kGYOthersCityColumnHasMore = @"hasMore";
NSString *const kGYOthersCityColumnContentType = @"contentType";


@interface GYOthersCityColumn ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYOthersCityColumn

@synthesize code = _code;
@synthesize title = _title;
@synthesize count = _count;
@synthesize list = _list;
@synthesize hasMore = _hasMore;
@synthesize contentType = _contentType;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kGYOthersCityColumnCode fromDictionary:dict];
            self.title = [self objectOrNilForKey:kGYOthersCityColumnTitle fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kGYOthersCityColumnCount fromDictionary:dict] doubleValue];
    NSObject *receivedGYOthersList = [dict objectForKey:kGYOthersCityColumnList];
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
            self.hasMore = [[self objectOrNilForKey:kGYOthersCityColumnHasMore fromDictionary:dict] boolValue];
            self.contentType = [self objectOrNilForKey:kGYOthersCityColumnContentType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kGYOthersCityColumnCode];
    [mutableDict setValue:self.title forKey:kGYOthersCityColumnTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kGYOthersCityColumnCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGYOthersCityColumnList];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kGYOthersCityColumnHasMore];
    [mutableDict setValue:self.contentType forKey:kGYOthersCityColumnContentType];

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

    self.code = [aDecoder decodeObjectForKey:kGYOthersCityColumnCode];
    self.title = [aDecoder decodeObjectForKey:kGYOthersCityColumnTitle];
    self.count = [aDecoder decodeDoubleForKey:kGYOthersCityColumnCount];
    self.list = [aDecoder decodeObjectForKey:kGYOthersCityColumnList];
    self.hasMore = [aDecoder decodeBoolForKey:kGYOthersCityColumnHasMore];
    self.contentType = [aDecoder decodeObjectForKey:kGYOthersCityColumnContentType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kGYOthersCityColumnCode];
    [aCoder encodeObject:_title forKey:kGYOthersCityColumnTitle];
    [aCoder encodeDouble:_count forKey:kGYOthersCityColumnCount];
    [aCoder encodeObject:_list forKey:kGYOthersCityColumnList];
    [aCoder encodeBool:_hasMore forKey:kGYOthersCityColumnHasMore];
    [aCoder encodeObject:_contentType forKey:kGYOthersCityColumnContentType];
}

- (id)copyWithZone:(NSZone *)zone {
    GYOthersCityColumn *copy = [[GYOthersCityColumn alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.count = self.count;
        copy.list = [self.list copyWithZone:zone];
        copy.hasMore = self.hasMore;
        copy.contentType = [self.contentType copyWithZone:zone];
    }
    
    return copy;
}


@end
