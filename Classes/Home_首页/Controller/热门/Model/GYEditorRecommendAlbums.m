//
//  GYEditorRecommendAlbums.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYEditorRecommendAlbums.h"
#import "GYList.h"


NSString *const kGYEditorRecommendAlbumsTitle = @"title";
NSString *const kGYEditorRecommendAlbumsList = @"list";
NSString *const kGYEditorRecommendAlbumsHasMore = @"hasMore";
NSString *const kGYEditorRecommendAlbumsRet = @"ret";


@interface GYEditorRecommendAlbums ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYEditorRecommendAlbums

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
            self.title = [self objectOrNilForKey:kGYEditorRecommendAlbumsTitle fromDictionary:dict];
    NSObject *receivedGYList = [dict objectForKey:kGYEditorRecommendAlbumsList];
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
            self.hasMore = [[self objectOrNilForKey:kGYEditorRecommendAlbumsHasMore fromDictionary:dict] boolValue];
            self.ret = [[self objectOrNilForKey:kGYEditorRecommendAlbumsRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kGYEditorRecommendAlbumsTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGYEditorRecommendAlbumsList];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kGYEditorRecommendAlbumsHasMore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kGYEditorRecommendAlbumsRet];

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

    self.title = [aDecoder decodeObjectForKey:kGYEditorRecommendAlbumsTitle];
    self.list = [aDecoder decodeObjectForKey:kGYEditorRecommendAlbumsList];
    self.hasMore = [aDecoder decodeBoolForKey:kGYEditorRecommendAlbumsHasMore];
    self.ret = [aDecoder decodeDoubleForKey:kGYEditorRecommendAlbumsRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kGYEditorRecommendAlbumsTitle];
    [aCoder encodeObject:_list forKey:kGYEditorRecommendAlbumsList];
    [aCoder encodeBool:_hasMore forKey:kGYEditorRecommendAlbumsHasMore];
    [aCoder encodeDouble:_ret forKey:kGYEditorRecommendAlbumsRet];
}

- (id)copyWithZone:(NSZone *)zone {
    GYEditorRecommendAlbums *copy = [[GYEditorRecommendAlbums alloc] init];
    
    
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.hasMore = self.hasMore;
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
