//
//  ZhuBoNormalZhuBoNormalModel.m
//
//  Created by   on 16/11/24
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZhuBoNormalZhuBoNormalModel.h"
#import "ZhuBoNormalList.h"


NSString *const kZhuBoNormalZhuBoNormalModelPageSize = @"pageSize";
NSString *const kZhuBoNormalZhuBoNormalModelPageId = @"pageId";
NSString *const kZhuBoNormalZhuBoNormalModelTotalCount = @"totalCount";
NSString *const kZhuBoNormalZhuBoNormalModelCount = @"count";
NSString *const kZhuBoNormalZhuBoNormalModelMsg = @"msg";
NSString *const kZhuBoNormalZhuBoNormalModelMaxPageId = @"maxPageId";
NSString *const kZhuBoNormalZhuBoNormalModelList = @"list";
NSString *const kZhuBoNormalZhuBoNormalModelRet = @"ret";


@interface ZhuBoNormalZhuBoNormalModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZhuBoNormalZhuBoNormalModel

@synthesize pageSize = _pageSize;
@synthesize pageId = _pageId;
@synthesize totalCount = _totalCount;
@synthesize count = _count;
@synthesize msg = _msg;
@synthesize maxPageId = _maxPageId;
@synthesize list = _list;
@synthesize ret = _ret;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pageSize = [[self objectOrNilForKey:kZhuBoNormalZhuBoNormalModelPageSize fromDictionary:dict] doubleValue];
            self.pageId = [[self objectOrNilForKey:kZhuBoNormalZhuBoNormalModelPageId fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kZhuBoNormalZhuBoNormalModelTotalCount fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kZhuBoNormalZhuBoNormalModelCount fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kZhuBoNormalZhuBoNormalModelMsg fromDictionary:dict];
            self.maxPageId = [[self objectOrNilForKey:kZhuBoNormalZhuBoNormalModelMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedZhuBoNormalList = [dict objectForKey:kZhuBoNormalZhuBoNormalModelList];
    NSMutableArray *parsedZhuBoNormalList = [NSMutableArray array];
    
    if ([receivedZhuBoNormalList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZhuBoNormalList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZhuBoNormalList addObject:[ZhuBoNormalList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZhuBoNormalList isKindOfClass:[NSDictionary class]]) {
       [parsedZhuBoNormalList addObject:[ZhuBoNormalList modelObjectWithDictionary:(NSDictionary *)receivedZhuBoNormalList]];
    }

    self.list = [NSArray arrayWithArray:parsedZhuBoNormalList];
            self.ret = [[self objectOrNilForKey:kZhuBoNormalZhuBoNormalModelRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kZhuBoNormalZhuBoNormalModelPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kZhuBoNormalZhuBoNormalModelPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kZhuBoNormalZhuBoNormalModelTotalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kZhuBoNormalZhuBoNormalModelCount];
    [mutableDict setValue:self.msg forKey:kZhuBoNormalZhuBoNormalModelMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kZhuBoNormalZhuBoNormalModelMaxPageId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZhuBoNormalZhuBoNormalModelList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZhuBoNormalZhuBoNormalModelRet];

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

    self.pageSize = [aDecoder decodeDoubleForKey:kZhuBoNormalZhuBoNormalModelPageSize];
    self.pageId = [aDecoder decodeDoubleForKey:kZhuBoNormalZhuBoNormalModelPageId];
    self.totalCount = [aDecoder decodeDoubleForKey:kZhuBoNormalZhuBoNormalModelTotalCount];
    self.count = [aDecoder decodeDoubleForKey:kZhuBoNormalZhuBoNormalModelCount];
    self.msg = [aDecoder decodeObjectForKey:kZhuBoNormalZhuBoNormalModelMsg];
    self.maxPageId = [aDecoder decodeDoubleForKey:kZhuBoNormalZhuBoNormalModelMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kZhuBoNormalZhuBoNormalModelList];
    self.ret = [aDecoder decodeDoubleForKey:kZhuBoNormalZhuBoNormalModelRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageSize forKey:kZhuBoNormalZhuBoNormalModelPageSize];
    [aCoder encodeDouble:_pageId forKey:kZhuBoNormalZhuBoNormalModelPageId];
    [aCoder encodeDouble:_totalCount forKey:kZhuBoNormalZhuBoNormalModelTotalCount];
    [aCoder encodeDouble:_count forKey:kZhuBoNormalZhuBoNormalModelCount];
    [aCoder encodeObject:_msg forKey:kZhuBoNormalZhuBoNormalModelMsg];
    [aCoder encodeDouble:_maxPageId forKey:kZhuBoNormalZhuBoNormalModelMaxPageId];
    [aCoder encodeObject:_list forKey:kZhuBoNormalZhuBoNormalModelList];
    [aCoder encodeDouble:_ret forKey:kZhuBoNormalZhuBoNormalModelRet];
}

- (id)copyWithZone:(NSZone *)zone {
    ZhuBoNormalZhuBoNormalModel *copy = [[ZhuBoNormalZhuBoNormalModel alloc] init];
    
    
    
    if (copy) {

        copy.pageSize = self.pageSize;
        copy.pageId = self.pageId;
        copy.totalCount = self.totalCount;
        copy.count = self.count;
        copy.msg = [self.msg copyWithZone:zone];
        copy.maxPageId = self.maxPageId;
        copy.list = [self.list copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
