//
//  DingYueViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/15.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "DingYueViewController.h"
#import "DingYueNoDataView.h"

@interface DingYueViewController ()

@property (nonatomic,strong)DingYueNoDataView *nodataView;

@end

@implementation DingYueViewController

- (DingYueNoDataView *)nodataView{
    if (!_nodataView) {
        _nodataView = [DingYueNoDataView initCustomViewWithFrame:self.view.bounds];
        
        [_nodataView.loginButton addTarget:self action:@selector(presentToLoginVC:) forControlEvents:UIControlEventTouchDown];
        [_nodataView.pushToTuiJianButton addTarget:self action:@selector(pushToTuiJianVC:) forControlEvents:UIControlEventTouchDown];
        
    }
    return _nodataView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GYBgColor;
    self.navigationItem.title = @"订阅";
    
    [self.view addSubview:self.nodataView];
    
    [self setLeftBarButtonItem];
}


- (void)setLeftBarButtonItem{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"top_addlike_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pushToVC:)];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void)pushToVC:(UIBarButtonItem *)sender{
    
}



- (void)presentToLoginVC:(UIButton *)sender{
    
}

- (void)pushToTuiJianVC:(UIButton *)sender{
    
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
