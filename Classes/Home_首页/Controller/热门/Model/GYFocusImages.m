//
//  GYFocusImages.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYFocusImages.h"
#import "GYList.h"


NSString *const kGYFocusImagesRet = @"ret";
NSString *const kGYFocusImagesTitle = @"title";
NSString *const kGYFocusImagesList = @"list";


@interface GYFocusImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYFocusImages

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
            self.ret = [[self objectOrNilForKey:kGYFocusImagesRet fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kGYFocusImagesTitle fromDictionary:dict];
    NSObject *receivedGYList = [dict objectForKey:kGYFocusImagesList];
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

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kGYFocusImagesRet];
    [mutableDict setValue:self.title forKey:kGYFocusImagesTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGYFocusImagesList];

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

    self.ret = [aDecoder decodeDoubleForKey:kGYFocusImagesRet];
    self.title = [aDecoder decodeObjectForKey:kGYFocusImagesTitle];
    self.list = [aDecoder decodeObjectForKey:kGYFocusImagesList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kGYFocusImagesRet];
    [aCoder encodeObject:_title forKey:kGYFocusImagesTitle];
    [aCoder encodeObject:_list forKey:kGYFocusImagesList];
}

- (id)copyWithZone:(NSZone *)zone {
    GYFocusImages *copy = [[GYFocusImages alloc] init];
    
    
    
    if (copy) {

        copy.ret = self.ret;
        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
