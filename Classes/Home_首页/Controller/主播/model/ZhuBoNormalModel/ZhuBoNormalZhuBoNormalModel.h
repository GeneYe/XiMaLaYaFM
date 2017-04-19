//
//  ZhuBoNormalZhuBoNormalModel.h
//
//  Created by   on 16/11/24
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZhuBoNormalZhuBoNormalModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double pageId;
@property (nonatomic, assign) double totalCount;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double maxPageId;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
