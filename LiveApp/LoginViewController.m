//
//  LoginViewController.m
//  LiveApp
//
//  Created by nichalos on 14-7-5.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"登录渐变背景"];//LiveShow03.jpg
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UIImageView *userName = [[UIImageView alloc] initWithFrame:CGRectMake((VIEW_WIDTH-286)/2, 290, 286, 44)];
    userName.userInteractionEnabled = YES;
    userName.image = [UIImage imageNamed:@"描边框"];
    
    UIImageView *userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, (VIEW_FRAME_HEIGHT(userName)-30)/2, 30, 30)];
    userIcon.image = [UIImage imageNamed:@"用户名"];
    [userName addSubview:userIcon];
    
    userNameField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userIcon.frame), 0, VIEW_FRAME_WIDTH(userName)-VIEW_FRAME_WIDTH(userIcon), VIEW_FRAME_HEIGHT(userName))];
    userNameField.placeholder = @"手机／邮箱／用户名";
    userNameField.delegate = self;
    userNameField.textColor = [UIColor whiteColor];
    userNameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    userNameField.font = [UIFont systemFontOfSize:14];
    userNameField.textAlignment = NSTextAlignmentLeft;
    userNameField.returnKeyType = UIReturnKeyNext;
    userNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    userNameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [userName addSubview:userNameField];
    
    [self.view addSubview:userName];
    
    UIImageView *password = [[UIImageView alloc] initWithFrame:CGRectMake(VIEW_X(userName), CGRectGetMaxY(userName.frame)+18, 286, 44)];
    password.userInteractionEnabled = YES;
    password.image = [UIImage imageNamed:@"描边框"];
    
    UIImageView *passwordIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, (VIEW_FRAME_HEIGHT(password)-30)/2, 30, 30)];
    passwordIcon.image = [UIImage imageNamed:@"密码"];
    [password addSubview:passwordIcon];
    
    passWordField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(passwordIcon.frame), 0, VIEW_FRAME_WIDTH(password)-VIEW_FRAME_WIDTH(passwordIcon), VIEW_FRAME_HEIGHT(password))];
    passWordField.secureTextEntry = YES;
    passWordField.delegate = self;
    passWordField.placeholder = @"密码";
    passWordField.font = [UIFont systemFontOfSize:14];
    passWordField.textAlignment = NSTextAlignmentLeft;
    passWordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passWordField.returnKeyType = UIReturnKeyDone;
    passWordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [password addSubview:passWordField];
    
    [self.view addSubview:password];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(VIEW_X(userName), CGRectGetMaxY(password.frame)+18, 286, 44);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"大按钮背景"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.tag = 2;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == userNameField)
    {
        [passWordField becomeFirstResponder];
    }
    else
    {
        [self login:nil];
    }
    return NO;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==passWordField)
    {
        [self moveOffSet:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==userNameField)
    {
        [self moveOffSet:YES];
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

- (void)hideTextField:(UIPinchGestureRecognizer *)touch
{
    
    if ([userNameField isFirstResponder]) {
        [userNameField resignFirstResponder];
    }
    if ([passWordField isFirstResponder]) {
        [passWordField resignFirstResponder];
    }
    [self moveOffSet:NO];
}


-(void)moveOffSet:(BOOL)up
{
    
    const int movementDistance = 110;    //
    const float movementDuration = 0.3f; //
    
    int movement = (up ? -movementDistance : 0);
    
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.bounds, 0, movement);
    
    [UIView commitAnimations];
    
}
-(void)login:(UIButton*)button
{
    [self hideTextField:nil];
   __block MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
	hud.labelText = @"登录......";
	[hud showAnimated:YES whileExecutingBlock:^{
		[self myTask];
	} completionBlock:^{
		if (([userNameField.text isEqualToString:@"test@baidu.com"]
             || [userNameField.text isEqualToString:@"test123"]
             || [userNameField.text isEqualToString:@"13812345678"])
            && [passWordField.text isEqualToString:@"123456"]) {
            [hud removeFromSuperview];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_SUCCESS" object:nil];
        }else{
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"用户名或密码错误";
            hud.margin = 10.f;
            hud.yOffset = -30.f;
            hud.removeFromSuperViewOnHide = YES;
            [hud hide:YES afterDelay:1];
        }
	}];
    
}
- (void)myTask {
	// Do something usefull in here instead of sleeping ...
	sleep(2);
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
