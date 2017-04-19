//
//  TimeChangeTool.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeChangeTool : NSObject

+ (NSString *)timeChangeWithDuration:(NSInteger)duration;

+ (NSString *)timeChangeWithCreatedAt:(long)createAt;

@end
