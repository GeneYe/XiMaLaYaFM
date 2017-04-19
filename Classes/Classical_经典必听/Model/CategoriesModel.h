//
//  CategoriesModel.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoriesModel : NSObject

@property (nonatomic,strong)NSNumber *Id;

@property (nonatomic,strong)NSString *key;

@property (nonatomic,strong)NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
