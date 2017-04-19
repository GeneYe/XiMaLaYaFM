//
//  ZhuBoMoreMoreBaseClass.m
//
//  Created by   on 16/11/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZhuBoMoreMoreBaseClass.h"
#import "ZhuBoMoreRelation.h"
#import "ZhuBoMoreList.h"


NSString *const kZhuBoMoreMoreBaseClassPageSize = @"pageSize";
NSString *const kZhuBoMoreMoreBaseClassPageId = @"pageId";
NSString *const kZhuBoMoreMoreBaseClassTotalCount = @"totalCount";
NSString *const kZhuBoMoreMoreBaseClassMaxPageId = @"maxPageId";
NSString *const kZhuBoMoreMoreBaseClassMsg = @"msg";
NSString *const kZhuBoMoreMoreBaseClassRelation = @"relation";
NSString *const kZhuBoMoreMoreBaseClassRet = @"ret";
NSString *const kZhuBoMoreMoreBaseClassList = @"list";


@interface ZhuBoMoreMoreBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZhuBoMoreMoreBaseClass

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
            self.pageSize = [[self objectOrNilForKey:kZhuBoMoreMoreBaseClassPageSize fromDictionary:dict] doubleValue];
            self.pageId = [[self objectOrNilForKey:kZhuBoMoreMoreBaseClassPageId fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kZhuBoMoreMoreBaseClassTotalCount fromDictionary:dict] doubleValue];
            self.maxPageId = [[self objectOrNilForKey:kZhuBoMoreMoreBaseClassMaxPageId fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kZhuBoMoreMoreBaseClassMsg fromDictionary:dict];
            self.relation = [ZhuBoMoreRelation modelObjectWithDictionary:[dict objectForKey:kZhuBoMoreMoreBaseClassRelation]];
            self.ret = [[self objectOrNilForKey:kZhuBoMoreMoreBaseClassRet fromDictionary:dict] doubleValue];
    NSObject *receivedZhuBoMoreList = [dict objectForKey:kZhuBoMoreMoreBaseClassList];
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
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kZhuBoMoreMoreBaseClassPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kZhuBoMoreMoreBaseClassPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kZhuBoMoreMoreBaseClassTotalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kZhuBoMoreMoreBaseClassMaxPageId];
    [mutableDict setValue:self.msg forKey:kZhuBoMoreMoreBaseClassMsg];
    [mutableDict setValue:[self.relation dictionaryRepresentation] forKey:kZhuBoMoreMoreBaseClassRelation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZhuBoMoreMoreBaseClassRet];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZhuBoMoreMoreBaseClassList];

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

    self.pageSize = [aDecoder decodeDoubleForKey:kZhuBoMoreMoreBaseClassPageSize];
    self.pageId = [aDecoder decodeDoubleForKey:kZhuBoMoreMoreBaseClassPageId];
    self.totalCount = [aDecoder decodeDoubleForKey:kZhuBoMoreMoreBaseClassTotalCount];
    self.maxPageId = [aDecoder decodeDoubleForKey:kZhuBoMoreMoreBaseClassMaxPageId];
    self.msg = [aDecoder decodeObjectForKey:kZhuBoMoreMoreBaseClassMsg];
    self.relation = [aDecoder decodeObjectForKey:kZhuBoMoreMoreBaseClassRelation];
    self.ret = [aDecoder decodeDoubleForKey:kZhuBoMoreMoreBaseClassRet];
    self.list = [aDecoder decodeObjectForKey:kZhuBoMoreMoreBaseClassList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageSize forKey:kZhuBoMoreMoreBaseClassPageSize];
    [aCoder encodeDouble:_pageId forKey:kZhuBoMoreMoreBaseClassPageId];
    [aCoder encodeDouble:_totalCount forKey:kZhuBoMoreMoreBaseClassTotalCount];
    [aCoder encodeDouble:_maxPageId forKey:kZhuBoMoreMoreBaseClassMaxPageId];
    [aCoder encodeObject:_msg forKey:kZhuBoMoreMoreBaseClassMsg];
    [aCoder encodeObject:_relation forKey:kZhuBoMoreMoreBaseClassRelation];
    [aCoder encodeDouble:_ret forKey:kZhuBoMoreMoreBaseClassRet];
    [aCoder encodeObject:_list forKey:kZhuBoMoreMoreBaseClassList];
}

- (id)copyWithZone:(NSZone *)zone {
    ZhuBoMoreMoreBaseClass *copy = [[ZhuBoMoreMoreBaseClass alloc] init];
    
    
    
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
