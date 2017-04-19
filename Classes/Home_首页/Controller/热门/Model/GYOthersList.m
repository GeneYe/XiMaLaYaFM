//
//  GYOthersList.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYOthersList.h"
#import "GYOthersList.h"
#import "GYOthersProperties.h"


NSString *const kGYOthersListCoverSmall = @"coverSmall";
NSString *const kGYOthersListUid = @"uid";
NSString *const kGYOthersListCategoryType = @"categoryType";
NSString *const kGYOthersListHasMore = @"hasMore";
NSString *const kGYOthersListTrackTitle = @"trackTitle";
NSString *const kGYOthersListId = @"id";
NSString *const kGYOthersListCoverMiddle = @"coverMiddle";
NSString *const kGYOthersListCategoryId = @"categoryId";
NSString *const kGYOthersListPriceTypeEnum = @"priceTypeEnum";
NSString *const kGYOthersListDisplayPrice = @"displayPrice";
NSString *const kGYOthersListPlaysCounts = @"playsCounts";
NSString *const kGYOthersListSubtitle = @"subtitle";
NSString *const kGYOthersListUrl = @"url";
NSString *const kGYOthersListNickname = @"nickname";
NSString *const kGYOthersListScore = @"score";
NSString *const kGYOthersListIsExternalUrl = @"isExternalUrl";
NSString *const kGYOthersListContentType = @"contentType";
NSString *const kGYOthersListIntro = @"intro";
NSString *const kGYOthersListCoverLarge = @"coverLarge";
NSString *const kGYOthersListIsFinished = @"isFinished";
NSString *const kGYOthersListList = @"list";
NSString *const kGYOthersListTrackId = @"trackId";
NSString *const kGYOthersListDisplayDiscountedPrice = @"displayDiscountedPrice";
NSString *const kGYOthersListFilterSupported = @"filterSupported";
NSString *const kGYOthersListProvider = @"provider";
NSString *const kGYOthersListCount = @"count";
NSString *const kGYOthersListSerialState = @"serialState";
NSString *const kGYOthersListIsPaid = @"isPaid";
NSString *const kGYOthersListPrice = @"price";
NSString *const kGYOthersListSharePic = @"sharePic";
NSString *const kGYOthersListDiscountedPrice = @"discountedPrice";
NSString *const kGYOthersListProperties = @"properties";
NSString *const kGYOthersListTags = @"tags";
NSString *const kGYOthersListPriceTypeId = @"priceTypeId";
NSString *const kGYOthersListCommentsCount = @"commentsCount";
NSString *const kGYOthersListAlbumId = @"albumId";
NSString *const kGYOthersListTracks = @"tracks";
NSString *const kGYOthersListCoverPath = @"coverPath";
NSString *const kGYOthersListTitle = @"title";
NSString *const kGYOthersListAlbumCoverUrl290 = @"albumCoverUrl290";
NSString *const kGYOthersListEnableShare = @"enableShare";


@interface GYOthersList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYOthersList

