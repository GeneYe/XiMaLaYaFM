//
//  ZhuBoNormalList.m
//
//  Created by   on 16/11/24
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZhuBoNormalList.h"


NSString *const kZhuBoNormalListSmallLogo = @"smallLogo";
NSString *const kZhuBoNormalListUid = @"uid";
NSString *const kZhuBoNormalListNickname = @"nickname";
NSString *const kZhuBoNormalListIsVerified = @"isVerified";
NSString *const kZhuBoNormalListLargeLogo = @"largeLogo";
NSString *const kZhuBoNormalListFollowersCounts = @"followersCounts";
NSString *const kZhuBoNormalListMiddleLogo = @"middleLogo";
NSString *const kZhuBoNormalListVerifyTitle = @"verifyTitle";
NSString *const kZhuBoNormalListTracksCounts = @"tracksCounts";
NSString *const kZhuBoNormalListPersonDescribe = @"personDescribe";


@interface ZhuBoNormalList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZhuBoNormalList

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
            self.smallLogo = [self objectOrNilForKey:kZhuBoNormalListSmallLogo fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kZhuBoNormalListUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kZhuBoNormalListNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kZhuBoNormalListIsVerified fromDictionary:dict] boolValue];
            self.largeLogo = [self objectOrNilForKey:kZhuBoNormalListLargeLogo fromDictionary:dict];
            self.followersCounts = [[self objectOrNilForKey:kZhuBoNormalListFollowersCounts fromDictionary:dict] doubleValue];
            self.middleLogo = [self objectOrNilForKey:kZhuBoNormalListMiddleLogo fromDictionary:dict];
            self.verifyTitle = [self objectOrNilForKey:kZhuBoNormalListVerifyTitle fromDictionary:dict];
            self.tracksCounts = [[self objectOrNilForKey:kZhuBoNormalListTracksCounts fromDictionary:dict] doubleValue];
            self.personDescribe = [self objectOrNilForKey:kZhuBoNormalListPersonDescribe fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.smallLogo forKey:kZhuBoNormalListSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZhuBoNormalListUid];
    [mutableDict setValue:self.nickname forKey:kZhuBoNormalListNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kZhuBoNormalListIsVerified];
    [mutableDict setValue:self.largeLogo forKey:kZhuBoNormalListLargeLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCounts] forKey:kZhuBoNormalListFollowersCounts];
    [mutableDict setValue:self.middleLogo forKey:kZhuBoNormalListMiddleLogo];
    [mutableDict setValue:self.verifyTitle forKey:kZhuBoNormalListVerifyTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracksCounts] forKey:kZhuBoNormalListTracksCounts];
    [mutableDict setValue:self.personDescribe forKey:kZhuBoNormalListPersonDescribe];

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

    self.smallLogo = [aDecoder decodeObjectForKey:kZhuBoNormalListSmallLogo];
    self.uid = [aDecoder decodeDoubleForKey:kZhuBoNormalListUid];
    self.nickname = [aDecoder decodeObjectForKey:kZhuBoNormalListNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kZhuBoNormalListIsVerified];
    self.largeLogo = [aDecoder decodeObjectForKey:kZhuBoNormalListLargeLogo];
    self.followersCounts = [aDecoder decodeDoubleForKey:kZhuBoNormalListFollowersCounts];
    self.middleLogo = [aDecoder decodeObjectForKey:kZhuBoNormalListMiddleLogo];
    self.verifyTitle = [aDecoder decodeObjectForKey:kZhuBoNormalListVerifyTitle];
    self.tracksCounts = [aDecoder decodeDoubleForKey:kZhuBoNormalListTracksCounts];
    self.personDescribe = [aDecoder decodeObjectForKey:kZhuBoNormalListPersonDescribe];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_smallLogo forKey:kZhuBoNormalListSmallLogo];
    [aCoder encodeDouble:_uid forKey:kZhuBoNormalListUid];
    [aCoder encodeObject:_nickname forKey:kZhuBoNormalListNickname];
    [aCoder encodeBool:_isVerified forKey:kZhuBoNormalListIsVerified];
    [aCoder encodeObject:_largeLogo forKey:kZhuBoNormalListLargeLogo];
    [aCoder encodeDouble:_followersCounts forKey:kZhuBoNormalListFollowersCounts];
    [aCoder encodeObject:_middleLogo forKey:kZhuBoNormalListMiddleLogo];
    [aCoder encodeObject:_verifyTitle forKey:kZhuBoNormalListVerifyTitle];
    [aCoder encodeDouble:_tracksCounts forKey:kZhuBoNormalListTracksCounts];
    [aCoder encodeObject:_personDescribe forKey:kZhuBoNormalListPersonDescribe];
}

- (id)copyWithZone:(NSZone *)zone {
    ZhuBoNormalList *copy = [[ZhuBoNormalList alloc] init];
    
    
    
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
