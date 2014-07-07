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
@synthesize backgroundView = _backgroundView;
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
    _backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, top, VIEW_WIDTH, VIEW_HEIGHT - top - bottom)];
    _backgroundView.userInteractionEnabled = YES;
    _backgroundView.backgroundColor = [UIColor clearColor];
    _backgroundView.image = [UIImage imageNamed:@"整体暗色大背景"];
    [self.view addSubview:_backgroundView];
    
    switch (self.touchIndex) {
        case 0:
        {
            self.title = @"修改资料";
        }
            break;
        case 1:
        {
            self.title = @"更改密码";
            [self changePassWord];
        }
            break;
        case 2:
        {
            self.title = @"连接社交账号";
            UIButton * button = [self drawButton:@"链接百度账号" rect:CGRectMake(15, 25, VIEW_WIDTH - 30, 45) action:@selector(contactSocial)];
            [_backgroundView addSubview:button];
        }
            break;
        case 3:
        {
            self.title = @"保存路径";
            CGRect frame = CGRectMake(0, 15, VIEW_WIDTH, 45);
            CGRect textVFrame = CGRectMake(30, CGRectGetMaxY(frame) + 30, VIEW_WIDTH - 60, 80);
            [self setTitle:@"保存视频到图库" Frame:frame isOn:YES];
            [self initTextView:@"启用此设置保存任何照片和视频到你的设备媒体库" Frame:textVFrame];
            
        }
            break;
        case 4:
        {
            self.title = @"通知提示";
            CGRect frame = CGRectMake(0, 15, VIEW_WIDTH, 45);
            CGRect textVFrame = CGRectMake(30, CGRectGetMaxY(frame) + 30, VIEW_WIDTH - 60, 80);
            [self setTitle:@"自动通知" Frame:frame isOn:NO];
            [self initTextView:@"当启用时，现场会自动发出通知所有的关注的人，对你做一个事件的实时视频广播" Frame:textVFrame];
            
        }
            break;
        case 5:
        {
            self.title = @"FTP相机输入";
            [self photoInput];
        }
            break;
        case 6:
        {
            self.title = @"直播秀设备";
            [self checkEquipment];
        }
            break;
        case 7:
        {
            self.title = @"远程摄像";
            CGRect frame = CGRectMake(0, 15, VIEW_WIDTH, 45);
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
    self.title = @"更改密码";
    
    NSArray * text = @[@"原始密码",@"输入新密码",@"再次输入新密码"];
    
    for (int i = 0; i < 3; i++)
    {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(15, (45 + 15) * i + 15  , VIEW_WIDTH - 30, 45)];
        view.backgroundColor = [UIColor clearColor];
        view.image = [UIImage imageNamed:@"描边框"];
        view.userInteractionEnabled = YES;
        view.tag = 1100 + i;
        [_backgroundView addSubview:view];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(view.bounds.origin.x, view.bounds.origin.y, 45, 45)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:@"更改密码钥匙图标"];
        
        [view addSubview:imageView];
        
        UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(view.bounds.origin.x + imageView.bounds.size.width, view.bounds.origin.y , view.bounds.size.width - imageView.bounds.size.width, view.bounds.size.height)];
        tf.tag = 1110 + i;
        tf.delegate = self;
        tf.backgroundColor = [UIColor clearColor];
        tf.font = [UIFont systemFontOfSize:16];
        tf.textColor = [UIColor whiteColor];
        tf.placeholder = text[i];
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        tf.secureTextEntry = YES;
        [view addSubview:tf];
    }
    UIButton * button = [self drawButton:@"完成" rect:CGRectMake(15, 180 + 35, VIEW_WIDTH -30, 45) action:@selector(goFinish:)];
    [_backgroundView addSubview:button];
    
}

#pragma textField

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma button

-(UIButton *)drawButton:(NSString *)title rect:(CGRect)frame action:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor purpleColor];
    button.frame = frame;
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"描边框"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}

-(void)goFinish:(UITextField *)textField
{
    NSLog(@"finish");
}

-(void)contactSocial
{
    NSLog(@"contact Baidu");
}

-(void)showHistory
{
     NSLog(@"history");
}

-(void)addNewEqu
{
    NSLog(@"add new Equi");
}



#pragma FTP photo
-(void)photoInput
{
    [self setTitle:@"FTP服务器" Frame:CGRectMake(0, 15, VIEW_WIDTH, 45) isOn:YES];
    
    UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 61, VIEW_WIDTH, 45)];
    view.backgroundColor = [UIColor clearColor];
    view.image = [UIImage imageNamed:@"描边框"];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(view.bounds.origin.x + 15, view.bounds.origin.y, view.bounds.size.width, view.bounds.size.height)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"服务器端口";
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(view.bounds.size.width - 60, view.bounds.origin.y, 45, 45)];
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:17];
    label1.text = @"2000";
    label1.textColor = [UIColor whiteColor];
    [view addSubview:label1];
    
    [_backgroundView addSubview:view];

    
    UIButton * button = [self drawButton:@"转移历史" rect:CGRectMake(0, 160, VIEW_WIDTH, 45) action:@selector(showHistory)];
    [_backgroundView addSubview:button];
    
    CGRect textVFrame = CGRectMake(0, CGRectGetMaxY(button.frame) + 30, VIEW_WIDTH, 80);
    [self initTextView:@"FTP摄像机导入功能允许生产者导入数码单反相机的照片通过FTP" Frame:textVFrame];
    


}


#pragma equipment

-(void)checkEquipment
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, VIEW_WIDTH, 200)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"没有设备匹配"];
    
    [_backgroundView addSubview:imageView];
    
    UIButton * button = [self drawButton:@"添加新设备" rect:CGRectMake(0, 230, VIEW_WIDTH, 45) action:@selector(addNewEqu)];
    [_backgroundView addSubview:button];
    
}


#pragma-

-(void)setTitle:(NSString *)title Frame:(CGRect)frame isOn:(BOOL)isOn
{
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(view.bounds.origin.x + 15, view.bounds.origin.y, view.bounds.size.width, view.bounds.size.height)];
    label.backgroundColor = [UIColor purpleColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:17];
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.userInteractionEnabled = YES;
    [view addSubview:label];
    
    UISwitch * swichBtn = [[UISwitch alloc] initWithFrame:CGRectMake(view.bounds.size.width - 60, 5, 45, 45)];
    swichBtn.on = isOn;
    [view addSubview:swichBtn];
    
    [_backgroundView addSubview:view];

}


-(void)initTextView:(NSString *)text Frame:(CGRect)Tframe
{
    UITextView * textView = [[UITextView alloc] initWithFrame:Tframe];
    textView.backgroundColor = [UIColor yellowColor];
    textView.userInteractionEnabled = NO;
    textView.textAlignment = NSTextAlignmentCenter;
    textView.font = [UIFont systemFontOfSize:14];
    textView.text = text;
    [_backgroundView addSubview:textView];
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
