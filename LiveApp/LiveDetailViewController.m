//
//  LiveDetailViewController.m
//  LiveApp
//
//  Created by nichalos on 14-7-8.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveDetailViewController.h"
#import "LiveMovieViewController.h"
#import "DMCustomModalViewController.h"
#import "ModalRootViewController.h"
@interface LiveDetailViewController ()

@end

@implementation LiveDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithModel:(NSString *)title
{
    self = [super init];
    if (self) {
        titleStr = title;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    isShowBackBtn = YES;
    [self initPopTitileView:titleStr];
    UIScrollView *scroller  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64-63)];
    scroller.showsHorizontalScrollIndicator = NO;
    scroller.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:scroller];
    
    UIImageView *countView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 1116)];
    countView.image = [UIImage imageNamed:@"LiveShow01.jpg"];
    [scroller addSubview:countView];
    [scroller setContentSize:CGSizeMake(320, 1116)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.frame = CGRectMake(0, 310, VIEW_WIDTH, 180);
    [btn addTarget:self action:@selector(movieAction:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:btn];
    LiveMovieViewController *movieVC = [[LiveMovieViewController alloc] init];
    _modal = [[DMCustomModalViewController alloc]initWithRootViewController:movieVC
                                                       parentViewController:self];
    [self.modal setParentViewScaling:1];
    [self.modal setAnimationSpeed:.3];
    [self.modal setParentViewYPath:1];
    [self.modal setRootViewControllerHeight:560];
    [self.modal setDraggedRootViewAlphaValue:.8];
}

-(void)movieAction:(UIButton*)btn
{
    [self.modal setDelegate:self];
    [self.modal presentRootViewControllerWithPresentationStyle:DMCUstomModalViewControllerPresentFullScreen
                                          controllercompletion:^{
                                              
                                          }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Custom modal delegate
- (void)customModalViewControllerDidDismiss:(DMCustomModalViewController *)modalViewController
{
    LiveMovieViewController *movieVC = (LiveMovieViewController*)modalViewController.rootViewController;
    [movieVC.moviePlayer stop];
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
