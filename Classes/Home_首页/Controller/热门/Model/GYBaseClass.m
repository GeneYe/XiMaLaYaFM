//
//  GYBaseClass.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYBaseClass.h"
#import "GYFocusImages.h"
#import "GYEditorRecommendAlbums.h"
#import "GYSpecialColumn.h"


NSString *const kGYBaseClassRet = @"ret";
NSString *const kGYBaseClassFocusImages = @"focusImages";
NSString *const kGYBaseClassMsg = @"msg";
NSString *const kGYBaseClassEditorRecommendAlbums = @"editorRecommendAlbums";
NSString *const kGYBaseClassSpecialColumn = @"specialColumn";


@interface GYBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYBaseClass

@synthesize ret = _ret;
@synthesize focusImages = _focusImages;
@synthesize msg = _msg;
@synthesize editorRecommendAlbums = _editorRecommendAlbums;
@synthesize specialColumn = _specialColumn;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ret = [[self objectOrNilForKey:kGYBaseClassRet fromDictionary:dict] doubleValue];
            self.focusImages = [GYFocusImages modelObjectWithDictionary:[dict objectForKey:kGYBaseClassFocusImages]];
            self.msg = [self objectOrNilForKey:kGYBaseClassMsg fromDictionary:dict];
            self.editorRecommendAlbums = [GYEditorRecommendAlbums modelObjectWithDictionary:[dict objectForKey:kGYBaseClassEditorRecommendAlbums]];
            self.specialColumn = [GYSpecialColumn modelObjectWithDictionary:[dict objectForKey:kGYBaseClassSpecialColumn]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kGYBaseClassRet];
    [mutableDict setValue:[self.focusImages dictionaryRepresentation] forKey:kGYBaseClassFocusImages];
    [mutableDict setValue:self.msg forKey:kGYBaseClassMsg];
    [mutableDict setValue:[self.editorRecommendAlbums dictionaryRepresentation] forKey:kGYBaseClassEditorRecommendAlbums];
    [mutableDict setValue:[self.specialColumn dictionaryRepresentation] forKey:kGYBaseClassSpecialColumn];

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

    self.ret = [aDecoder decodeDoubleForKey:kGYBaseClassRet];
    self.focusImages = [aDecoder decodeObjectForKey:kGYBaseClassFocusImages];
    self.msg = [aDecoder decodeObjectForKey:kGYBaseClassMsg];
    self.editorRecommendAlbums = [aDecoder decodeObjectForKey:kGYBaseClassEditorRecommendAlbums];
    self.specialColumn = [aDecoder decodeObjectForKey:kGYBaseClassSpecialColumn];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kGYBaseClassRet];
    [aCoder encodeObject:_focusImages forKey:kGYBaseClassFocusImages];
    [aCoder encodeObject:_msg forKey:kGYBaseClassMsg];
    [aCoder encodeObject:_editorRecommendAlbums forKey:kGYBaseClassEditorRecommendAlbums];
    [aCoder encodeObject:_specialColumn forKey:kGYBaseClassSpecialColumn];
}

- (id)copyWithZone:(NSZone *)zone {
    GYBaseClass *copy = [[GYBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.ret = self.ret;
        copy.focusImages = [self.focusImages copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.editorRecommendAlbums = [self.editorRecommendAlbums copyWithZone:zone];
        copy.specialColumn = [self.specialColumn copyWithZone:zone];
    }
    
    return copy;
}


@end
