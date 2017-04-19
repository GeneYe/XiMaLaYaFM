//
//  FenLeiContentCategoryContents.m
//
//  Created by   on 16/11/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FenLeiContentCategoryContents.h"
#import "FenLeiContentList.h"


NSString *const kFenLeiContentCategoryContentsRet = @"ret";
NSString *const kFenLeiContentCategoryContentsTitle = @"title";
NSString *const kFenLeiContentCategoryContentsList = @"list";


@interface FenLeiContentCategoryContents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FenLeiContentCategoryContents

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
            self.ret = [[self objectOrNilForKey:kFenLeiContentCategoryContentsRet fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kFenLeiContentCategoryContentsTitle fromDictionary:dict];
    NSObject *receivedFenLeiContentList = [dict objectForKey:kFenLeiContentCategoryContentsList];
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
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kFenLeiContentCategoryContentsRet];
    [mutableDict setValue:self.title forKey:kFenLeiContentCategoryContentsTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kFenLeiContentCategoryContentsList];

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

    self.ret = [aDecoder decodeDoubleForKey:kFenLeiContentCategoryContentsRet];
    self.title = [aDecoder decodeObjectForKey:kFenLeiContentCategoryContentsTitle];
    self.list = [aDecoder decodeObjectForKey:kFenLeiContentCategoryContentsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kFenLeiContentCategoryContentsRet];
    [aCoder encodeObject:_title forKey:kFenLeiContentCategoryContentsTitle];
    [aCoder encodeObject:_list forKey:kFenLeiContentCategoryContentsList];
}

- (id)copyWithZone:(NSZone *)zone {
    FenLeiContentCategoryContents *copy = [[FenLeiContentCategoryContents alloc] init];
    
    
    
    if (copy) {

        copy.ret = self.ret;
        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
