//
//  GYList.m
//
//  Created by Gene  on 2016/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GYList.h"


NSString *const kGYListUid = @"uid";
NSString *const kGYListTrackTitle = @"trackTitle";
NSString *const kGYListIsShare = @"isShare";
NSString *const kGYListId = @"id";
NSString *const kGYListCoverMiddle = @"coverMiddle";
NSString *const kGYListShortTitle = @"shortTitle";
NSString *const kGYListPlaysCounts = @"playsCounts";
NSString *const kGYListSubType = @"subType";
NSString *const kGYListIsExternalUrl = @"is_External_url";
NSString *const kGYListSubtitle = @"subtitle";
NSString *const kGYListUrl = @"url";
NSString *const kGYListNickname = @"nickname";
NSString *const kGYListColumnType = @"columnType";
NSString *const kGYListType = @"type";
NSString *const kGYListContentType = @"contentType";
NSString *const kGYListIntro = @"intro";
NSString *const kGYListCoverLarge = @"coverLarge";
NSString *const kGYListIsFinished = @"isFinished";
NSString *const kGYListTrackId = @"trackId";
NSString *const kGYListProvider = @"provider";
NSString *const kGYListSpecialId = @"specialId";
NSString *const kGYListSerialState = @"serialState";
NSString *const kGYListIsPaid = @"isPaid";
NSString *const kGYListFootnote = @"footnote";
NSString *const kGYListTags = @"tags";
NSString *const kGYListPriceTypeId = @"priceTypeId";
NSString *const kGYListCommentsCount = @"commentsCount";
NSString *const kGYListAlbumId = @"albumId";
NSString *const kGYListTracks = @"tracks";
NSString *const kGYListPic = @"pic";
NSString *const kGYListLongTitle = @"longTitle";
NSString *const kGYListCoverPath = @"coverPath";
NSString *const kGYListTitle = @"title";
NSString *const kGYListAlbumCoverUrl290 = @"albumCoverUrl290";
NSString *const kGYListCoverSmall = @"coverSmall";


@interface GYList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GYList

