//
//  Normal.h
//
//  Created by   on 16/11/17
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Normal : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double normalIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
