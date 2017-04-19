//
//  Famous.m
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Famous.h"
#import "List.h"


NSString *const kFamousId = @"id";
NSString *const kFamousTitle = @"title";
NSString *const kFamousDisplayStyle = @"displayStyle";
NSString *const kFamousList = @"list";


@interface Famous ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Famous

@synthesize famousIdentifier = _famousIdentifier;
@synthesize title = _title;
@synthesize displayStyle = _displayStyle;
@synthesize list = _list;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.famousIdentifier = [[self objectOrNilForKey:kFamousId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kFamousTitle fromDictionary:dict];
            self.displayStyle = [[self objectOrNilForKey:kFamousDisplayStyle fromDictionary:dict] doubleValue];
    NSObject *receivedList = [dict objectForKey:kFamousList];
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

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.famousIdentifier] forKey:kFamousId];
    [mutableDict setValue:self.title forKey:kFamousTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayStyle] forKey:kFamousDisplayStyle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kFamousList];

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

    self.famousIdentifier = [aDecoder decodeDoubleForKey:kFamousId];
    self.title = [aDecoder decodeObjectForKey:kFamousTitle];
    self.displayStyle = [aDecoder decodeDoubleForKey:kFamousDisplayStyle];
    self.list = [aDecoder decodeObjectForKey:kFamousList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_famousIdentifier forKey:kFamousId];
    [aCoder encodeObject:_title forKey:kFamousTitle];
    [aCoder encodeDouble:_displayStyle forKey:kFamousDisplayStyle];
    [aCoder encodeObject:_list forKey:kFamousList];
}

- (id)copyWithZone:(NSZone *)zone {
    Famous *copy = [[Famous alloc] init];
    
    
    
    if (copy) {

        copy.famousIdentifier = self.famousIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.displayStyle = self.displayStyle;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
