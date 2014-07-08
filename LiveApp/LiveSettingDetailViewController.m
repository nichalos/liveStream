//
//  LiveSettingDetailViewController.m
//  LiveApp
//
//  Created by Artron on 14-7-7.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveSettingDetailViewController.h"


@interface LiveSettingDetailViewController ()

@end

@implementation LiveSettingDetailViewController
@synthesize touchIndex = _touchIndex;

CGFloat top = 64;
CGFloat bottom = 63;
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
    
    NSArray * array = [[NSArray alloc] initWithObjects:@"修改资料",@"更改密码",@"连接社交账号",@"保存路径",@"通知提示",@"FTP相机输入",@"直播秀设备",@"远程摄像", nil];
    
    [self initPopTitileView:[array objectAtIndex:self.touchIndex]];
    [self selectTouchIndexPage];
    
}

//- (void)setBackgroundImg
//{
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.image = [UIImage imageNamed:@"整体暗色大背景"];
//    imageView.userInteractionEnabled = YES;
//    [self.view addSubview:imageView];
//}

-(void)initPopTitileView:(NSString *)title
{
    UIImageView *commonTitleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 64)];
    commonTitleView.image = [UIImage imageNamed:@"title_background"];
    commonTitleView.userInteractionEnabled = YES;
    
    
    UILabel *_titleNameLabel = [[UILabel alloc]init];
    _titleNameLabel.backgroundColor = [UIColor clearColor];
    _titleNameLabel.frame = CGRectMake((VIEW_WIDTH-200)/2, 20, 200, commonTitleView.frame.size.height-20);
    _titleNameLabel.text = title;
    _titleNameLabel.font =[UIFont systemFontOfSize:17];
    _titleNameLabel.textColor = [UIColor whiteColor];
    _titleNameLabel.textAlignment = NSTextAlignmentCenter;
    [commonTitleView addSubview:_titleNameLabel];
    
    [self.view addSubview:commonTitleView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 27, 30, 30);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateNormal];
    [commonTitleView addSubview:button];
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)selectTouchIndexPage
{
    switch (self.touchIndex) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            [self changePassWord];
        }
            break;
        case 2:
        {
            UIButton * button = [self drawButton:@"链接百度账号" rect:CGRectMake(15, top + 25, VIEW_WIDTH - 30, 45) action:@selector(contactSocial)];
            [self.view addSubview:button];
        }
            break;
        case 3:
        {
            CGRect frame = CGRectMake(0, top + 15, VIEW_WIDTH, 45);
            CGRect textVFrame = CGRectMake(30, CGRectGetMaxY(frame) + 30, VIEW_WIDTH - 60, 80);
            [self setTitle:@"保存视频到图库" Frame:frame isOn:YES];
            [self initTextView:@"启用此设置保存任何照片和视频到你的设备媒体库" Frame:textVFrame];
            
        }
            break;
        case 4:
        {
            CGRect frame = CGRectMake(0, top + 15, VIEW_WIDTH, 45);
            CGRect textVFrame = CGRectMake(30, CGRectGetMaxY(frame) + 30, VIEW_WIDTH - 60, 80);
            [self setTitle:@"自动通知" Frame:frame isOn:NO];
            [self initTextView:@"当启用时，现场会自动发出通知所有的关注的人，对你做一个事件的实时视频广播" Frame:textVFrame];
            
        }
            break;
        case 5:
        {
            [self photoInput];
        }
            break;
        case 6:
        {
            [self checkEquipment];
        }
            break;
        case 7:
        {
            CGRect frame = CGRectMake(0, top + 15, VIEW_WIDTH, 45);
            CGRect textVFrame = CGRectMake(30, CGRectGetMaxY(frame) + 30, VIEW_WIDTH - 60, 80);
            [self setTitle:@"远程摄像" Frame:frame isOn:NO];
            [self initTextView:@"此功能将使您使用的相机作为一个远程源直播室。一旦使用您会看到一个额外的选项进入生产者模式学习更多关于这个特征和直播秀工作室。" Frame:textVFrame];
        }
            break;
            
        default:
            break;
    }
}


#pragma passWord

-(void)changePassWord
{
    NSArray * text = [NSArray arrayWithObjects:@"原始密码",@"输入新密码",@"再次输入新密码", nil];
    
    for (int i = 0; i < 3; i++)
    {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(15, top + (45 + 15) * i + 15  , VIEW_WIDTH - 30, 45)];
        view.backgroundColor = [UIColor clearColor];
        view.image = [UIImage imageNamed:@"描边框"];
        view.userInteractionEnabled = YES;
        view.tag = 1100 + i;
        [self.view addSubview:view];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(view.bounds.origin.x,
                                                                                view.bounds.origin.y + 8,
                                                                                30, 30)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:@"更改密码钥匙图标"];
        
        [view addSubview:imageView];
        
        UITextField * textfield = [[UITextField alloc] initWithFrame:CGRectMake(view.bounds.origin.x + imageView.bounds.size.width,
                                                                         view.bounds.origin.y ,
                                                                         view.bounds.size.width - imageView.bounds.size.width,
                                                                         view.bounds.size.height)];
        textfield.tag = 1110 + i;
        textfield.delegate = self;
        textfield.backgroundColor = [UIColor clearColor];
        textfield.font = [UIFont systemFontOfSize:16];
        textfield.textColor = [UIColor whiteColor];
        //改变placeholder颜色
        UIColor *color = [UIColor colorWithRed:81/255.0 green:79/255.0 blue:84/255.0 alpha:0.7];
        textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text[i]
                                                                   attributes:@{NSForegroundColorAttributeName: color}];
        
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.secureTextEntry = YES;
        [view addSubview:textfield];
    }
    UIButton * button = [self drawButton:@"完成" rect:CGRectMake(15, top + 180 + 35, VIEW_WIDTH -30, 45) action:@selector(goFinish:)];
    [self.view addSubview:button];
    
}

