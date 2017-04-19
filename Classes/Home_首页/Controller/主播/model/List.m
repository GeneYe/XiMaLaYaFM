//
//  List.m
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "List.h"


NSString *const kListSmallLogo = @"smallLogo";
NSString *const kListUid = @"uid";
NSString *const kListNickname = @"nickname";
NSString *const kListIsVerified = @"isVerified";
NSString *const kListLargeLogo = @"largeLogo";
NSString *const kListMiddleLogo = @"middleLogo";
NSString *const kListVerifyTitle = @"verifyTitle";
NSString *const kListFollowersCounts = @"followersCounts";
NSString *const kListTracksCounts = @"tracksCounts";
NSString *const kListPersonDescribe = @"personDescribe";


@interface List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation List

@synthesize smallLogo = _smallLogo;
@synthesize uid = _uid;
@synthesize nickname = _nickname;
@synthesize isVerified = _isVerified;
@synthesize largeLogo = _largeLogo;
@synthesize middleLogo = _middleLogo;
@synthesize verifyTitle = _verifyTitle;
@synthesize followersCounts = _followersCounts;
@synthesize tracksCounts = _tracksCounts;
@synthesize personDescribe = _personDescribe;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.smallLogo = [self objectOrNilForKey:kListSmallLogo fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kListUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kListNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kListIsVerified fromDictionary:dict] boolValue];
            self.largeLogo = [self objectOrNilForKey:kListLargeLogo fromDictionary:dict];
            self.middleLogo = [self objectOrNilForKey:kListMiddleLogo fromDictionary:dict];
            self.verifyTitle = [self objectOrNilForKey:kListVerifyTitle fromDictionary:dict];
            self.followersCounts = [[self objectOrNilForKey:kListFollowersCounts fromDictionary:dict] doubleValue];
            self.tracksCounts = [[self objectOrNilForKey:kListTracksCounts fromDictionary:dict] doubleValue];
            self.personDescribe = [self objectOrNilForKey:kListPersonDescribe fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.smallLogo forKey:kListSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kListUid];
    [mutableDict setValue:self.nickname forKey:kListNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kListIsVerified];
    [mutableDict setValue:self.largeLogo forKey:kListLargeLogo];
    [mutableDict setValue:self.middleLogo forKey:kListMiddleLogo];
    [mutableDict setValue:self.verifyTitle forKey:kListVerifyTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCounts] forKey:kListFollowersCounts];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracksCounts] forKey:kListTracksCounts];
    [mutableDict setValue:self.personDescribe forKey:kListPersonDescribe];

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

    self.smallLogo = [aDecoder decodeObjectForKey:kListSmallLogo];
    self.uid = [aDecoder decodeDoubleForKey:kListUid];
    self.nickname = [aDecoder decodeObjectForKey:kListNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kListIsVerified];
    self.largeLogo = [aDecoder decodeObjectForKey:kListLargeLogo];
    self.middleLogo = [aDecoder decodeObjectForKey:kListMiddleLogo];
    self.verifyTitle = [aDecoder decodeObjectForKey:kListVerifyTitle];
    self.followersCounts = [aDecoder decodeDoubleForKey:kListFollowersCounts];
    self.tracksCounts = [aDecoder decodeDoubleForKey:kListTracksCounts];
    self.personDescribe = [aDecoder decodeObjectForKey:kListPersonDescribe];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_smallLogo forKey:kListSmallLogo];
    [aCoder encodeDouble:_uid forKey:kListUid];
    [aCoder encodeObject:_nickname forKey:kListNickname];
    [aCoder encodeBool:_isVerified forKey:kListIsVerified];
    [aCoder encodeObject:_largeLogo forKey:kListLargeLogo];
    [aCoder encodeObject:_middleLogo forKey:kListMiddleLogo];
    [aCoder encodeObject:_verifyTitle forKey:kListVerifyTitle];
    [aCoder encodeDouble:_followersCounts forKey:kListFollowersCounts];
    [aCoder encodeDouble:_tracksCounts forKey:kListTracksCounts];
    [aCoder encodeObject:_personDescribe forKey:kListPersonDescribe];
}

- (id)copyWithZone:(NSZone *)zone {
    List *copy = [[List alloc] init];
    
    
    
    if (copy) {

        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.uid = self.uid;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isVerified = self.isVerified;
        copy.largeLogo = [self.largeLogo copyWithZone:zone];
        copy.middleLogo = [self.middleLogo copyWithZone:zone];
        copy.verifyTitle = [self.verifyTitle copyWithZone:zone];
        copy.followersCounts = self.followersCounts;
        copy.tracksCounts = self.tracksCounts;
        copy.personDescribe = [self.personDescribe copyWithZone:zone];
    }
    
    return copy;
}


@end
