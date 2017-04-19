//
//  List.h
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) BOOL isVerified;
@property (nonatomic, strong) NSString *largeLogo;
@property (nonatomic, strong) NSString *middleLogo;
@property (nonatomic, strong) NSString *verifyTitle;
@property (nonatomic, assign) double followersCounts;
@property (nonatomic, assign) double tracksCounts;
@property (nonatomic, strong) NSString *personDescribe;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
