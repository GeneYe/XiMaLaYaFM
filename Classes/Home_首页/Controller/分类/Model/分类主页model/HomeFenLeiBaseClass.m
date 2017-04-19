//
//  HomeFenLeiBaseClass.m
//
//  Created by   on 16/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeFenLeiBaseClass.h"
#import "HomeFenLeiDiscoveryColumns.h"
#import "HomeFenLeiList.h"


NSString *const kHomeFenLeiBaseClassDiscoveryColumns = @"discoveryColumns";
NSString *const kHomeFenLeiBaseClassList = @"list";
NSString *const kHomeFenLeiBaseClassMsg = @"msg";
NSString *const kHomeFenLeiBaseClassRet = @"ret";


@interface HomeFenLeiBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeFenLeiBaseClass

@synthesize discoveryColumns = _discoveryColumns;
@synthesize list = _list;
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
            self.discoveryColumns = [HomeFenLeiDiscoveryColumns modelObjectWithDictionary:[dict objectForKey:kHomeFenLeiBaseClassDiscoveryColumns]];
    NSObject *receivedHomeFenLeiList = [dict objectForKey:kHomeFenLeiBaseClassList];
    NSMutableArray *parsedHomeFenLeiList = [NSMutableArray array];
    
    if ([receivedHomeFenLeiList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeFenLeiList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeFenLeiList addObject:[HomeFenLeiList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeFenLeiList isKindOfClass:[NSDictionary class]]) {
       [parsedHomeFenLeiList addObject:[HomeFenLeiList modelObjectWithDictionary:(NSDictionary *)receivedHomeFenLeiList]];
    }

    self.list = [NSArray arrayWithArray:parsedHomeFenLeiList];
            self.msg = [self objectOrNilForKey:kHomeFenLeiBaseClassMsg fromDictionary:dict];
            self.ret = [[self objectOrNilForKey:kHomeFenLeiBaseClassRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.discoveryColumns dictionaryRepresentation] forKey:kHomeFenLeiBaseClassDiscoveryColumns];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kHomeFenLeiBaseClassList];
    [mutableDict setValue:self.msg forKey:kHomeFenLeiBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kHomeFenLeiBaseClassRet];

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

    self.discoveryColumns = [aDecoder decodeObjectForKey:kHomeFenLeiBaseClassDiscoveryColumns];
    self.list = [aDecoder decodeObjectForKey:kHomeFenLeiBaseClassList];
    self.msg = [aDecoder decodeObjectForKey:kHomeFenLeiBaseClassMsg];
    self.ret = [aDecoder decodeDoubleForKey:kHomeFenLeiBaseClassRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_discoveryColumns forKey:kHomeFenLeiBaseClassDiscoveryColumns];
    [aCoder encodeObject:_list forKey:kHomeFenLeiBaseClassList];
    [aCoder encodeObject:_msg forKey:kHomeFenLeiBaseClassMsg];
    [aCoder encodeDouble:_ret forKey:kHomeFenLeiBaseClassRet];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeFenLeiBaseClass *copy = [[HomeFenLeiBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.discoveryColumns = [self.discoveryColumns copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
