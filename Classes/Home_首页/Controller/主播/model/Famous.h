//
//  Famous.h
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Famous : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double famousIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double displayStyle;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
