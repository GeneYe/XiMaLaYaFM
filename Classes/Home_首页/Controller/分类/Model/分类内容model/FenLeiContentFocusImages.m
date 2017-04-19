//
//  FenLeiContentFocusImages.m
//
//  Created by   on 16/11/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FenLeiContentFocusImages.h"
#import "FenLeiContentList.h"


NSString *const kFenLeiContentFocusImagesRet = @"ret";
NSString *const kFenLeiContentFocusImagesTitle = @"title";
NSString *const kFenLeiContentFocusImagesList = @"list";


@interface FenLeiContentFocusImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FenLeiContentFocusImages

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
            self.ret = [[self objectOrNilForKey:kFenLeiContentFocusImagesRet fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kFenLeiContentFocusImagesTitle fromDictionary:dict];
    NSObject *receivedFenLeiContentList = [dict objectForKey:kFenLeiContentFocusImagesList];
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
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kFenLeiContentFocusImagesRet];
    [mutableDict setValue:self.title forKey:kFenLeiContentFocusImagesTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kFenLeiContentFocusImagesList];

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

    self.ret = [aDecoder decodeDoubleForKey:kFenLeiContentFocusImagesRet];
    self.title = [aDecoder decodeObjectForKey:kFenLeiContentFocusImagesTitle];
    self.list = [aDecoder decodeObjectForKey:kFenLeiContentFocusImagesList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kFenLeiContentFocusImagesRet];
    [aCoder encodeObject:_title forKey:kFenLeiContentFocusImagesTitle];
    [aCoder encodeObject:_list forKey:kFenLeiContentFocusImagesList];
}

- (id)copyWithZone:(NSZone *)zone {
    FenLeiContentFocusImages *copy = [[FenLeiContentFocusImages alloc] init];
    
    
    
    if (copy) {

        copy.ret = self.ret;
        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
