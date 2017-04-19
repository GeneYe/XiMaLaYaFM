//
//  FuFeiJingPinViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "FuFeiJingPinViewController.h"

@interface FuFeiJingPinViewController ()

@end

@implementation FuFeiJingPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"付费精品";
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"find_album_bg"]];
    
    imageView.frame = CGRectMake(0, 64, Screen_Width, Screen_Height);
    
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
