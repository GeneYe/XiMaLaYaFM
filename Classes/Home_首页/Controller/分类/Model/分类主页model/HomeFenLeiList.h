//
//  HomeFenLeiList.h
//
//  Created by   on 16/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeFenLeiList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) double orderNum;
@property (nonatomic, assign) BOOL filterSupported;
@property (nonatomic, assign) BOOL isChecked;
@property (nonatomic, assign) BOOL isFinished;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL selectedSwitch;
@property (nonatomic, assign) double categoryType;
@property (nonatomic, strong) NSString *coverPath;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
