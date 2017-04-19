//
//  NumberChangeTool.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/25.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberChangeTool : NSObject

+ (NSString *)changeNumberWithCount:(NSNumber *)count;

//处理播放和弹幕人数
+ (NSString *)dealWithPlayNum:(NSNumber *)text;


@end
