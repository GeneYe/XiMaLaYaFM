//
//  FenLeiContentList.m
//
//  Created by   on 16/11/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FenLeiContentList.h"


NSString *const kFenLeiContentListUid = @"uid";
NSString *const kFenLeiContentListPriceTypeEnum = @"priceTypeEnum";
NSString *const kFenLeiContentListTrackTitle = @"trackTitle";
NSString *const kFenLeiContentListHasMore = @"hasMore";
NSString *const kFenLeiContentListId = @"id";
NSString *const kFenLeiContentListCoverMiddle = @"coverMiddle";
NSString *const kFenLeiContentListCoverPathBig = @"coverPathBig";
NSString *const kFenLeiContentListKeywordId = @"keywordId";
NSString *const kFenLeiContentListDisplayPrice = @"displayPrice";
NSString *const kFenLeiContentListCategoryId = @"categoryId";
NSString *const kFenLeiContentListReleasedAt = @"releasedAt";
NSString *const kFenLeiContentListPlaysCounts = @"playsCounts";
NSString *const kFenLeiContentListSubtitle = @"subtitle";
NSString *const kFenLeiContentListShortTitle = @"shortTitle";
NSString *const kFenLeiContentListIsShare = @"isShare";
NSString *const kFenLeiContentListNickname = @"nickname";
NSString *const kFenLeiContentListIsExternalUrl = @"is_External_url";
NSString *const kFenLeiContentListUrl = @"url";
NSString *const kFenLeiContentListRealCategoryId = @"realCategoryId";
NSString *const kFenLeiContentListScore = @"score";
NSString *const kFenLeiContentListType = @"type";
NSString *const kFenLeiContentListContentType = @"contentType";
NSString *const kFenLeiContentListDisplayDiscountedPrice = @"displayDiscountedPrice";
NSString *const kFenLeiContentListIntro = @"intro";
NSString *const kFenLeiContentListCoverLarge = @"coverLarge";
NSString *const kFenLeiContentListList = @"list";
NSString *const kFenLeiContentListIsFinished = @"isFinished";
NSString *const kFenLeiContentListTrackId = @"trackId";
NSString *const kFenLeiContentListProvider = @"provider";
NSString *const kFenLeiContentListSpecialId = @"specialId";
NSString *const kFenLeiContentListDiscountedPrice = @"discountedPrice";
NSString *const kFenLeiContentListSerialState = @"serialState";
NSString *const kFenLeiContentListIsPaid = @"isPaid";
NSString *const kFenLeiContentListPrice = @"price";
NSString *const kFenLeiContentListIsHot = @"isHot";
NSString *const kFenLeiContentListTagName = @"tagName";
NSString *const kFenLeiContentListTags = @"tags";
NSString *const kFenLeiContentListPriceTypeId = @"priceTypeId";
NSString *const kFenLeiContentListFootnote = @"footnote";
NSString *const kFenLeiContentListCommentsCount = @"commentsCount";
NSString *const kFenLeiContentListKeywordType = @"keywordType";
NSString *const kFenLeiContentListAlbumId = @"albumId";
NSString *const kFenLeiContentListTracks = @"tracks";
NSString *const kFenLeiContentListModuleType = @"moduleType";
NSString *const kFenLeiContentListCoverPathSmall = @"coverPathSmall";
NSString *const kFenLeiContentListPic = @"pic";
NSString *const kFenLeiContentListLongTitle = @"longTitle";
NSString *const kFenLeiContentListCalcDimension = @"calcDimension";
NSString *const kFenLeiContentListTitle = @"title";
NSString *const kFenLeiContentListAlbumCoverUrl290 = @"albumCoverUrl290";
NSString *const kFenLeiContentListKeywordName = @"keywordName";
NSString *const kFenLeiContentListCoverSmall = @"coverSmall";


@interface FenLeiContentList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FenLeiContentList

