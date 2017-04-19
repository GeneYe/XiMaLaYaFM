//
//  ReMenFenXiangModel.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenFenXiangModel.h"

@implementation ReMenFenXiangModel

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