@synthesize coverSmall = _coverSmall;
@synthesize uid = _uid;
@synthesize categoryType = _categoryType;
@synthesize hasMore = _hasMore;
@synthesize trackTitle = _trackTitle;
@synthesize listIdentifier = _listIdentifier;
@synthesize coverMiddle = _coverMiddle;
@synthesize categoryId = _categoryId;
@synthesize priceTypeEnum = _priceTypeEnum;
@synthesize displayPrice = _displayPrice;
@synthesize playsCounts = _playsCounts;
@synthesize subtitle = _subtitle;
@synthesize url = _url;
@synthesize nickname = _nickname;
@synthesize score = _score;
@synthesize isExternalUrl = _isExternalUrl;
@synthesize contentType = _contentType;
@synthesize intro = _intro;
@synthesize coverLarge = _coverLarge;
@synthesize isFinished = _isFinished;
@synthesize list = _list;
@synthesize trackId = _trackId;
@synthesize displayDiscountedPrice = _displayDiscountedPrice;
@synthesize filterSupported = _filterSupported;
@synthesize provider = _provider;
@synthesize count = _count;
@synthesize serialState = _serialState;
@synthesize isPaid = _isPaid;
@synthesize price = _price;
@synthesize sharePic = _sharePic;
@synthesize discountedPrice = _discountedPrice;
@synthesize properties = _properties;
@synthesize tags = _tags;
@synthesize priceTypeId = _priceTypeId;
@synthesize commentsCount = _commentsCount;
@synthesize albumId = _albumId;
@synthesize tracks = _tracks;
@synthesize coverPath = _coverPath;
@synthesize title = _title;
@synthesize albumCoverUrl290 = _albumCoverUrl290;
@synthesize enableShare = _enableShare;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.coverSmall = [self objectOrNilForKey:kGYOthersListCoverSmall fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kGYOthersListUid fromDictionary:dict] doubleValue];
            self.categoryType = [[self objectOrNilForKey:kGYOthersListCategoryType fromDictionary:dict] doubleValue];
            self.hasMore = [[self objectOrNilForKey:kGYOthersListHasMore fromDictionary:dict] boolValue];
            self.trackTitle = [self objectOrNilForKey:kGYOthersListTrackTitle fromDictionary:dict];
            self.listIdentifier = [[self objectOrNilForKey:kGYOthersListId fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kGYOthersListCoverMiddle fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kGYOthersListCategoryId fromDictionary:dict] doubleValue];
            self.priceTypeEnum = [[self objectOrNilForKey:kGYOthersListPriceTypeEnum fromDictionary:dict] doubleValue];
            self.displayPrice = [self objectOrNilForKey:kGYOthersListDisplayPrice fromDictionary:dict];
            self.playsCounts = [[self objectOrNilForKey:kGYOthersListPlaysCounts fromDictionary:dict] doubleValue];
            self.subtitle = [self objectOrNilForKey:kGYOthersListSubtitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kGYOthersListUrl fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kGYOthersListNickname fromDictionary:dict];
            self.score = [[self objectOrNilForKey:kGYOthersListScore fromDictionary:dict] doubleValue];
            self.isExternalUrl = [[self objectOrNilForKey:kGYOthersListIsExternalUrl fromDictionary:dict] boolValue];
            self.contentType = [self objectOrNilForKey:kGYOthersListContentType fromDictionary:dict];
            self.intro = [self objectOrNilForKey:kGYOthersListIntro fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kGYOthersListCoverLarge fromDictionary:dict];
            self.isFinished = [[self objectOrNilForKey:kGYOthersListIsFinished fromDictionary:dict] boolValue];
    NSObject *receivedGYOthersList = [dict objectForKey:kGYOthersListList];
    NSMutableArray *parsedGYOthersList = [NSMutableArray array];
    
    if ([receivedGYOthersList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGYOthersList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGYOthersList addObject:[GYOthersList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGYOthersList isKindOfClass:[NSDictionary class]]) {
       [parsedGYOthersList addObject:[GYOthersList modelObjectWithDictionary:(NSDictionary *)receivedGYOthersList]];
    }

    self.list = [NSArray arrayWithArray:parsedGYOthersList];
            self.trackId = [[self objectOrNilForKey:kGYOthersListTrackId fromDictionary:dict] doubleValue];
            self.displayDiscountedPrice = [self objectOrNilForKey:kGYOthersListDisplayDiscountedPrice fromDictionary:dict];
            self.filterSupported = [[self objectOrNilForKey:kGYOthersListFilterSupported fromDictionary:dict] boolValue];
            self.provider = [self objectOrNilForKey:kGYOthersListProvider fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kGYOthersListCount fromDictionary:dict] doubleValue];
            self.serialState = [[self objectOrNilForKey:kGYOthersListSerialState fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kGYOthersListIsPaid fromDictionary:dict] boolValue];
            self.price = [[self objectOrNilForKey:kGYOthersListPrice fromDictionary:dict] doubleValue];
            self.sharePic = [self objectOrNilForKey:kGYOthersListSharePic fromDictionary:dict];
            self.discountedPrice = [[self objectOrNilForKey:kGYOthersListDiscountedPrice fromDictionary:dict] doubleValue];
            self.properties = [GYOthersProperties modelObjectWithDictionary:[dict objectForKey:kGYOthersListProperties]];
            self.tags = [self objectOrNilForKey:kGYOthersListTags fromDictionary:dict];
            self.priceTypeId = [[self objectOrNilForKey:kGYOthersListPriceTypeId fromDictionary:dict] doubleValue];
            self.commentsCount = [[self objectOrNilForKey:kGYOthersListCommentsCount fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kGYOthersListAlbumId fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kGYOthersListTracks fromDictionary:dict] doubleValue];
            self.coverPath = [self objectOrNilForKey:kGYOthersListCoverPath fromDictionary:dict];
            self.title = [self objectOrNilForKey:kGYOthersListTitle fromDictionary:dict];
            self.albumCoverUrl290 = [self objectOrNilForKey:kGYOthersListAlbumCoverUrl290 fromDictionary:dict];
            self.enableShare = [[self objectOrNilForKey:kGYOthersListEnableShare fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverSmall forKey:kGYOthersListCoverSmall];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kGYOthersListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryType] forKey:kGYOthersListCategoryType];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kGYOthersListHasMore];
    [mutableDict setValue:self.trackTitle forKey:kGYOthersListTrackTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kGYOthersListId];
    [mutableDict setValue:self.coverMiddle forKey:kGYOthersListCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kGYOthersListCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeEnum] forKey:kGYOthersListPriceTypeEnum];
    [mutableDict setValue:self.displayPrice forKey:kGYOthersListDisplayPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kGYOthersListPlaysCounts];
    [mutableDict setValue:self.subtitle forKey:kGYOthersListSubtitle];
    [mutableDict setValue:self.url forKey:kGYOthersListUrl];
    [mutableDict setValue:self.nickname forKey:kGYOthersListNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kGYOthersListScore];
    [mutableDict setValue:[NSNumber numberWithBool:self.isExternalUrl] forKey:kGYOthersListIsExternalUrl];
    [mutableDict setValue:self.contentType forKey:kGYOthersListContentType];
    [mutableDict setValue:self.intro forKey:kGYOthersListIntro];
    [mutableDict setValue:self.coverLarge forKey:kGYOthersListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFinished] forKey:kGYOthersListIsFinished];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.list) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGYOthersListList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kGYOthersListTrackId];
    [mutableDict setValue:self.displayDiscountedPrice forKey:kGYOthersListDisplayDiscountedPrice];
    [mutableDict setValue:[NSNumber numberWithBool:self.filterSupported] forKey:kGYOthersListFilterSupported];
    [mutableDict setValue:self.provider forKey:kGYOthersListProvider];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kGYOthersListCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kGYOthersListSerialState];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kGYOthersListIsPaid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kGYOthersListPrice];
    [mutableDict setValue:self.sharePic forKey:kGYOthersListSharePic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discountedPrice] forKey:kGYOthersListDiscountedPrice];
    [mutableDict setValue:[self.properties dictionaryRepresentation] forKey:kGYOthersListProperties];
    [mutableDict setValue:self.tags forKey:kGYOthersListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kGYOthersListPriceTypeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kGYOthersListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kGYOthersListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kGYOthersListTracks];
    [mutableDict setValue:self.coverPath forKey:kGYOthersListCoverPath];
    [mutableDict setValue:self.title forKey:kGYOthersListTitle];
    [mutableDict setValue:self.albumCoverUrl290 forKey:kGYOthersListAlbumCoverUrl290];
    [mutableDict setValue:[NSNumber numberWithBool:self.enableShare] forKey:kGYOthersListEnableShare];

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

    self.coverSmall = [aDecoder decodeObjectForKey:kGYOthersListCoverSmall];
    self.uid = [aDecoder decodeDoubleForKey:kGYOthersListUid];
    self.categoryType = [aDecoder decodeDoubleForKey:kGYOthersListCategoryType];
    self.hasMore = [aDecoder decodeBoolForKey:kGYOthersListHasMore];
    self.trackTitle = [aDecoder decodeObjectForKey:kGYOthersListTrackTitle];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kGYOthersListId];
    self.coverMiddle = [aDecoder decodeObjectForKey:kGYOthersListCoverMiddle];
    self.categoryId = [aDecoder decodeDoubleForKey:kGYOthersListCategoryId];
    self.priceTypeEnum = [aDecoder decodeDoubleForKey:kGYOthersListPriceTypeEnum];
    self.displayPrice = [aDecoder decodeObjectForKey:kGYOthersListDisplayPrice];
    self.playsCounts = [aDecoder decodeDoubleForKey:kGYOthersListPlaysCounts];
    self.subtitle = [aDecoder decodeObjectForKey:kGYOthersListSubtitle];
    self.url = [aDecoder decodeObjectForKey:kGYOthersListUrl];
    self.nickname = [aDecoder decodeObjectForKey:kGYOthersListNickname];
    self.score = [aDecoder decodeDoubleForKey:kGYOthersListScore];
    self.isExternalUrl = [aDecoder decodeBoolForKey:kGYOthersListIsExternalUrl];
    self.contentType = [aDecoder decodeObjectForKey:kGYOthersListContentType];
    self.intro = [aDecoder decodeObjectForKey:kGYOthersListIntro];
    self.coverLarge = [aDecoder decodeObjectForKey:kGYOthersListCoverLarge];
    self.isFinished = [aDecoder decodeBoolForKey:kGYOthersListIsFinished];
    self.list = [aDecoder decodeObjectForKey:kGYOthersListList];
    self.trackId = [aDecoder decodeDoubleForKey:kGYOthersListTrackId];
    self.displayDiscountedPrice = [aDecoder decodeObjectForKey:kGYOthersListDisplayDiscountedPrice];
    self.filterSupported = [aDecoder decodeBoolForKey:kGYOthersListFilterSupported];
    self.provider = [aDecoder decodeObjectForKey:kGYOthersListProvider];
    self.count = [aDecoder decodeDoubleForKey:kGYOthersListCount];
    self.serialState = [aDecoder decodeDoubleForKey:kGYOthersListSerialState];
    self.isPaid = [aDecoder decodeBoolForKey:kGYOthersListIsPaid];
    self.price = [aDecoder decodeDoubleForKey:kGYOthersListPrice];
    self.sharePic = [aDecoder decodeObjectForKey:kGYOthersListSharePic];
    self.discountedPrice = [aDecoder decodeDoubleForKey:kGYOthersListDiscountedPrice];
    self.properties = [aDecoder decodeObjectForKey:kGYOthersListProperties];
    self.tags = [aDecoder decodeObjectForKey:kGYOthersListTags];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kGYOthersListPriceTypeId];
    self.commentsCount = [aDecoder decodeDoubleForKey:kGYOthersListCommentsCount];
    self.albumId = [aDecoder decodeDoubleForKey:kGYOthersListAlbumId];
    self.tracks = [aDecoder decodeDoubleForKey:kGYOthersListTracks];
    self.coverPath = [aDecoder decodeObjectForKey:kGYOthersListCoverPath];
    self.title = [aDecoder decodeObjectForKey:kGYOthersListTitle];
    self.albumCoverUrl290 = [aDecoder decodeObjectForKey:kGYOthersListAlbumCoverUrl290];
    self.enableShare = [aDecoder decodeBoolForKey:kGYOthersListEnableShare];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverSmall forKey:kGYOthersListCoverSmall];
    [aCoder encodeDouble:_uid forKey:kGYOthersListUid];
    [aCoder encodeDouble:_categoryType forKey:kGYOthersListCategoryType];
    [aCoder encodeBool:_hasMore forKey:kGYOthersListHasMore];
    [aCoder encodeObject:_trackTitle forKey:kGYOthersListTrackTitle];
    [aCoder encodeDouble:_listIdentifier forKey:kGYOthersListId];
    [aCoder encodeObject:_coverMiddle forKey:kGYOthersListCoverMiddle];
    [aCoder encodeDouble:_categoryId forKey:kGYOthersListCategoryId];
    [aCoder encodeDouble:_priceTypeEnum forKey:kGYOthersListPriceTypeEnum];
    [aCoder encodeObject:_displayPrice forKey:kGYOthersListDisplayPrice];
    [aCoder encodeDouble:_playsCounts forKey:kGYOthersListPlaysCounts];
    [aCoder encodeObject:_subtitle forKey:kGYOthersListSubtitle];
    [aCoder encodeObject:_url forKey:kGYOthersListUrl];
    [aCoder encodeObject:_nickname forKey:kGYOthersListNickname];
    [aCoder encodeDouble:_score forKey:kGYOthersListScore];
    [aCoder encodeBool:_isExternalUrl forKey:kGYOthersListIsExternalUrl];
    [aCoder encodeObject:_contentType forKey:kGYOthersListContentType];
    [aCoder encodeObject:_intro forKey:kGYOthersListIntro];
    [aCoder encodeObject:_coverLarge forKey:kGYOthersListCoverLarge];
    [aCoder encodeBool:_isFinished forKey:kGYOthersListIsFinished];
    [aCoder encodeObject:_list forKey:kGYOthersListList];
    [aCoder encodeDouble:_trackId forKey:kGYOthersListTrackId];
    [aCoder encodeObject:_displayDiscountedPrice forKey:kGYOthersListDisplayDiscountedPrice];
    [aCoder encodeBool:_filterSupported forKey:kGYOthersListFilterSupported];
    [aCoder encodeObject:_provider forKey:kGYOthersListProvider];
    [aCoder encodeDouble:_count forKey:kGYOthersListCount];
    [aCoder encodeDouble:_serialState forKey:kGYOthersListSerialState];
    [aCoder encodeBool:_isPaid forKey:kGYOthersListIsPaid];
    [aCoder encodeDouble:_price forKey:kGYOthersListPrice];
    [aCoder encodeObject:_sharePic forKey:kGYOthersListSharePic];
    [aCoder encodeDouble:_discountedPrice forKey:kGYOthersListDiscountedPrice];
    [aCoder encodeObject:_properties forKey:kGYOthersListProperties];
    [aCoder encodeObject:_tags forKey:kGYOthersListTags];
    [aCoder encodeDouble:_priceTypeId forKey:kGYOthersListPriceTypeId];
    [aCoder encodeDouble:_commentsCount forKey:kGYOthersListCommentsCount];
    [aCoder encodeDouble:_albumId forKey:kGYOthersListAlbumId];
    [aCoder encodeDouble:_tracks forKey:kGYOthersListTracks];
    [aCoder encodeObject:_coverPath forKey:kGYOthersListCoverPath];
    [aCoder encodeObject:_title forKey:kGYOthersListTitle];
    [aCoder encodeObject:_albumCoverUrl290 forKey:kGYOthersListAlbumCoverUrl290];
    [aCoder encodeBool:_enableShare forKey:kGYOthersListEnableShare];
}

