//
//  TrackInfoModel.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/23.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "TrackInfoModel.h"

@implementation TrackInfoModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    
    if ( self == [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
