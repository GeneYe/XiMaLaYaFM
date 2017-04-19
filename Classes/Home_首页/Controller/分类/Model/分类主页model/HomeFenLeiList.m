//
//  HomeFenLeiList.m
//
//  Created by   on 16/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeFenLeiList.h"


NSString *const kHomeFenLeiListId = @"id";
NSString *const kHomeFenLeiListOrderNum = @"orderNum";
NSString *const kHomeFenLeiListFilterSupported = @"filterSupported";
NSString *const kHomeFenLeiListIsChecked = @"isChecked";
NSString *const kHomeFenLeiListIsFinished = @"isFinished";
NSString *const kHomeFenLeiListIsPaid = @"isPaid";
NSString *const kHomeFenLeiListContentType = @"contentType";
NSString *const kHomeFenLeiListTitle = @"title";
NSString *const kHomeFenLeiListSelectedSwitch = @"selectedSwitch";
NSString *const kHomeFenLeiListCategoryType = @"categoryType";
NSString *const kHomeFenLeiListCoverPath = @"coverPath";
NSString *const kHomeFenLeiListName = @"name";


@interface HomeFenLeiList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeFenLeiList

@synthesize listIdentifier = _listIdentifier;
@synthesize orderNum = _orderNum;
@synthesize filterSupported = _filterSupported;
@synthesize isChecked = _isChecked;
@synthesize isFinished = _isFinished;
@synthesize isPaid = _isPaid;
@synthesize contentType = _contentType;
@synthesize title = _title;
@synthesize selectedSwitch = _selectedSwitch;
@synthesize categoryType = _categoryType;
@synthesize coverPath = _coverPath;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [[self objectOrNilForKey:kHomeFenLeiListId fromDictionary:dict] doubleValue];
            self.orderNum = [[self objectOrNilForKey:kHomeFenLeiListOrderNum fromDictionary:dict] doubleValue];
            self.filterSupported = [[self objectOrNilForKey:kHomeFenLeiListFilterSupported fromDictionary:dict] boolValue];
            self.isChecked = [[self objectOrNilForKey:kHomeFenLeiListIsChecked fromDictionary:dict] boolValue];
            self.isFinished = [[self objectOrNilForKey:kHomeFenLeiListIsFinished fromDictionary:dict] boolValue];
            self.isPaid = [[self objectOrNilForKey:kHomeFenLeiListIsPaid fromDictionary:dict] boolValue];
            self.contentType = [self objectOrNilForKey:kHomeFenLeiListContentType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHomeFenLeiListTitle fromDictionary:dict];
            self.selectedSwitch = [[self objectOrNilForKey:kHomeFenLeiListSelectedSwitch fromDictionary:dict] boolValue];
            self.categoryType = [[self objectOrNilForKey:kHomeFenLeiListCategoryType fromDictionary:dict] doubleValue];
            self.coverPath = [self objectOrNilForKey:kHomeFenLeiListCoverPath fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHomeFenLeiListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kHomeFenLeiListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderNum] forKey:kHomeFenLeiListOrderNum];
    [mutableDict setValue:[NSNumber numberWithBool:self.filterSupported] forKey:kHomeFenLeiListFilterSupported];
    [mutableDict setValue:[NSNumber numberWithBool:self.isChecked] forKey:kHomeFenLeiListIsChecked];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFinished] forKey:kHomeFenLeiListIsFinished];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kHomeFenLeiListIsPaid];
    [mutableDict setValue:self.contentType forKey:kHomeFenLeiListContentType];
    [mutableDict setValue:self.title forKey:kHomeFenLeiListTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.selectedSwitch] forKey:kHomeFenLeiListSelectedSwitch];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryType] forKey:kHomeFenLeiListCategoryType];
    [mutableDict setValue:self.coverPath forKey:kHomeFenLeiListCoverPath];
    [mutableDict setValue:self.name forKey:kHomeFenLeiListName];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kHomeFenLeiListId];
    self.orderNum = [aDecoder decodeDoubleForKey:kHomeFenLeiListOrderNum];
    self.filterSupported = [aDecoder decodeBoolForKey:kHomeFenLeiListFilterSupported];
    self.isChecked = [aDecoder decodeBoolForKey:kHomeFenLeiListIsChecked];
    self.isFinished = [aDecoder decodeBoolForKey:kHomeFenLeiListIsFinished];
    self.isPaid = [aDecoder decodeBoolForKey:kHomeFenLeiListIsPaid];
    self.contentType = [aDecoder decodeObjectForKey:kHomeFenLeiListContentType];
    self.title = [aDecoder decodeObjectForKey:kHomeFenLeiListTitle];
    self.selectedSwitch = [aDecoder decodeBoolForKey:kHomeFenLeiListSelectedSwitch];
    self.categoryType = [aDecoder decodeDoubleForKey:kHomeFenLeiListCategoryType];
    self.coverPath = [aDecoder decodeObjectForKey:kHomeFenLeiListCoverPath];
    self.name = [aDecoder decodeObjectForKey:kHomeFenLeiListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kHomeFenLeiListId];
    [aCoder encodeDouble:_orderNum forKey:kHomeFenLeiListOrderNum];
    [aCoder encodeBool:_filterSupported forKey:kHomeFenLeiListFilterSupported];
    [aCoder encodeBool:_isChecked forKey:kHomeFenLeiListIsChecked];
    [aCoder encodeBool:_isFinished forKey:kHomeFenLeiListIsFinished];
    [aCoder encodeBool:_isPaid forKey:kHomeFenLeiListIsPaid];
    [aCoder encodeObject:_contentType forKey:kHomeFenLeiListContentType];
    [aCoder encodeObject:_title forKey:kHomeFenLeiListTitle];
    [aCoder encodeBool:_selectedSwitch forKey:kHomeFenLeiListSelectedSwitch];
    [aCoder encodeDouble:_categoryType forKey:kHomeFenLeiListCategoryType];
    [aCoder encodeObject:_coverPath forKey:kHomeFenLeiListCoverPath];
    [aCoder encodeObject:_name forKey:kHomeFenLeiListName];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeFenLeiList *copy = [[HomeFenLeiList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.orderNum = self.orderNum;
        copy.filterSupported = self.filterSupported;
        copy.isChecked = self.isChecked;
        copy.isFinished = self.isFinished;
        copy.isPaid = self.isPaid;
        copy.contentType = [self.contentType copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.selectedSwitch = self.selectedSwitch;
        copy.categoryType = self.categoryType;
        copy.coverPath = [self.coverPath copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