@synthesize uid = _uid;
@synthesize trackTitle = _trackTitle;
@synthesize isShare = _isShare;
@synthesize listIdentifier = _listIdentifier;
@synthesize coverMiddle = _coverMiddle;
@synthesize shortTitle = _shortTitle;
@synthesize playsCounts = _playsCounts;
@synthesize subType = _subType;
@synthesize isExternalUrl = _isExternalUrl;
@synthesize subtitle = _subtitle;
@synthesize url = _url;
@synthesize nickname = _nickname;
@synthesize columnType = _columnType;
@synthesize type = _type;
@synthesize contentType = _contentType;
@synthesize intro = _intro;
@synthesize coverLarge = _coverLarge;
@synthesize isFinished = _isFinished;
@synthesize trackId = _trackId;
@synthesize provider = _provider;
@synthesize specialId = _specialId;
@synthesize serialState = _serialState;
@synthesize isPaid = _isPaid;
@synthesize footnote = _footnote;
@synthesize tags = _tags;
@synthesize priceTypeId = _priceTypeId;
@synthesize commentsCount = _commentsCount;
@synthesize albumId = _albumId;
@synthesize tracks = _tracks;
@synthesize pic = _pic;
@synthesize longTitle = _longTitle;
@synthesize coverPath = _coverPath;
@synthesize title = _title;
@synthesize albumCoverUrl290 = _albumCoverUrl290;
@synthesize coverSmall = _coverSmall;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.uid = [[self objectOrNilForKey:kGYListUid fromDictionary:dict] doubleValue];
            self.trackTitle = [self objectOrNilForKey:kGYListTrackTitle fromDictionary:dict];
            self.isShare = [[self objectOrNilForKey:kGYListIsShare fromDictionary:dict] boolValue];
            self.listIdentifier = [[self objectOrNilForKey:kGYListId fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kGYListCoverMiddle fromDictionary:dict];
            self.shortTitle = [self objectOrNilForKey:kGYListShortTitle fromDictionary:dict];
            self.playsCounts = [[self objectOrNilForKey:kGYListPlaysCounts fromDictionary:dict] doubleValue];
            self.subType = [[self objectOrNilForKey:kGYListSubType fromDictionary:dict] doubleValue];
            self.isExternalUrl = [[self objectOrNilForKey:kGYListIsExternalUrl fromDictionary:dict] boolValue];
            self.subtitle = [self objectOrNilForKey:kGYListSubtitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kGYListUrl fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kGYListNickname fromDictionary:dict];
            self.columnType = [[self objectOrNilForKey:kGYListColumnType fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kGYListType fromDictionary:dict] doubleValue];
            self.contentType = [self objectOrNilForKey:kGYListContentType fromDictionary:dict];
            self.intro = [self objectOrNilForKey:kGYListIntro fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kGYListCoverLarge fromDictionary:dict];
            self.isFinished = [[self objectOrNilForKey:kGYListIsFinished fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kGYListTrackId fromDictionary:dict] doubleValue];
            self.provider = [self objectOrNilForKey:kGYListProvider fromDictionary:dict];
            self.specialId = [[self objectOrNilForKey:kGYListSpecialId fromDictionary:dict] doubleValue];
            self.serialState = [[self objectOrNilForKey:kGYListSerialState fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kGYListIsPaid fromDictionary:dict] boolValue];
            self.footnote = [self objectOrNilForKey:kGYListFootnote fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kGYListTags fromDictionary:dict];
            self.priceTypeId = [[self objectOrNilForKey:kGYListPriceTypeId fromDictionary:dict] doubleValue];
            self.commentsCount = [[self objectOrNilForKey:kGYListCommentsCount fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kGYListAlbumId fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kGYListTracks fromDictionary:dict] doubleValue];
            self.pic = [self objectOrNilForKey:kGYListPic fromDictionary:dict];
            self.longTitle = [self objectOrNilForKey:kGYListLongTitle fromDictionary:dict];
            self.coverPath = [self objectOrNilForKey:kGYListCoverPath fromDictionary:dict];
            self.title = [self objectOrNilForKey:kGYListTitle fromDictionary:dict];
            self.albumCoverUrl290 = [self objectOrNilForKey:kGYListAlbumCoverUrl290 fromDictionary:dict];
            self.coverSmall = [self objectOrNilForKey:kGYListCoverSmall fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kGYListUid];
    [mutableDict setValue:self.trackTitle forKey:kGYListTrackTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.isShare] forKey:kGYListIsShare];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kGYListId];
    [mutableDict setValue:self.coverMiddle forKey:kGYListCoverMiddle];
    [mutableDict setValue:self.shortTitle forKey:kGYListShortTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kGYListPlaysCounts];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subType] forKey:kGYListSubType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isExternalUrl] forKey:kGYListIsExternalUrl];
    [mutableDict setValue:self.subtitle forKey:kGYListSubtitle];
    [mutableDict setValue:self.url forKey:kGYListUrl];
    [mutableDict setValue:self.nickname forKey:kGYListNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.columnType] forKey:kGYListColumnType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kGYListType];
    [mutableDict setValue:self.contentType forKey:kGYListContentType];
    [mutableDict setValue:self.intro forKey:kGYListIntro];
    [mutableDict setValue:self.coverLarge forKey:kGYListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinished] forKey:kGYListIsFinished];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kGYListTrackId];
    [mutableDict setValue:self.provider forKey:kGYListProvider];
    [mutableDict setValue:[NSNumber numberWithDouble:self.specialId] forKey:kGYListSpecialId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kGYListSerialState];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kGYListIsPaid];
    [mutableDict setValue:self.footnote forKey:kGYListFootnote];
    [mutableDict setValue:self.tags forKey:kGYListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kGYListPriceTypeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kGYListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kGYListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kGYListTracks];
    [mutableDict setValue:self.pic forKey:kGYListPic];
    [mutableDict setValue:self.longTitle forKey:kGYListLongTitle];
    [mutableDict setValue:self.coverPath forKey:kGYListCoverPath];
    [mutableDict setValue:self.title forKey:kGYListTitle];
    [mutableDict setValue:self.albumCoverUrl290 forKey:kGYListAlbumCoverUrl290];
    [mutableDict setValue:self.coverSmall forKey:kGYListCoverSmall];

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

    self.uid = [aDecoder decodeDoubleForKey:kGYListUid];
    self.trackTitle = [aDecoder decodeObjectForKey:kGYListTrackTitle];
    self.isShare = [aDecoder decodeBoolForKey:kGYListIsShare];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kGYListId];
    self.coverMiddle = [aDecoder decodeObjectForKey:kGYListCoverMiddle];
    self.shortTitle = [aDecoder decodeObjectForKey:kGYListShortTitle];
    self.playsCounts = [aDecoder decodeDoubleForKey:kGYListPlaysCounts];
    self.subType = [aDecoder decodeDoubleForKey:kGYListSubType];
    self.isExternalUrl = [aDecoder decodeBoolForKey:kGYListIsExternalUrl];
    self.subtitle = [aDecoder decodeObjectForKey:kGYListSubtitle];
    self.url = [aDecoder decodeObjectForKey:kGYListUrl];
    self.nickname = [aDecoder decodeObjectForKey:kGYListNickname];
    self.columnType = [aDecoder decodeDoubleForKey:kGYListColumnType];
    self.type = [aDecoder decodeDoubleForKey:kGYListType];
    self.contentType = [aDecoder decodeObjectForKey:kGYListContentType];
    self.intro = [aDecoder decodeObjectForKey:kGYListIntro];
    self.coverLarge = [aDecoder decodeObjectForKey:kGYListCoverLarge];
    self.isFinished = [aDecoder decodeDoubleForKey:kGYListIsFinished];
    self.trackId = [aDecoder decodeDoubleForKey:kGYListTrackId];
    self.provider = [aDecoder decodeObjectForKey:kGYListProvider];
    self.specialId = [aDecoder decodeDoubleForKey:kGYListSpecialId];
    self.serialState = [aDecoder decodeDoubleForKey:kGYListSerialState];
    self.isPaid = [aDecoder decodeBoolForKey:kGYListIsPaid];
    self.footnote = [aDecoder decodeObjectForKey:kGYListFootnote];
    self.tags = [aDecoder decodeObjectForKey:kGYListTags];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kGYListPriceTypeId];
    self.commentsCount = [aDecoder decodeDoubleForKey:kGYListCommentsCount];
    self.albumId = [aDecoder decodeDoubleForKey:kGYListAlbumId];
    self.tracks = [aDecoder decodeDoubleForKey:kGYListTracks];
    self.pic = [aDecoder decodeObjectForKey:kGYListPic];
    self.longTitle = [aDecoder decodeObjectForKey:kGYListLongTitle];
    self.coverPath = [aDecoder decodeObjectForKey:kGYListCoverPath];
    self.title = [aDecoder decodeObjectForKey:kGYListTitle];
    self.albumCoverUrl290 = [aDecoder decodeObjectForKey:kGYListAlbumCoverUrl290];
    self.coverSmall = [aDecoder decodeObjectForKey:kGYListCoverSmall];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kGYListUid];
    [aCoder encodeObject:_trackTitle forKey:kGYListTrackTitle];
    [aCoder encodeBool:_isShare forKey:kGYListIsShare];
    [aCoder encodeDouble:_listIdentifier forKey:kGYListId];
    [aCoder encodeObject:_coverMiddle forKey:kGYListCoverMiddle];
    [aCoder encodeObject:_shortTitle forKey:kGYListShortTitle];
    [aCoder encodeDouble:_playsCounts forKey:kGYListPlaysCounts];
    [aCoder encodeDouble:_subType forKey:kGYListSubType];
    [aCoder encodeBool:_isExternalUrl forKey:kGYListIsExternalUrl];
    [aCoder encodeObject:_subtitle forKey:kGYListSubtitle];
    [aCoder encodeObject:_url forKey:kGYListUrl];
    [aCoder encodeObject:_nickname forKey:kGYListNickname];
    [aCoder encodeDouble:_columnType forKey:kGYListColumnType];
    [aCoder encodeDouble:_type forKey:kGYListType];
    [aCoder encodeObject:_contentType forKey:kGYListContentType];
    [aCoder encodeObject:_intro forKey:kGYListIntro];
    [aCoder encodeObject:_coverLarge forKey:kGYListCoverLarge];
    [aCoder encodeDouble:_isFinished forKey:kGYListIsFinished];
    [aCoder encodeDouble:_trackId forKey:kGYListTrackId];
    [aCoder encodeObject:_provider forKey:kGYListProvider];
    [aCoder encodeDouble:_specialId forKey:kGYListSpecialId];
    [aCoder encodeDouble:_serialState forKey:kGYListSerialState];
    [aCoder encodeBool:_isPaid forKey:kGYListIsPaid];
    [aCoder encodeObject:_footnote forKey:kGYListFootnote];
    [aCoder encodeObject:_tags forKey:kGYListTags];
    [aCoder encodeDouble:_priceTypeId forKey:kGYListPriceTypeId];
    [aCoder encodeDouble:_commentsCount forKey:kGYListCommentsCount];
    [aCoder encodeDouble:_albumId forKey:kGYListAlbumId];
    [aCoder encodeDouble:_tracks forKey:kGYListTracks];
    [aCoder encodeObject:_pic forKey:kGYListPic];
    [aCoder encodeObject:_longTitle forKey:kGYListLongTitle];
    [aCoder encodeObject:_coverPath forKey:kGYListCoverPath];
    [aCoder encodeObject:_title forKey:kGYListTitle];
    [aCoder encodeObject:_albumCoverUrl290 forKey:kGYListAlbumCoverUrl290];
    [aCoder encodeObject:_coverSmall forKey:kGYListCoverSmall];
}

