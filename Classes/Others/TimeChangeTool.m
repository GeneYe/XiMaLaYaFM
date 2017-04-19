//
//  TimeChangeTool.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "TimeChangeTool.h"

@implementation TimeChangeTool

+(NSString *)timeChangeWithDuration:(NSInteger)duration{
    NSInteger minute = 0;
    NSInteger second = 0;
    if (duration < 60) {
        
        return [NSString stringWithFormat:@"00:%ld",(long)duration];
    }
    else{
        
        minute = (NSInteger)duration/60;
        second = (NSInteger)(duration - 60*minute);
        if (second < 10) {
            if (minute < 10) {
                return [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
            }
            else{
                return [NSString stringWithFormat:@"%ld:%02ld",(long)minute,(long)second];
            }
        }
        else{
            if (minute < 10) {
                return [NSString stringWithFormat:@"%02ld:%ld",(long)minute,(long)second];
            }
            else{
                return [NSString stringWithFormat:@"%ld:%ld",(long)minute,(long)second];
            }

        }
    }
    
}



+ (NSString *)timeChangeWithCreatedAt:(long)createAt{
    NSTimeInterval timeIntervalSince1970 = [[NSDate date]timeIntervalSince1970];
    //秒
    long count = timeIntervalSince1970 - createAt/1000;
    
    if (count < 60) {
        return [NSString stringWithFormat:@"%ld秒前",count];
    }
    else{
        //分钟
        count = count/60;
        if (count < 60) {
            return [NSString stringWithFormat:@"%ld分钟前",count];
        }
        else{
            //小时
            count = count/60;
            if (count < 12) {
                return [NSString stringWithFormat:@"%ld小时前",count];
            }
            else{
                count = count/12;
                return [NSString stringWithFormat:@"%ld天前",count];
            }
            
        }
    }
    
    
    return nil;
}

@end