@synthesize uid = _uid;
@synthesize priceTypeEnum = _priceTypeEnum;
@synthesize trackTitle = _trackTitle;
@synthesize hasMore = _hasMore;
@synthesize listIdentifier = _listIdentifier;
@synthesize coverMiddle = _coverMiddle;
@synthesize coverPathBig = _coverPathBig;
@synthesize keywordId = _keywordId;
@synthesize displayPrice = _displayPrice;
@synthesize categoryId = _categoryId;
@synthesize releasedAt = _releasedAt;
@synthesize playsCounts = _playsCounts;
@synthesize subtitle = _subtitle;
@synthesize shortTitle = _shortTitle;
@synthesize isShare = _isShare;
@synthesize nickname = _nickname;
@synthesize isExternalUrl = _isExternalUrl;
@synthesize url = _url;
@synthesize realCategoryId = _realCategoryId;
@synthesize score = _score;
@synthesize type = _type;
@synthesize contentType = _contentType;
@synthesize displayDiscountedPrice = _displayDiscountedPrice;
@synthesize intro = _intro;
@synthesize coverLarge = _coverLarge;
@synthesize list = _list;
@synthesize isFinished = _isFinished;
@synthesize trackId = _trackId;
@synthesize provider = _provider;
@synthesize specialId = _specialId;
@synthesize discountedPrice = _discountedPrice;
@synthesize serialState = _serialState;
@synthesize isPaid = _isPaid;
@synthesize price = _price;
@synthesize isHot = _isHot;
@synthesize tagName = _tagName;
@synthesize tags = _tags;
@synthesize priceTypeId = _priceTypeId;
@synthesize footnote = _footnote;
@synthesize commentsCount = _commentsCount;
@synthesize keywordType = _keywordType;
@synthesize albumId = _albumId;
@synthesize tracks = _tracks;
@synthesize moduleType = _moduleType;
@synthesize coverPathSmall = _coverPathSmall;
@synthesize pic = _pic;
@synthesize longTitle = _longTitle;
@synthesize calcDimension = _calcDimension;
@synthesize title = _title;
@synthesize albumCoverUrl290 = _albumCoverUrl290;
@synthesize keywordName = _keywordName;
@synthesize coverSmall = _coverSmall;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.uid = [[self objectOrNilForKey:kFenLeiContentListUid fromDictionary:dict] doubleValue];
            self.priceTypeEnum = [[self objectOrNilForKey:kFenLeiContentListPriceTypeEnum fromDictionary:dict] doubleValue];
            self.trackTitle = [self objectOrNilForKey:kFenLeiContentListTrackTitle fromDictionary:dict];
            self.hasMore = [[self objectOrNilForKey:kFenLeiContentListHasMore fromDictionary:dict] boolValue];
            self.listIdentifier = [[self objectOrNilForKey:kFenLeiContentListId fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kFenLeiContentListCoverMiddle fromDictionary:dict];
            self.coverPathBig = [self objectOrNilForKey:kFenLeiContentListCoverPathBig fromDictionary:dict];
            self.keywordId = [[self objectOrNilForKey:kFenLeiContentListKeywordId fromDictionary:dict] doubleValue];
            self.displayPrice = [self objectOrNilForKey:kFenLeiContentListDisplayPrice fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kFenLeiContentListCategoryId fromDictionary:dict] doubleValue];
            self.releasedAt = [[self objectOrNilForKey:kFenLeiContentListReleasedAt fromDictionary:dict] doubleValue];
            self.playsCounts = [[self objectOrNilForKey:kFenLeiContentListPlaysCounts fromDictionary:dict] doubleValue];
            self.subtitle = [self objectOrNilForKey:kFenLeiContentListSubtitle fromDictionary:dict];
            self.shortTitle = [self objectOrNilForKey:kFenLeiContentListShortTitle fromDictionary:dict];
            self.isShare = [[self objectOrNilForKey:kFenLeiContentListIsShare fromDictionary:dict] boolValue];
            self.nickname = [self objectOrNilForKey:kFenLeiContentListNickname fromDictionary:dict];
            self.isExternalUrl = [[self objectOrNilForKey:kFenLeiContentListIsExternalUrl fromDictionary:dict] boolValue];
            self.url = [self objectOrNilForKey:kFenLeiContentListUrl fromDictionary:dict];
            self.realCategoryId = [[self objectOrNilForKey:kFenLeiContentListRealCategoryId fromDictionary:dict] doubleValue];
            self.score = [[self objectOrNilForKey:kFenLeiContentListScore fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kFenLeiContentListType fromDictionary:dict] doubleValue];
            self.contentType = [self objectOrNilForKey:kFenLeiContentListContentType fromDictionary:dict];
            self.displayDiscountedPrice = [self objectOrNilForKey:kFenLeiContentListDisplayDiscountedPrice fromDictionary:dict];
            self.intro = [self objectOrNilForKey:kFenLeiContentListIntro fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kFenLeiContentListCoverLarge fromDictionary:dict];
            self.list = [self objectOrNilForKey:kFenLeiContentListList fromDictionary:dict];
            self.isFinished = [[self objectOrNilForKey:kFenLeiContentListIsFinished fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kFenLeiContentListTrackId fromDictionary:dict] doubleValue];
            self.provider = [self objectOrNilForKey:kFenLeiContentListProvider fromDictionary:dict];
            self.specialId = [[self objectOrNilForKey:kFenLeiContentListSpecialId fromDictionary:dict] doubleValue];
            self.discountedPrice = [[self objectOrNilForKey:kFenLeiContentListDiscountedPrice fromDictionary:dict] doubleValue];
            self.serialState = [[self objectOrNilForKey:kFenLeiContentListSerialState fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kFenLeiContentListIsPaid fromDictionary:dict] boolValue];
            self.price = [[self objectOrNilForKey:kFenLeiContentListPrice fromDictionary:dict] doubleValue];
            self.isHot = [[self objectOrNilForKey:kFenLeiContentListIsHot fromDictionary:dict] boolValue];
            self.tagName = [self objectOrNilForKey:kFenLeiContentListTagName fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kFenLeiContentListTags fromDictionary:dict];
            self.priceTypeId = [[self objectOrNilForKey:kFenLeiContentListPriceTypeId fromDictionary:dict] doubleValue];
            self.footnote = [self objectOrNilForKey:kFenLeiContentListFootnote fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kFenLeiContentListCommentsCount fromDictionary:dict] doubleValue];
            self.keywordType = [[self objectOrNilForKey:kFenLeiContentListKeywordType fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kFenLeiContentListAlbumId fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kFenLeiContentListTracks fromDictionary:dict] doubleValue];
            self.moduleType = [[self objectOrNilForKey:kFenLeiContentListModuleType fromDictionary:dict] doubleValue];
            self.coverPathSmall = [self objectOrNilForKey:kFenLeiContentListCoverPathSmall fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kFenLeiContentListPic fromDictionary:dict];
            self.longTitle = [self objectOrNilForKey:kFenLeiContentListLongTitle fromDictionary:dict];
            self.calcDimension = [self objectOrNilForKey:kFenLeiContentListCalcDimension fromDictionary:dict];
            self.title = [self objectOrNilForKey:kFenLeiContentListTitle fromDictionary:dict];
            self.albumCoverUrl290 = [self objectOrNilForKey:kFenLeiContentListAlbumCoverUrl290 fromDictionary:dict];
            self.keywordName = [self objectOrNilForKey:kFenLeiContentListKeywordName fromDictionary:dict];
            self.coverSmall = [self objectOrNilForKey:kFenLeiContentListCoverSmall fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kFenLeiContentListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeEnum] forKey:kFenLeiContentListPriceTypeEnum];
    [mutableDict setValue:self.trackTitle forKey:kFenLeiContentListTrackTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kFenLeiContentListHasMore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kFenLeiContentListId];
    [mutableDict setValue:self.coverMiddle forKey:kFenLeiContentListCoverMiddle];
    [mutableDict setValue:self.coverPathBig forKey:kFenLeiContentListCoverPathBig];
    [mutableDict setValue:[NSNumber numberWithDouble:self.keywordId] forKey:kFenLeiContentListKeywordId];
    [mutableDict setValue:self.displayPrice forKey:kFenLeiContentListDisplayPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kFenLeiContentListCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.releasedAt] forKey:kFenLeiContentListReleasedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kFenLeiContentListPlaysCounts];
    [mutableDict setValue:self.subtitle forKey:kFenLeiContentListSubtitle];
    [mutableDict setValue:self.shortTitle forKey:kFenLeiContentListShortTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.isShare] forKey:kFenLeiContentListIsShare];
    [mutableDict setValue:self.nickname forKey:kFenLeiContentListNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isExternalUrl] forKey:kFenLeiContentListIsExternalUrl];
    [mutableDict setValue:self.url forKey:kFenLeiContentListUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.realCategoryId] forKey:kFenLeiContentListRealCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kFenLeiContentListScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kFenLeiContentListType];
    [mutableDict setValue:self.contentType forKey:kFenLeiContentListContentType];
    [mutableDict setValue:self.displayDiscountedPrice forKey:kFenLeiContentListDisplayDiscountedPrice];
    [mutableDict setValue:self.intro forKey:kFenLeiContentListIntro];
    [mutableDict setValue:self.coverLarge forKey:kFenLeiContentListCoverLarge];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kFenLeiContentListList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinished] forKey:kFenLeiContentListIsFinished];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kFenLeiContentListTrackId];
    [mutableDict setValue:self.provider forKey:kFenLeiContentListProvider];
    [mutableDict setValue:[NSNumber numberWithDouble:self.specialId] forKey:kFenLeiContentListSpecialId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discountedPrice] forKey:kFenLeiContentListDiscountedPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kFenLeiContentListSerialState];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kFenLeiContentListIsPaid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kFenLeiContentListPrice];
    [mutableDict setValue:[NSNumber numberWithBool:self.isHot] forKey:kFenLeiContentListIsHot];
    [mutableDict setValue:self.tagName forKey:kFenLeiContentListTagName];
    [mutableDict setValue:self.tags forKey:kFenLeiContentListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kFenLeiContentListPriceTypeId];
    [mutableDict setValue:self.footnote forKey:kFenLeiContentListFootnote];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kFenLeiContentListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.keywordType] forKey:kFenLeiContentListKeywordType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kFenLeiContentListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kFenLeiContentListTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.moduleType] forKey:kFenLeiContentListModuleType];
    [mutableDict setValue:self.coverPathSmall forKey:kFenLeiContentListCoverPathSmall];
    [mutableDict setValue:self.pic forKey:kFenLeiContentListPic];
    [mutableDict setValue:self.longTitle forKey:kFenLeiContentListLongTitle];
    [mutableDict setValue:self.calcDimension forKey:kFenLeiContentListCalcDimension];
    [mutableDict setValue:self.title forKey:kFenLeiContentListTitle];
    [mutableDict setValue:self.albumCoverUrl290 forKey:kFenLeiContentListAlbumCoverUrl290];
    [mutableDict setValue:self.keywordName forKey:kFenLeiContentListKeywordName];
    [mutableDict setValue:self.coverSmall forKey:kFenLeiContentListCoverSmall];

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

    self.uid = [aDecoder decodeDoubleForKey:kFenLeiContentListUid];
    self.priceTypeEnum = [aDecoder decodeDoubleForKey:kFenLeiContentListPriceTypeEnum];
    self.trackTitle = [aDecoder decodeObjectForKey:kFenLeiContentListTrackTitle];
    self.hasMore = [aDecoder decodeBoolForKey:kFenLeiContentListHasMore];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kFenLeiContentListId];
    self.coverMiddle = [aDecoder decodeObjectForKey:kFenLeiContentListCoverMiddle];
    self.coverPathBig = [aDecoder decodeObjectForKey:kFenLeiContentListCoverPathBig];
    self.keywordId = [aDecoder decodeDoubleForKey:kFenLeiContentListKeywordId];
    self.displayPrice = [aDecoder decodeObjectForKey:kFenLeiContentListDisplayPrice];
    self.categoryId = [aDecoder decodeDoubleForKey:kFenLeiContentListCategoryId];
    self.releasedAt = [aDecoder decodeDoubleForKey:kFenLeiContentListReleasedAt];
    self.playsCounts = [aDecoder decodeDoubleForKey:kFenLeiContentListPlaysCounts];
    self.subtitle = [aDecoder decodeObjectForKey:kFenLeiContentListSubtitle];
    self.shortTitle = [aDecoder decodeObjectForKey:kFenLeiContentListShortTitle];
    self.isShare = [aDecoder decodeBoolForKey:kFenLeiContentListIsShare];
    self.nickname = [aDecoder decodeObjectForKey:kFenLeiContentListNickname];
    self.isExternalUrl = [aDecoder decodeBoolForKey:kFenLeiContentListIsExternalUrl];
    self.url = [aDecoder decodeObjectForKey:kFenLeiContentListUrl];
    self.realCategoryId = [aDecoder decodeDoubleForKey:kFenLeiContentListRealCategoryId];
    self.score = [aDecoder decodeDoubleForKey:kFenLeiContentListScore];
    self.type = [aDecoder decodeDoubleForKey:kFenLeiContentListType];
    self.contentType = [aDecoder decodeObjectForKey:kFenLeiContentListContentType];
    self.displayDiscountedPrice = [aDecoder decodeObjectForKey:kFenLeiContentListDisplayDiscountedPrice];
    self.intro = [aDecoder decodeObjectForKey:kFenLeiContentListIntro];
    self.coverLarge = [aDecoder decodeObjectForKey:kFenLeiContentListCoverLarge];
    self.list = [aDecoder decodeObjectForKey:kFenLeiContentListList];
    self.isFinished = [aDecoder decodeDoubleForKey:kFenLeiContentListIsFinished];
    self.trackId = [aDecoder decodeDoubleForKey:kFenLeiContentListTrackId];
    self.provider = [aDecoder decodeObjectForKey:kFenLeiContentListProvider];
    self.specialId = [aDecoder decodeDoubleForKey:kFenLeiContentListSpecialId];
    self.discountedPrice = [aDecoder decodeDoubleForKey:kFenLeiContentListDiscountedPrice];
    self.serialState = [aDecoder decodeDoubleForKey:kFenLeiContentListSerialState];
    self.isPaid = [aDecoder decodeBoolForKey:kFenLeiContentListIsPaid];
    self.price = [aDecoder decodeDoubleForKey:kFenLeiContentListPrice];
    self.isHot = [aDecoder decodeBoolForKey:kFenLeiContentListIsHot];
    self.tagName = [aDecoder decodeObjectForKey:kFenLeiContentListTagName];
    self.tags = [aDecoder decodeObjectForKey:kFenLeiContentListTags];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kFenLeiContentListPriceTypeId];
    self.footnote = [aDecoder decodeObjectForKey:kFenLeiContentListFootnote];
    self.commentsCount = [aDecoder decodeDoubleForKey:kFenLeiContentListCommentsCount];
    self.keywordType = [aDecoder decodeDoubleForKey:kFenLeiContentListKeywordType];
    self.albumId = [aDecoder decodeDoubleForKey:kFenLeiContentListAlbumId];
    self.tracks = [aDecoder decodeDoubleForKey:kFenLeiContentListTracks];
    self.moduleType = [aDecoder decodeDoubleForKey:kFenLeiContentListModuleType];
    self.coverPathSmall = [aDecoder decodeObjectForKey:kFenLeiContentListCoverPathSmall];
    self.pic = [aDecoder decodeObjectForKey:kFenLeiContentListPic];
    self.longTitle = [aDecoder decodeObjectForKey:kFenLeiContentListLongTitle];
    self.calcDimension = [aDecoder decodeObjectForKey:kFenLeiContentListCalcDimension];
    self.title = [aDecoder decodeObjectForKey:kFenLeiContentListTitle];
    self.albumCoverUrl290 = [aDecoder decodeObjectForKey:kFenLeiContentListAlbumCoverUrl290];
    self.keywordName = [aDecoder decodeObjectForKey:kFenLeiContentListKeywordName];
    self.coverSmall = [aDecoder decodeObjectForKey:kFenLeiContentListCoverSmall];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kFenLeiContentListUid];
    [aCoder encodeDouble:_priceTypeEnum forKey:kFenLeiContentListPriceTypeEnum];
    [aCoder encodeObject:_trackTitle forKey:kFenLeiContentListTrackTitle];
    [aCoder encodeBool:_hasMore forKey:kFenLeiContentListHasMore];
    [aCoder encodeDouble:_listIdentifier forKey:kFenLeiContentListId];
    [aCoder encodeObject:_coverMiddle forKey:kFenLeiContentListCoverMiddle];
    [aCoder encodeObject:_coverPathBig forKey:kFenLeiContentListCoverPathBig];
    [aCoder encodeDouble:_keywordId forKey:kFenLeiContentListKeywordId];
    [aCoder encodeObject:_displayPrice forKey:kFenLeiContentListDisplayPrice];
    [aCoder encodeDouble:_categoryId forKey:kFenLeiContentListCategoryId];
    [aCoder encodeDouble:_releasedAt forKey:kFenLeiContentListReleasedAt];
    [aCoder encodeDouble:_playsCounts forKey:kFenLeiContentListPlaysCounts];
    [aCoder encodeObject:_subtitle forKey:kFenLeiContentListSubtitle];
    [aCoder encodeObject:_shortTitle forKey:kFenLeiContentListShortTitle];
    [aCoder encodeBool:_isShare forKey:kFenLeiContentListIsShare];
    [aCoder encodeObject:_nickname forKey:kFenLeiContentListNickname];
    [aCoder encodeBool:_isExternalUrl forKey:kFenLeiContentListIsExternalUrl];
    [aCoder encodeObject:_url forKey:kFenLeiContentListUrl];
    [aCoder encodeDouble:_realCategoryId forKey:kFenLeiContentListRealCategoryId];
    [aCoder encodeDouble:_score forKey:kFenLeiContentListScore];
    [aCoder encodeDouble:_type forKey:kFenLeiContentListType];
    [aCoder encodeObject:_contentType forKey:kFenLeiContentListContentType];
    [aCoder encodeObject:_displayDiscountedPrice forKey:kFenLeiContentListDisplayDiscountedPrice];
    [aCoder encodeObject:_intro forKey:kFenLeiContentListIntro];
    [aCoder encodeObject:_coverLarge forKey:kFenLeiContentListCoverLarge];
    [aCoder encodeObject:_list forKey:kFenLeiContentListList];
    [aCoder encodeDouble:_isFinished forKey:kFenLeiContentListIsFinished];
    [aCoder encodeDouble:_trackId forKey:kFenLeiContentListTrackId];
    [aCoder encodeObject:_provider forKey:kFenLeiContentListProvider];
    [aCoder encodeDouble:_specialId forKey:kFenLeiContentListSpecialId];
    [aCoder encodeDouble:_discountedPrice forKey:kFenLeiContentListDiscountedPrice];
    [aCoder encodeDouble:_serialState forKey:kFenLeiContentListSerialState];
    [aCoder encodeBool:_isPaid forKey:kFenLeiContentListIsPaid];
    [aCoder encodeDouble:_price forKey:kFenLeiContentListPrice];
    [aCoder encodeBool:_isHot forKey:kFenLeiContentListIsHot];
    [aCoder encodeObject:_tagName forKey:kFenLeiContentListTagName];
    [aCoder encodeObject:_tags forKey:kFenLeiContentListTags];
    [aCoder encodeDouble:_priceTypeId forKey:kFenLeiContentListPriceTypeId];
    [aCoder encodeObject:_footnote forKey:kFenLeiContentListFootnote];
    [aCoder encodeDouble:_commentsCount forKey:kFenLeiContentListCommentsCount];
    [aCoder encodeDouble:_keywordType forKey:kFenLeiContentListKeywordType];
    [aCoder encodeDouble:_albumId forKey:kFenLeiContentListAlbumId];
    [aCoder encodeDouble:_tracks forKey:kFenLeiContentListTracks];
    [aCoder encodeDouble:_moduleType forKey:kFenLeiContentListModuleType];
    [aCoder encodeObject:_coverPathSmall forKey:kFenLeiContentListCoverPathSmall];
    [aCoder encodeObject:_pic forKey:kFenLeiContentListPic];
    [aCoder encodeObject:_longTitle forKey:kFenLeiContentListLongTitle];
    [aCoder encodeObject:_calcDimension forKey:kFenLeiContentListCalcDimension];
    [aCoder encodeObject:_title forKey:kFenLeiContentListTitle];
    [aCoder encodeObject:_albumCoverUrl290 forKey:kFenLeiContentListAlbumCoverUrl290];
    [aCoder encodeObject:_keywordName forKey:kFenLeiContentListKeywordName];
    [aCoder encodeObject:_coverSmall forKey:kFenLeiContentListCoverSmall];
}

