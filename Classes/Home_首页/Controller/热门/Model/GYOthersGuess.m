//
//  GYOthersGuess.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYOthersGuess.h"


NSString *const kGYOthersGuessHasMore = @"hasMore";
NSString *const kGYOthersGuessTitle = @"title";
NSString *const kGYOthersGuessList = @"list";


@interface GYOthersGuess ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYOthersGuess

@synthesize hasMore = _hasMore;
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
            self.hasMore = [[self objectOrNilForKey:kGYOthersGuessHasMore fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kGYOthersGuessTitle fromDictionary:dict];
            self.list = [self objectOrNilForKey:kGYOthersGuessList fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kGYOthersGuessHasMore];
    [mutableDict setValue:self.title forKey:kGYOthersGuessTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGYOthersGuessList];

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

    self.hasMore = [aDecoder decodeBoolForKey:kGYOthersGuessHasMore];
    self.title = [aDecoder decodeObjectForKey:kGYOthersGuessTitle];
    self.list = [aDecoder decodeObjectForKey:kGYOthersGuessList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasMore forKey:kGYOthersGuessHasMore];
    [aCoder encodeObject:_title forKey:kGYOthersGuessTitle];
    [aCoder encodeObject:_list forKey:kGYOthersGuessList];
}

- (id)copyWithZone:(NSZone *)zone {
    GYOthersGuess *copy = [[GYOthersGuess alloc] init];
    
    
    
    if (copy) {

        copy.hasMore = self.hasMore;
        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
