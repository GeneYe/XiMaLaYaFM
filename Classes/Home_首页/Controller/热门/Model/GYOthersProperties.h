//
//  GYOthersProperties.h
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GYOthersProperties : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cityCode;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, strong) NSString *cityTitle;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double rankingListId;
@property (nonatomic, strong) NSString *key;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
