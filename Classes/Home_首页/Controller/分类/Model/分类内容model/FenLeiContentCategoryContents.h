//
//  FenLeiContentCategoryContents.h
//
//  Created by   on 16/11/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FenLeiContentCategoryContents : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
