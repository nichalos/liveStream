//
//  LiveLoginViewController.m
//  LiveApp
//
//  Created by nichalos on 14-7-5.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveLoginViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
@interface LiveLoginViewController ()

@end

@implementation LiveLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"登录渐变背景"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UIButton *baiduBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    baiduBtn.frame = CGRectMake((VIEW_WIDTH-286)/2, 360, 286, 45);
    [baiduBtn setBackgroundImage:[UIImage imageNamed:@"百度账号登录按钮"] forState:UIControlStateNormal];
    [baiduBtn addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    baiduBtn.tag = 0;
    [self.view addSubview:baiduBtn];
    
    UIButton *signUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signUpBtn.frame = CGRectMake(VIEW_X(baiduBtn), CGRectGetMaxY(baiduBtn.frame)+15, 286, 45);
    [signUpBtn setBackgroundImage:[UIImage imageNamed:@"电子邮箱注册按钮"] forState:UIControlStateNormal];
    [signUpBtn addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    signUpBtn.tag = 1;
    [self.view addSubview:signUpBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(VIEW_X(baiduBtn), CGRectGetMaxY(signUpBtn.frame)+15, 286, 45);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.tag = 2;
    [self.view addSubview:loginBtn];
}

- (void)selectButton:(UIButton*)button
{
    switch (button.tag) {
        case 0:
        {
            
        }
            break;
         case 1:
        {
            
        }
            break;
        case 2:
        {
            LoginViewController *login = [[LoginViewController alloc] init];
            login.navigationController.navigationBar.hidden = YES;
            [self.navigationController pushViewController:login animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
