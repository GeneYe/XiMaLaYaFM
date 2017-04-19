//
//  FenLeiContentKeywords.m
//
//  Created by   on 16/11/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FenLeiContentKeywords.h"
#import "FenLeiContentList.h"


NSString *const kFenLeiContentKeywordsTitle = @"title";
NSString *const kFenLeiContentKeywordsList = @"list";


@interface FenLeiContentKeywords ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FenLeiContentKeywords

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
            self.title = [self objectOrNilForKey:kFenLeiContentKeywordsTitle fromDictionary:dict];
    NSObject *receivedFenLeiContentList = [dict objectForKey:kFenLeiContentKeywordsList];
    NSMutableArray *parsedFenLeiContentList = [NSMutableArray array];
    
    if ([receivedFenLeiContentList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFenLeiContentList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFenLeiContentList addObject:[FenLeiContentList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFenLeiContentList isKindOfClass:[NSDictionary class]]) {
       [parsedFenLeiContentList addObject:[FenLeiContentList modelObjectWithDictionary:(NSDictionary *)receivedFenLeiContentList]];
    }

    self.list = [NSArray arrayWithArray:parsedFenLeiContentList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kFenLeiContentKeywordsTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kFenLeiContentKeywordsList];

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

    self.title = [aDecoder decodeObjectForKey:kFenLeiContentKeywordsTitle];
    self.list = [aDecoder decodeObjectForKey:kFenLeiContentKeywordsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kFenLeiContentKeywordsTitle];
    [aCoder encodeObject:_list forKey:kFenLeiContentKeywordsList];
}

- (id)copyWithZone:(NSZone *)zone {
    FenLeiContentKeywords *copy = [[FenLeiContentKeywords alloc] init];
    
    
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
