//
//  ZhuBoMoreRelation.m
//
//  Created by   on 16/11/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZhuBoMoreRelation.h"


NSString *const kZhuBoMoreRelationRet = @"ret";
NSString *const kZhuBoMoreRelationMsg = @"msg";


@interface ZhuBoMoreRelation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZhuBoMoreRelation

@synthesize ret = _ret;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ret = [[self objectOrNilForKey:kZhuBoMoreRelationRet fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kZhuBoMoreRelationMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZhuBoMoreRelationRet];
    [mutableDict setValue:self.msg forKey:kZhuBoMoreRelationMsg];

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

    self.ret = [aDecoder decodeDoubleForKey:kZhuBoMoreRelationRet];
    self.msg = [aDecoder decodeObjectForKey:kZhuBoMoreRelationMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kZhuBoMoreRelationRet];
    [aCoder encodeObject:_msg forKey:kZhuBoMoreRelationMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    ZhuBoMoreRelation *copy = [[ZhuBoMoreRelation alloc] init];
    
    
    
    if (copy) {

        copy.ret = self.ret;
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
