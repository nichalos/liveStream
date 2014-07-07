//
//  SelfInfoViewController.m
//  LiveApp
//
//  Created by 夏宝梦 on 14-7-7.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "SelfInfoViewController.h"

@interface SelfInfoViewController ()

@end

@implementation SelfInfoViewController

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
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:76.0/255 green:23.0/255 blue:89.0/255 alpha:1.0f]];
    
    
    UIButton *cancelbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelbtn.frame = CGRectMake(0,26, 40, 40);
    [cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelbtn addTarget: self action: @selector(CancelButtonPressed) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem * back=[[UIBarButtonItem alloc]initWithCustomView:cancelbtn];
    self.navigationItem.leftBarButtonItem=back;
    
    UILabel *titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40,40)];
    titleLb.backgroundColor = [UIColor clearColor];
    titleLb.textColor = [UIColor whiteColor];
    titleLb.text = @"个人资料";
    self.navigationItem.titleView = titleLb;
    
    UIButton *savebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    savebtn.frame = CGRectMake(0,26, 40, 40);
    [savebtn setTitle:@"保存" forState:UIControlStateNormal];
    [savebtn addTarget: self action: @selector(SaveButtonPressed) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem * save=[[UIBarButtonItem alloc]initWithCustomView:savebtn];
    self.navigationItem.rightBarButtonItem=save;
    
    
    UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2 - 57, 89, 114, 114)];
    headImage.image = [UIImage imageNamed:@"185-185个人资料内头像.png"];
    [self.view addSubview:headImage];
    
    UIButton * changeHeadImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeHeadImageBtn.backgroundColor = [UIColor blackColor];///////
    changeHeadImageBtn.frame = CGRectMake(VIEW_WIDTH/2 - 37.5, CGRectGetMaxY(headImage.frame) + 14, 75, 20);
    [changeHeadImageBtn addTarget:self action:@selector(ChangeHeadImage) forControlEvents:UIControlEventTouchUpInside];
    [changeHeadImageBtn setTitle:@"修改头像" forState:UIControlStateNormal];
    changeHeadImageBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    changeHeadImageBtn.titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:changeHeadImageBtn];
    


}

-(void)CancelButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = YES;
}

-(void)SaveButtonPressed
{
    
}

-(void)ChangeHeadImage
{
    
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
