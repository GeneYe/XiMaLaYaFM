//
//  NumberChangeTool.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/25.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "NumberChangeTool.h"

@implementation NumberChangeTool

+ (NSString *)changeNumberWithCount:(NSNumber *)count{
    
    NSInteger sum = [count integerValue];
    
    if (sum > 10000) {
        return [NSString stringWithFormat:@"%.1lf万",sum/10000.0];
    }
    else{
        return [NSString stringWithFormat:@"%@",count];
    }
}

+ (NSString *)dealWithPlayNum:(NSNumber *)text{
    
    int num = [text intValue];
    if (num < 10000) {
        return [NSString stringWithFormat:@"%@",text];
    }
    else{
        return [NSString stringWithFormat:@"%.1f万",(float)num/10000];
    }
}

@end
