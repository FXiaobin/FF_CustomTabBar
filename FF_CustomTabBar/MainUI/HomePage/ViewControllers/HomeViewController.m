//
//  HomeViewController.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"

#import "TYTapWaveView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] init];
    
    
    TYTapWaveView *a = [[TYTapWaveView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    a.backgroundColor = [UIColor whiteColor];
    
    a.radiusofWaveStart = 0;
    a.radiusofWaveEnd = 20;
    a.colorofwave = [UIColor cyanColor];
    a.timeofwave = 1.0/2;
    a.onlycenter = YES;
    
    [self.view addSubview:a];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NextViewController *vc = [NextViewController new];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
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
