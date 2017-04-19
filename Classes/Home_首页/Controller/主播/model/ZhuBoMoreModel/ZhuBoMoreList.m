//
//  ZhuBoMoreList.m
//
//  Created by   on 16/11/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZhuBoMoreList.h"


NSString *const kZhuBoMoreListSmallLogo = @"smallLogo";
NSString *const kZhuBoMoreListUid = @"uid";
NSString *const kZhuBoMoreListNickname = @"nickname";
NSString *const kZhuBoMoreListIsVerified = @"isVerified";
NSString *const kZhuBoMoreListLargeLogo = @"largeLogo";
NSString *const kZhuBoMoreListFollowersCounts = @"followersCounts";
NSString *const kZhuBoMoreListMiddleLogo = @"middleLogo";
NSString *const kZhuBoMoreListVerifyTitle = @"verifyTitle";
NSString *const kZhuBoMoreListTracksCounts = @"tracksCounts";
NSString *const kZhuBoMoreListPersonDescribe = @"personDescribe";


@interface ZhuBoMoreList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZhuBoMoreList

@synthesize smallLogo = _smallLogo;
@synthesize uid = _uid;
@synthesize nickname = _nickname;
@synthesize isVerified = _isVerified;
@synthesize largeLogo = _largeLogo;
@synthesize followersCounts = _followersCounts;
@synthesize middleLogo = _middleLogo;
@synthesize verifyTitle = _verifyTitle;
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
            self.smallLogo = [self objectOrNilForKey:kZhuBoMoreListSmallLogo fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kZhuBoMoreListUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kZhuBoMoreListNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kZhuBoMoreListIsVerified fromDictionary:dict] boolValue];
            self.largeLogo = [self objectOrNilForKey:kZhuBoMoreListLargeLogo fromDictionary:dict];
            self.followersCounts = [[self objectOrNilForKey:kZhuBoMoreListFollowersCounts fromDictionary:dict] doubleValue];
            self.middleLogo = [self objectOrNilForKey:kZhuBoMoreListMiddleLogo fromDictionary:dict];
            self.verifyTitle = [self objectOrNilForKey:kZhuBoMoreListVerifyTitle fromDictionary:dict];
            self.tracksCounts = [[self objectOrNilForKey:kZhuBoMoreListTracksCounts fromDictionary:dict] doubleValue];
            self.personDescribe = [self objectOrNilForKey:kZhuBoMoreListPersonDescribe fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.smallLogo forKey:kZhuBoMoreListSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZhuBoMoreListUid];
    [mutableDict setValue:self.nickname forKey:kZhuBoMoreListNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kZhuBoMoreListIsVerified];
    [mutableDict setValue:self.largeLogo forKey:kZhuBoMoreListLargeLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCounts] forKey:kZhuBoMoreListFollowersCounts];
    [mutableDict setValue:self.middleLogo forKey:kZhuBoMoreListMiddleLogo];
    [mutableDict setValue:self.verifyTitle forKey:kZhuBoMoreListVerifyTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracksCounts] forKey:kZhuBoMoreListTracksCounts];
    [mutableDict setValue:self.personDescribe forKey:kZhuBoMoreListPersonDescribe];

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

    self.smallLogo = [aDecoder decodeObjectForKey:kZhuBoMoreListSmallLogo];
    self.uid = [aDecoder decodeDoubleForKey:kZhuBoMoreListUid];
    self.nickname = [aDecoder decodeObjectForKey:kZhuBoMoreListNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kZhuBoMoreListIsVerified];
    self.largeLogo = [aDecoder decodeObjectForKey:kZhuBoMoreListLargeLogo];
    self.followersCounts = [aDecoder decodeDoubleForKey:kZhuBoMoreListFollowersCounts];
    self.middleLogo = [aDecoder decodeObjectForKey:kZhuBoMoreListMiddleLogo];
    self.verifyTitle = [aDecoder decodeObjectForKey:kZhuBoMoreListVerifyTitle];
    self.tracksCounts = [aDecoder decodeDoubleForKey:kZhuBoMoreListTracksCounts];
    self.personDescribe = [aDecoder decodeObjectForKey:kZhuBoMoreListPersonDescribe];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_smallLogo forKey:kZhuBoMoreListSmallLogo];
    [aCoder encodeDouble:_uid forKey:kZhuBoMoreListUid];
    [aCoder encodeObject:_nickname forKey:kZhuBoMoreListNickname];
    [aCoder encodeBool:_isVerified forKey:kZhuBoMoreListIsVerified];
    [aCoder encodeObject:_largeLogo forKey:kZhuBoMoreListLargeLogo];
    [aCoder encodeDouble:_followersCounts forKey:kZhuBoMoreListFollowersCounts];
    [aCoder encodeObject:_middleLogo forKey:kZhuBoMoreListMiddleLogo];
    [aCoder encodeObject:_verifyTitle forKey:kZhuBoMoreListVerifyTitle];
    [aCoder encodeDouble:_tracksCounts forKey:kZhuBoMoreListTracksCounts];
    [aCoder encodeObject:_personDescribe forKey:kZhuBoMoreListPersonDescribe];
}

- (id)copyWithZone:(NSZone *)zone {
    ZhuBoMoreList *copy = [[ZhuBoMoreList alloc] init];
    
    
    
    if (copy) {

        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.uid = self.uid;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isVerified = self.isVerified;
        copy.largeLogo = [self.largeLogo copyWithZone:zone];
        copy.followersCounts = self.followersCounts;
        copy.middleLogo = [self.middleLogo copyWithZone:zone];
        copy.verifyTitle = [self.verifyTitle copyWithZone:zone];
        copy.tracksCounts = self.tracksCounts;
        copy.personDescribe = [self.personDescribe copyWithZone:zone];
    }
    
    return copy;
}


@end
