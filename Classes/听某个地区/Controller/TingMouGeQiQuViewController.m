//
//  TingMouGeQiQuViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "TingMouGeQiQuViewController.h"

@interface TingMouGeQiQuViewController ()

@end

@implementation TingMouGeQiQuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"听广州";
    
    [self setLeftNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLeftNavigationItem{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_back_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popAction:)];
    
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)popAction:(UINavigationItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
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
