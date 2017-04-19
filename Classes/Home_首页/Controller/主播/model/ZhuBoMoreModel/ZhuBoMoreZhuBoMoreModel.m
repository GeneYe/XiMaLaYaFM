//
//  ZhuBoMoreZhuBoMoreModel.m
//
//  Created by   on 16/11/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZhuBoMoreZhuBoMoreModel.h"
#import "ZhuBoMoreRelation.h"
#import "ZhuBoMoreList.h"


NSString *const kZhuBoMoreZhuBoMoreModelPageSize = @"pageSize";
NSString *const kZhuBoMoreZhuBoMoreModelPageId = @"pageId";
NSString *const kZhuBoMoreZhuBoMoreModelTotalCount = @"totalCount";
NSString *const kZhuBoMoreZhuBoMoreModelMaxPageId = @"maxPageId";
NSString *const kZhuBoMoreZhuBoMoreModelMsg = @"msg";
NSString *const kZhuBoMoreZhuBoMoreModelRelation = @"relation";
NSString *const kZhuBoMoreZhuBoMoreModelRet = @"ret";
NSString *const kZhuBoMoreZhuBoMoreModelList = @"list";


@interface ZhuBoMoreZhuBoMoreModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZhuBoMoreZhuBoMoreModel

@synthesize pageSize = _pageSize;
@synthesize pageId = _pageId;
@synthesize totalCount = _totalCount;
@synthesize maxPageId = _maxPageId;
@synthesize msg = _msg;
@synthesize relation = _relation;
@synthesize ret = _ret;
@synthesize list = _list;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pageSize = [[self objectOrNilForKey:kZhuBoMoreZhuBoMoreModelPageSize fromDictionary:dict] doubleValue];
            self.pageId = [[self objectOrNilForKey:kZhuBoMoreZhuBoMoreModelPageId fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kZhuBoMoreZhuBoMoreModelTotalCount fromDictionary:dict] doubleValue];
            self.maxPageId = [[self objectOrNilForKey:kZhuBoMoreZhuBoMoreModelMaxPageId fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kZhuBoMoreZhuBoMoreModelMsg fromDictionary:dict];
            self.relation = [ZhuBoMoreRelation modelObjectWithDictionary:[dict objectForKey:kZhuBoMoreZhuBoMoreModelRelation]];
            self.ret = [[self objectOrNilForKey:kZhuBoMoreZhuBoMoreModelRet fromDictionary:dict] doubleValue];
    NSObject *receivedZhuBoMoreList = [dict objectForKey:kZhuBoMoreZhuBoMoreModelList];
    NSMutableArray *parsedZhuBoMoreList = [NSMutableArray array];
    
    if ([receivedZhuBoMoreList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZhuBoMoreList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZhuBoMoreList addObject:[ZhuBoMoreList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZhuBoMoreList isKindOfClass:[NSDictionary class]]) {
       [parsedZhuBoMoreList addObject:[ZhuBoMoreList modelObjectWithDictionary:(NSDictionary *)receivedZhuBoMoreList]];
    }

    self.list = [NSArray arrayWithArray:parsedZhuBoMoreList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kZhuBoMoreZhuBoMoreModelPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kZhuBoMoreZhuBoMoreModelPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kZhuBoMoreZhuBoMoreModelTotalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kZhuBoMoreZhuBoMoreModelMaxPageId];
    [mutableDict setValue:self.msg forKey:kZhuBoMoreZhuBoMoreModelMsg];
    [mutableDict setValue:[self.relation dictionaryRepresentation] forKey:kZhuBoMoreZhuBoMoreModelRelation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZhuBoMoreZhuBoMoreModelRet];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZhuBoMoreZhuBoMoreModelList];

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

    self.pageSize = [aDecoder decodeDoubleForKey:kZhuBoMoreZhuBoMoreModelPageSize];
    self.pageId = [aDecoder decodeDoubleForKey:kZhuBoMoreZhuBoMoreModelPageId];
    self.totalCount = [aDecoder decodeDoubleForKey:kZhuBoMoreZhuBoMoreModelTotalCount];
    self.maxPageId = [aDecoder decodeDoubleForKey:kZhuBoMoreZhuBoMoreModelMaxPageId];
    self.msg = [aDecoder decodeObjectForKey:kZhuBoMoreZhuBoMoreModelMsg];
    self.relation = [aDecoder decodeObjectForKey:kZhuBoMoreZhuBoMoreModelRelation];
    self.ret = [aDecoder decodeDoubleForKey:kZhuBoMoreZhuBoMoreModelRet];
    self.list = [aDecoder decodeObjectForKey:kZhuBoMoreZhuBoMoreModelList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageSize forKey:kZhuBoMoreZhuBoMoreModelPageSize];
    [aCoder encodeDouble:_pageId forKey:kZhuBoMoreZhuBoMoreModelPageId];
    [aCoder encodeDouble:_totalCount forKey:kZhuBoMoreZhuBoMoreModelTotalCount];
    [aCoder encodeDouble:_maxPageId forKey:kZhuBoMoreZhuBoMoreModelMaxPageId];
    [aCoder encodeObject:_msg forKey:kZhuBoMoreZhuBoMoreModelMsg];
    [aCoder encodeObject:_relation forKey:kZhuBoMoreZhuBoMoreModelRelation];
    [aCoder encodeDouble:_ret forKey:kZhuBoMoreZhuBoMoreModelRet];
    [aCoder encodeObject:_list forKey:kZhuBoMoreZhuBoMoreModelList];
}

- (id)copyWithZone:(NSZone *)zone {
    ZhuBoMoreZhuBoMoreModel *copy = [[ZhuBoMoreZhuBoMoreModel alloc] init];
    
    
    
    if (copy) {

        copy.pageSize = self.pageSize;
        copy.pageId = self.pageId;
        copy.totalCount = self.totalCount;
        copy.maxPageId = self.maxPageId;
        copy.msg = [self.msg copyWithZone:zone];
        copy.relation = [self.relation copyWithZone:zone];
        copy.ret = self.ret;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