- (id)copyWithZone:(NSZone *)zone {
    GYList *copy = [[GYList alloc] init];
    
    
    
    if (copy) {

        copy.uid = self.uid;
        copy.trackTitle = [self.trackTitle copyWithZone:zone];
        copy.isShare = self.isShare;
        copy.listIdentifier = self.listIdentifier;
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.playsCounts = self.playsCounts;
        copy.subType = self.subType;
        copy.isExternalUrl = self.isExternalUrl;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.columnType = self.columnType;
        copy.type = self.type;
        copy.contentType = [self.contentType copyWithZone:zone];
        copy.intro = [self.intro copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.isFinished = self.isFinished;
        copy.trackId = self.trackId;
        copy.provider = [self.provider copyWithZone:zone];
        copy.specialId = self.specialId;
        copy.serialState = self.serialState;
        copy.isPaid = self.isPaid;
        copy.footnote = [self.footnote copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.priceTypeId = self.priceTypeId;
        copy.commentsCount = self.commentsCount;
        copy.albumId = self.albumId;
        copy.tracks = self.tracks;
        copy.pic = [self.pic copyWithZone:zone];
        copy.longTitle = [self.longTitle copyWithZone:zone];
        copy.coverPath = [self.coverPath copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.albumCoverUrl290 = [self.albumCoverUrl290 copyWithZone:zone];
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
    }
    
    return copy;
}


@end