- (id)copyWithZone:(NSZone *)zone {
    FenLeiContentList *copy = [[FenLeiContentList alloc] init];
    
    
    
    if (copy) {

        copy.uid = self.uid;
        copy.priceTypeEnum = self.priceTypeEnum;
        copy.trackTitle = [self.trackTitle copyWithZone:zone];
        copy.hasMore = self.hasMore;
        copy.listIdentifier = self.listIdentifier;
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.coverPathBig = [self.coverPathBig copyWithZone:zone];
        copy.keywordId = self.keywordId;
        copy.displayPrice = [self.displayPrice copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.releasedAt = self.releasedAt;
        copy.playsCounts = self.playsCounts;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.isShare = self.isShare;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isExternalUrl = self.isExternalUrl;
        copy.url = [self.url copyWithZone:zone];
        copy.realCategoryId = self.realCategoryId;
        copy.score = self.score;
        copy.type = self.type;
        copy.contentType = [self.contentType copyWithZone:zone];
        copy.displayDiscountedPrice = [self.displayDiscountedPrice copyWithZone:zone];
        copy.intro = [self.intro copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.isFinished = self.isFinished;
        copy.trackId = self.trackId;
        copy.provider = [self.provider copyWithZone:zone];
        copy.specialId = self.specialId;
        copy.discountedPrice = self.discountedPrice;
        copy.serialState = self.serialState;
        copy.isPaid = self.isPaid;
        copy.price = self.price;
        copy.isHot = self.isHot;
        copy.tagName = [self.tagName copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.priceTypeId = self.priceTypeId;
        copy.footnote = [self.footnote copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.keywordType = self.keywordType;
        copy.albumId = self.albumId;
        copy.tracks = self.tracks;
        copy.moduleType = self.moduleType;
        copy.coverPathSmall = [self.coverPathSmall copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.longTitle = [self.longTitle copyWithZone:zone];
        copy.calcDimension = [self.calcDimension copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.albumCoverUrl290 = [self.albumCoverUrl290 copyWithZone:zone];
        copy.keywordName = [self.keywordName copyWithZone:zone];
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
    }
    
    return copy;
}


@end
