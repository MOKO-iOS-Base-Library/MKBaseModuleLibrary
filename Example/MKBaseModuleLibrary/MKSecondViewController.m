//
//  MKSecondViewController.m
//  MKBaseModuleLibrary_Example
//
//  Created by aa on 2026/3/31.
//  Copyright © 2026 aadyx2007@163.com. All rights reserved.
//

#import "MKSecondViewController.h"

@interface MKSecondViewController ()

@end

@implementation MKSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.defaultTitle = @"第二个";
    self.navBarBackgroundColor = [UIColor redColor];
    [self.rightButton setImage:[UIImage imageNamed:@"idm_saveIcon.png"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
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
