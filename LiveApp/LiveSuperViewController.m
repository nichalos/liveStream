//
//  LiveSuperViewController.m
//  LiveApp
//
//  Created by nichalos on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveSuperViewController.h"

@interface LiveSuperViewController ()

@end

@implementation LiveSuperViewController

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
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.hidden = YES;
    [self setBackgroundImg];
    [self initPopTitileView:@"直播秀"];
}

- (void)setBackgroundImg
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"整体暗色大背景"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
}

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
