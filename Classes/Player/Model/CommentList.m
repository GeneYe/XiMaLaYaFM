//
//  CommentList.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/25.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "CommentList.h"

@implementation CommentList

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
}

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    
    if ( self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


@end
