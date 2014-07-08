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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.navigationController.navigationBar.hidden = NO;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackgroundImage];
    self.navigationController.navigationBar.hidden = NO;
    
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
    changeHeadImageBtn.frame = CGRectMake(VIEW_WIDTH/2 - 37.5, CGRectGetMaxY(headImage.frame) + 10, 75, 20);
    [changeHeadImageBtn addTarget:self action:@selector(ChangeHeadImage) forControlEvents:UIControlEventTouchUpInside];
    [changeHeadImageBtn setTitle:@"修改头像" forState:UIControlStateNormal];
    changeHeadImageBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    changeHeadImageBtn.titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:changeHeadImageBtn];
    
    UILabel * nameLabel = [self LabelWithRect:CGRectMake(15, CGRectGetMaxY(changeHeadImageBtn.frame) + 30, 65, 25) andTitle:@"昵       称"];
    [self.view addSubview:nameLabel];
    self.nameTF = [self TextFieldWithRect:CGRectMake(CGRectGetMaxX(nameLabel.frame) + 10, CGRectGetMinY(nameLabel.frame), 215, 25)];
    self.nameTF.text = @"猫咪123";/////////////
    self.nameTF.keyboardType = UIKeyboardTypeDefault;
    self.nameTF.keyboardAppearance = UIKeyboardAppearanceLight;
    

    self.nameTF.delegate = self;
    [self.view addSubview:self.nameTF];
    
    UILabel * mailLabel = [self LabelWithRect:CGRectMake(15, CGRectGetMaxY(nameLabel.frame) + 15, 65, 25) andTitle:@"电子邮箱"];
    [self.view addSubview:mailLabel];
    self.mailTF = [self TextFieldWithRect:CGRectMake(CGRectGetMaxX(mailLabel.frame) + 10, CGRectGetMinY(mailLabel.frame), 215, 25)];
    self.mailTF.delegate = self;
    [self.view addSubview:self.mailTF];
    
    UILabel * sexLabel = [self LabelWithRect:CGRectMake(15, CGRectGetMaxY(mailLabel.frame) + 15, 65, 25) andTitle:@"性       别"];
    [self.view addSubview:sexLabel];
    self.sexTF = [self TextFieldWithRect:CGRectMake(CGRectGetMaxX(sexLabel.frame) + 10, CGRectGetMinY(sexLabel.frame), 215, 25)];
    self.sexTF.delegate = self;
    [self.view addSubview:self.sexTF];
    
    UILabel * tagLabel = [self LabelWithRect:CGRectMake(15, CGRectGetMaxY(sexLabel.frame) + 15, 65, 25) andTitle:@"标       签"];
    [self.view addSubview:tagLabel];
    self.tagTF = [self TextFieldWithRect:CGRectMake(CGRectGetMaxX(tagLabel.frame) + 10, CGRectGetMinY(tagLabel.frame), 215, 25)];
    self.tagTF.delegate = self;
    [self.view addSubview:self.tagTF];
    
    UILabel * birthLabel = [self LabelWithRect:CGRectMake(15, CGRectGetMaxY(tagLabel.frame) +15, 65, 25) andTitle:@"生       日"];
    [self.view addSubview:birthLabel];
    self.birthTF = [self TextFieldWithRect:CGRectMake(CGRectGetMaxX(birthLabel.frame) + 10, CGRectGetMinY(birthLabel.frame), 215, 25)];
    self.birthTF.delegate = self;
    [self.view addSubview:self.birthTF];
    
    UILabel * detailLabel = [self LabelWithRect:CGRectMake(15, CGRectGetMaxY(birthLabel.frame) +15, 65, 25) andTitle:@"个人描述"];
    [self.view addSubview:detailLabel];
    self.detailTF = [self TextFieldWithRect:CGRectMake(CGRectGetMaxX(detailLabel.frame) + 10, CGRectGetMinY(detailLabel.frame), 215, 25)];
    self.detailTF.delegate = self;
    [self.view addSubview:self.detailTF];

}

- (void)setBackgroundImage
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"整体暗色大背景"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
}

-(UILabel* )LabelWithRect:(CGRect)rect andTitle:(NSString *)title
{
    UILabel * label = [[UILabel alloc] initWithFrame:rect];
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

-(UITextField *) TextFieldWithRect:(CGRect)rect
{
    UITextField * Tf = [[UITextField alloc]initWithFrame:rect];
    Tf.textAlignment = NSTextAlignmentLeft;
    Tf.font = [UIFont systemFontOfSize:15];
    Tf.textColor = [UIColor whiteColor];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(rect) - 5, CGRectGetMaxY(rect), CGRectGetWidth(rect) + 10, 0.5)];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    
    return Tf;
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


//取消
-(void)CancelButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}
//保存
-(void)SaveButtonPressed
{
    
}
//修改头像
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
