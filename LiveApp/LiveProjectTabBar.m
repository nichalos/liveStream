//
//  LiveProjectTabBar.m
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveProjectTabBar.h"
#import "LiveLoginViewController.h"
#define BUTTON_TAG 26
@interface LiveProjectTabBar ()

@end

@implementation LiveProjectTabBar

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
    self.view.backgroundColor = [UIColor whiteColor];
	LiveHomeViewController *homeVC = [[LiveHomeViewController alloc] initWithNibName:Nil bundle:Nil];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:0];
    homeVC.tabBarItem = homeItem;
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    LiveSearchViewController *preVC = [[LiveSearchViewController alloc] initWithNibName:nil bundle:nil];
    UITabBarItem *previewItem = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"search"] image:nil tag:1];
    preVC.tabBarItem = previewItem;
    UINavigationController *preNav = [[UINavigationController alloc] initWithRootViewController:preVC];
    
    LivePersionViewController *persVC = [[LivePersionViewController alloc] initWithNibName:Nil bundle:Nil];
    UITabBarItem *persitem = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"persion"] image:nil tag:2];
    persVC.tabBarItem = persitem;
    UINavigationController *persNav = [[UINavigationController alloc] initWithRootViewController:persVC];
    
    LiveSettingViewController *moreVC = [[LiveSettingViewController alloc] initWithNibName:Nil bundle:Nil];
    UITabBarItem *moreItem = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"more"] image:nil tag:3];
    moreVC.tabBarItem = moreItem;
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:moreVC];
    
    self.viewControllers = [NSArray arrayWithObjects:homeNav, preNav,persNav,moreNav, nil];
    [self.tabBar setHidden:YES];
    [self initTabBar];
}

- (void)initTabBar
{
    sideBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT-63, VIEW_WIDTH, 63)];
    sideBar.userInteractionEnabled = YES;
    sideBar.image = [UIImage imageNamed:@"功能条背景"];
    [self.view addSubview:sideBar];

    sideBarItemBackgroundImg = [NSArray arrayWithObjects:@"主页（未点击）",@"搜索（未点击）",@"摄像按钮（未点击）",@"用户（未点击）",@"设置（未点击）", nil];
    sideBarItemSelectBackground = [NSArray arrayWithObjects:@"主页（点击）",@"搜索（点击）",@"摄像按钮（点击）",@"用户（点击）",@"设置（点击）", nil];
    CGFloat width = 67;
    for (int i = 0; i<5; i++) {
        CGRect fram;
        if (i == 2) {
            fram = CGRectMake((VIEW_WIDTH-50)/2, 2, 50, 50);
        }else if(i < 2){
            fram = CGRectMake(width*i, 17, 67, 46);
        }else{
            fram = CGRectMake(width*(i-1)+50+2, 17, 67, 46);
        }
        
        LiveTabBarButton *button = [[LiveTabBarButton alloc]initWithFrame:fram];
        
        button.icon.image = [UIImage imageNamed:[sideBarItemBackgroundImg objectAtIndex:i]];
        button.tag = BUTTON_TAG+i;
        if (i == 2) {
            button.icon.frame = CGRectMake(0, 2, fram.size.width, fram.size.height);
        }
        [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        [sideBar addSubview:button];
    }
    selectBtn = (LiveTabBarButton*)[sideBar viewWithTag:BUTTON_TAG];
    [self selectButton:selectBtn];
}

- (void)selectButton:(LiveTabBarButton *)button
{
    int tag = button.tag-BUTTON_TAG;
    if (tag == 2) {
        [self startCamare];
    }else{
        if (button.tag != selectBtn.tag) {
            selectBtn.icon.image = [UIImage imageNamed:[sideBarItemBackgroundImg objectAtIndex:(selectBtn.tag-BUTTON_TAG)]];
        }
        button.icon.image =[UIImage imageNamed:[sideBarItemSelectBackground objectAtIndex:(button.tag-BUTTON_TAG)]];
        selectBtn = button;
        if (tag<2) {
            [self setSelectedIndex:button.tag-BUTTON_TAG];
        }else{
            [self setSelectedIndex:button.tag-BUTTON_TAG-1];
        }
        
    }
}
- (void)startCamare
{
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        )
        return;
    UIImagePickerController* pickerView = [[UIImagePickerController alloc] init];
    pickerView.sourceType = UIImagePickerControllerSourceTypeCamera;
    NSArray* availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    pickerView.mediaTypes = availableMedia;
    
    pickerView.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor redColor];
//    button.frame = CGRectMake(50, 50, 50, 50);
//    [button addTarget:self action:@selector(addphoto) forControlEvents:UIControlEventTouchUpInside];
//    [pickerView.view addSubview:button];
    pickerView.allowsEditing = YES;
    pickerView.videoMaximumDuration = 30;
    pickerView.delegate = self;
    [self.selectedViewController presentViewController:pickerView animated:YES completion:^{}];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.selectedViewController dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.selectedViewController dismissViewControllerAnimated:YES completion:^{}];
}

@end
