//
//  GYTabBarController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/16.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "GYTabBarController.h"
#import "HomeRongQIViewController.h"
#import "DingYueViewController.h"
#import "DiscoveryViewController.h"
#import "MineViewController.h"

#import "GYNavigationController.h"

#import "GYTabBar.h"


@interface GYTabBarController ()<UINavigationControllerDelegate>

@end

@implementation GYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置子控制器
    [self setUpChildViewControllers];
    //处理tabebar 使用自定义tabBar 添加中间按钮
    [self setUpTabBar];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    
    
}
- (void)setUpTabBar{
    [self setValue:[[GYTabBar alloc] init] forKey:@"tabBar"];
}

- (void)setUpChildViewControllers{
    

    
    [self setUpOneChildController:[[GYNavigationController alloc] initWithRootViewController:[[HomeRongQIViewController alloc] init]] Title:nil Image:@"tabbar_icon_homepage_normal" SelectedImage:@"tabbar_icon_homepage_pressed"];
    
    [self setUpOneChildController:[[GYNavigationController alloc] initWithRootViewController:[[DingYueViewController alloc] init]] Title:nil Image:@"tabbar_icon_Rss_normal" SelectedImage:@"tabbar_icon_Rss_pressed"];
    
    
    [self setUpOneChildController:[[GYNavigationController alloc] initWithRootViewController:[[DiscoveryViewController alloc] init]] Title:nil Image:@"tabbar_icon_find_normal" SelectedImage:@"tabbar_icon_find_pressed"];
    
    [self setUpOneChildController:[[GYNavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]] Title:nil Image:@"tabbar_icon_my_normal" SelectedImage:@"tabbar_icon_my_pressed"];
}

- (void)setUpOneChildController:(UIViewController *)vc
                          Title:(NSString *)title
                          Image:(NSString *)image
                  SelectedImage:(NSString *)selectedImage
{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    CGFloat offset = 6.0;
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    
    [self addChildViewController:vc];
}


- (UIImage *)imageWithColor:(UIColor *)color
{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