#pragma textField

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.text length] == 0) {
        [textField resignFirstResponder];
    }
    else{
        if (textField.tag - 1110 < 2) {
            UITextField * nextTF = (UITextField *)[self.view viewWithTag:textField.tag + 1];
            [nextTF becomeFirstResponder];
        }
        else {
            [textField resignFirstResponder];
        }
    }
    return YES;
}


#pragma button

-(UIButton *)drawButton:(NSString *)title rect:(CGRect)frame action:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = frame;
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"大按钮背景"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}

//重置密码“完成“按钮
-(void)goFinish:(UITextField *)textField
{
    NSLog(@"finish");
    UITextField * newTF1 = (UITextField *)[self.view viewWithTag:1111];
    UITextField * newTF2 = (UITextField *)[self.view viewWithTag:1112];
    
    BOOL isEqual = [newTF1.text isEqualToString:newTF2.text];
    
    if (isEqual) {
        UIAlertView * succedAV = [[UIAlertView alloc] initWithTitle:nil message:@"重置成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        succedAV.delegate = self;
        [succedAV show];
        
    }
    else {
        UIAlertView * faildAV = [[UIAlertView alloc] initWithTitle:nil message:@"重置失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        faildAV.delegate = self;
        [faildAV show];
    }
    
}

//链接社交账号按钮
-(void)contactSocial
{
    NSLog(@"contact Baidu");
}

//转移历史按钮
-(void)showHistory
{
     NSLog(@"history");
}

//添加设备按钮
-(void)addNewEqu
{
    NSLog(@"add new Equi");
}



#pragma FTP photo
-(void)photoInput
{
    [self setTitle:@"FTP服务器" Frame:CGRectMake(0, top + 15, VIEW_WIDTH, 45) isOn:YES];
    
    UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(0, top + 61, VIEW_WIDTH, 45)];
    view.backgroundColor = [UIColor colorWithRed:44/255.0 green:34/255.0 blue:56/255.0 alpha:1.0];
//    view.image = [UIImage imageNamed:@"描边框"];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(view.bounds.origin.x + 15,
                                                                view.bounds.origin.y,
                                                                view.bounds.size.width,
                                                                view.bounds.size.height)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"服务器端口";
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(view.bounds.size.width - 65,
                                                                 view.bounds.origin.y,
                                                                 50, 50)];
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:17];
    label1.text = @"20000";
    label1.textColor = [UIColor whiteColor];
    [view addSubview:label1];
    
    [self.view addSubview:view];

    
    UIButton * button = [self drawButton:@"转移历史" rect:CGRectMake(0, top + 160, VIEW_WIDTH, 45) action:@selector(showHistory)];
    [self.view addSubview:button];
    
    CGRect textVFrame = CGRectMake(0, CGRectGetMaxY(button.frame) + 30, VIEW_WIDTH, 80);
    [self initTextView:@"FTP摄像机导入功能允许生产者导入数码单反相机的照片通过FTP" Frame:textVFrame];
    


}


#pragma equipment

-(void)checkEquipment
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, top + 15, VIEW_WIDTH, 200)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"没有设备匹配"];
    
    [self.view addSubview:imageView];
    
    UIButton * button = [self drawButton:@"添加新设备" rect:CGRectMake(0, top + 230, VIEW_WIDTH, 45) action:@selector(addNewEqu)];
    [self.view addSubview:button];
    
}


#pragma-

-(void)setTitle:(NSString *)title Frame:(CGRect)frame isOn:(BOOL)isOn
{
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor colorWithRed:44/255.0 green:34/255.0 blue:56/255.0 alpha:1.0];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(view.bounds.origin.x + 15,
                                                                view.bounds.origin.y,
                                                                view.bounds.size.width,
                                                                view.bounds.size.height)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:17];
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.userInteractionEnabled = YES;
    [view addSubview:label];
    
    UISwitch * swichBtn = [[UISwitch alloc] initWithFrame:CGRectMake(view.bounds.size.width - 60, 5, 45, 45)];
    swichBtn.on = isOn;
    [view addSubview:swichBtn];
    
    [self.view addSubview:view];

}


-(void)initTextView:(NSString *)text Frame:(CGRect)Tframe
{
    UITextView * textView = [[UITextView alloc] initWithFrame:Tframe];
    textView.backgroundColor = [UIColor clearColor];
    textView.userInteractionEnabled = NO;
    textView.textAlignment = NSTextAlignmentCenter;
    textView.font = [UIFont systemFontOfSize:14];
    textView.text = text;
    textView.textColor = [UIColor colorWithRed:107/255.0 green:102/255.0 blue:114/255.0 alpha:1.0];
    [self.view addSubview:textView];
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
