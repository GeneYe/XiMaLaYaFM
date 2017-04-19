//
//  GYSpecialColumn.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYSpecialColumn.h"
#import "GYList.h"


NSString *const kGYSpecialColumnTitle = @"title";
NSString *const kGYSpecialColumnList = @"list";
NSString *const kGYSpecialColumnHasMore = @"hasMore";
NSString *const kGYSpecialColumnRet = @"ret";


@interface GYSpecialColumn ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYSpecialColumn

@synthesize title = _title;
@synthesize list = _list;
@synthesize hasMore = _hasMore;
@synthesize ret = _ret;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.title = [self objectOrNilForKey:kGYSpecialColumnTitle fromDictionary:dict];
    NSObject *receivedGYList = [dict objectForKey:kGYSpecialColumnList];
    NSMutableArray *parsedGYList = [NSMutableArray array];
    
    if ([receivedGYList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGYList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGYList addObject:[GYList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGYList isKindOfClass:[NSDictionary class]]) {
       [parsedGYList addObject:[GYList modelObjectWithDictionary:(NSDictionary *)receivedGYList]];
    }

    self.list = [NSArray arrayWithArray:parsedGYList];
            self.hasMore = [[self objectOrNilForKey:kGYSpecialColumnHasMore fromDictionary:dict] boolValue];
            self.ret = [[self objectOrNilForKey:kGYSpecialColumnRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kGYSpecialColumnTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGYSpecialColumnList];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kGYSpecialColumnHasMore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kGYSpecialColumnRet];

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

    self.title = [aDecoder decodeObjectForKey:kGYSpecialColumnTitle];
    self.list = [aDecoder decodeObjectForKey:kGYSpecialColumnList];
    self.hasMore = [aDecoder decodeBoolForKey:kGYSpecialColumnHasMore];
    self.ret = [aDecoder decodeDoubleForKey:kGYSpecialColumnRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kGYSpecialColumnTitle];
    [aCoder encodeObject:_list forKey:kGYSpecialColumnList];
    [aCoder encodeBool:_hasMore forKey:kGYSpecialColumnHasMore];
    [aCoder encodeDouble:_ret forKey:kGYSpecialColumnRet];
}

- (id)copyWithZone:(NSZone *)zone {
    GYSpecialColumn *copy = [[GYSpecialColumn alloc] init];
    
    
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.hasMore = self.hasMore;
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
