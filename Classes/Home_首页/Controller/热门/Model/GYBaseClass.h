//
//  GYBaseClass.h
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GYEditorRecommendAlbums, GYFocusImages, GYSpecialColumn;

@interface GYBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GYEditorRecommendAlbums *editorRecommendAlbums;
@property (nonatomic, strong) GYFocusImages *focusImages;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) GYSpecialColumn *specialColumn;
@property (nonatomic, assign) double ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
