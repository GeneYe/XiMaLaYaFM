//
//  HomeFenLeiBaseClass.h
//
//  Created by   on 16/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeFenLeiDiscoveryColumns;

@interface HomeFenLeiBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HomeFenLeiDiscoveryColumns *discoveryColumns;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