- (id)copyWithZone:(NSZone *)zone {
    GYOthersList *copy = [[GYOthersList alloc] init];
    
    
    
    if (copy) {

        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.uid = self.uid;
        copy.categoryType = self.categoryType;
        copy.hasMore = self.hasMore;
        copy.trackTitle = [self.trackTitle copyWithZone:zone];
        copy.listIdentifier = self.listIdentifier;
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.priceTypeEnum = self.priceTypeEnum;
        copy.displayPrice = [self.displayPrice copyWithZone:zone];
        copy.playsCounts = self.playsCounts;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.score = self.score;
        copy.isExternalUrl = self.isExternalUrl;
        copy.contentType = [self.contentType copyWithZone:zone];
        copy.intro = [self.intro copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.isFinished = self.isFinished;
        copy.list = [self.list copyWithZone:zone];
        copy.trackId = self.trackId;
        copy.displayDiscountedPrice = [self.displayDiscountedPrice copyWithZone:zone];
        copy.filterSupported = self.filterSupported;
        copy.provider = [self.provider copyWithZone:zone];
        copy.count = self.count;
        copy.serialState = self.serialState;
        copy.isPaid = self.isPaid;
        copy.price = self.price;
        copy.sharePic = [self.sharePic copyWithZone:zone];
        copy.discountedPrice = self.discountedPrice;
        copy.properties = [self.properties copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.priceTypeId = self.priceTypeId;
        copy.commentsCount = self.commentsCount;
        copy.albumId = self.albumId;
        copy.tracks = self.tracks;
        copy.coverPath = [self.coverPath copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.albumCoverUrl290 = [self.albumCoverUrl290 copyWithZone:zone];
        copy.enableShare = self.enableShare;
    }
    
    return copy;
}


@end
