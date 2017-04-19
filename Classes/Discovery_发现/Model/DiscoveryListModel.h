//
//  DiscoveryListModel.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscoveryListModel : NSObject

@property (nonatomic , strong) NSNumber              * Id;
@property (nonatomic , copy) NSString              * subCoverPath;
@property (nonatomic , copy) NSString              * subtitle;
@property (nonatomic , strong) NSNumber              * isExternalUrl;
@property (nonatomic , copy) NSString              * contentType;
@property (nonatomic , copy) NSString              * url;
@property (nonatomic , strong) NSNumber              * enableShare;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , strong) NSArray              * properties;
@property (nonatomic , strong) NSNumber              * contentUpdatedAt;
@property (nonatomic , copy) NSString              * coverPath;
@property (nonatomic , copy) NSString              * sharePic;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
