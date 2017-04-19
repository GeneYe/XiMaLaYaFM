//
//  Normal.m
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Normal.h"
#import "List.h"


NSString *const kNormalId = @"id";
NSString *const kNormalTitle = @"title";
NSString *const kNormalList = @"list";
NSString *const kNormalName = @"name";


@interface Normal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Normal

@synthesize normalIdentifier = _normalIdentifier;
@synthesize title = _title;
@synthesize list = _list;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.normalIdentifier = [[self objectOrNilForKey:kNormalId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kNormalTitle fromDictionary:dict];
    NSObject *receivedList = [dict objectForKey:kNormalList];
    NSMutableArray *parsedList = [NSMutableArray array];
    
    if ([receivedList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedList addObject:[List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedList isKindOfClass:[NSDictionary class]]) {
       [parsedList addObject:[List modelObjectWithDictionary:(NSDictionary *)receivedList]];
    }

    self.list = [NSArray arrayWithArray:parsedList];
            self.name = [self objectOrNilForKey:kNormalName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalIdentifier] forKey:kNormalId];
    [mutableDict setValue:self.title forKey:kNormalTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kNormalList];
    [mutableDict setValue:self.name forKey:kNormalName];

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

    self.normalIdentifier = [aDecoder decodeDoubleForKey:kNormalId];
    self.title = [aDecoder decodeObjectForKey:kNormalTitle];
    self.list = [aDecoder decodeObjectForKey:kNormalList];
    self.name = [aDecoder decodeObjectForKey:kNormalName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_normalIdentifier forKey:kNormalId];
    [aCoder encodeObject:_title forKey:kNormalTitle];
    [aCoder encodeObject:_list forKey:kNormalList];
    [aCoder encodeObject:_name forKey:kNormalName];
}

- (id)copyWithZone:(NSZone *)zone {
    Normal *copy = [[Normal alloc] init];
    
    
    
    if (copy) {

        copy.normalIdentifier = self.normalIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
