//
//  BaseClass.m
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Famous.h"
#import "Relation.h"
#import "Normal.h"


NSString *const kBaseClassFamous = @"famous";
NSString *const kBaseClassRelation = @"relation";
NSString *const kBaseClassNormal = @"normal";
NSString *const kBaseClassMsg = @"msg";
NSString *const kBaseClassRet = @"ret";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize famous = _famous;
@synthesize relation = _relation;
@synthesize normal = _normal;
@synthesize msg = _msg;
@synthesize ret = _ret;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedFamous = [dict objectForKey:kBaseClassFamous];
    NSMutableArray *parsedFamous = [NSMutableArray array];
    
    if ([receivedFamous isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFamous) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFamous addObject:[Famous modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFamous isKindOfClass:[NSDictionary class]]) {
       [parsedFamous addObject:[Famous modelObjectWithDictionary:(NSDictionary *)receivedFamous]];
    }

    self.famous = [NSArray arrayWithArray:parsedFamous];
            self.relation = [Relation modelObjectWithDictionary:[dict objectForKey:kBaseClassRelation]];
    NSObject *receivedNormal = [dict objectForKey:kBaseClassNormal];
    NSMutableArray *parsedNormal = [NSMutableArray array];
    
    if ([receivedNormal isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNormal) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNormal addObject:[Normal modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNormal isKindOfClass:[NSDictionary class]]) {
       [parsedNormal addObject:[Normal modelObjectWithDictionary:(NSDictionary *)receivedNormal]];
    }

    self.normal = [NSArray arrayWithArray:parsedNormal];
            self.msg = [self objectOrNilForKey:kBaseClassMsg fromDictionary:dict];
            self.ret = [[self objectOrNilForKey:kBaseClassRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForFamous = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.famous) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFamous addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFamous addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFamous] forKey:kBaseClassFamous];
    [mutableDict setValue:[self.relation dictionaryRepresentation] forKey:kBaseClassRelation];
    NSMutableArray *tempArrayForNormal = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.normal) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNormal addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNormal addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNormal] forKey:kBaseClassNormal];
    [mutableDict setValue:self.msg forKey:kBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kBaseClassRet];

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

    self.famous = [aDecoder decodeObjectForKey:kBaseClassFamous];
    self.relation = [aDecoder decodeObjectForKey:kBaseClassRelation];
    self.normal = [aDecoder decodeObjectForKey:kBaseClassNormal];
    self.msg = [aDecoder decodeObjectForKey:kBaseClassMsg];
    self.ret = [aDecoder decodeDoubleForKey:kBaseClassRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_famous forKey:kBaseClassFamous];
    [aCoder encodeObject:_relation forKey:kBaseClassRelation];
    [aCoder encodeObject:_normal forKey:kBaseClassNormal];
    [aCoder encodeObject:_msg forKey:kBaseClassMsg];
    [aCoder encodeDouble:_ret forKey:kBaseClassRet];
}

- (id)copyWithZone:(NSZone *)zone {
    BaseClass *copy = [[BaseClass alloc] init];
    
    
    
    if (copy) {

        copy.famous = [self.famous copyWithZone:zone];
        copy.relation = [self.relation copyWithZone:zone];
        copy.normal = [self.normal copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
