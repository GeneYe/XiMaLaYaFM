//
//  CommentList.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/25.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentList : NSObject

@property (nonatomic , strong) NSNumber              * parentId;
@property (nonatomic , strong) NSNumber              * uid;
@property (nonatomic , copy) NSString              * smallHeader;
@property (nonatomic , strong) NSNumber              * Id;
@property (nonatomic , strong) NSNumber              * track_id;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , copy) NSString              * content;
@property (nonatomic , strong) NSNumber              * updatedAt;
@property (nonatomic , strong) NSNumber              * createdAt;
@property (nonatomic , strong) NSNumber              * likes;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
