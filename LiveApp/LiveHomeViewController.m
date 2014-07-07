//
//  LiveHomeViewController.m
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveHomeViewController.h"
#import "DetailViewController.h"
#define MENUHEIHT 40

@interface LiveHomeViewController ()

@end

@implementation LiveHomeViewController

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
	[self commInit];
}
#pragma mark UI初始化
-(void)commInit{
    NSArray *vButtonItemArray = @[@{NOMALKEY: @"",
                                    HEIGHTKEY:@"",
                                    TITLEKEY:@"精彩回顾",
                                    TITLEWIDTH:[NSNumber numberWithFloat:120]
                                    },
                                  @{NOMALKEY: @"",
                                    HEIGHTKEY:@"",
                                    TITLEKEY:@"现场直播",
                                    TITLEWIDTH:[NSNumber numberWithFloat:160]
                                    },
                                  @{NOMALKEY: @"",
                                    HEIGHTKEY:@"",
                                    TITLEKEY:@"即将直播",
                                    TITLEWIDTH:[NSNumber numberWithFloat:120]
                                    },
                                  ];
    
    if (mMenuHriZontal == nil) {
        mMenuHriZontal = [[MenuHrizontal alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, MENUHEIHT) ButtonItems:vButtonItemArray];
        mMenuHriZontal.delegate = self;
    }
    //初始化滑动列表
    if (mScrollPageView == nil) {
        mScrollPageView = [[ScrollPageView alloc] initWithFrame:CGRectMake(0, MENUHEIHT+65, VIEW_WIDTH, VIEW_HEIGHT - MENUHEIHT)];
        mScrollPageView.delegate = self;
    }
    [mScrollPageView setContentOfTables:vButtonItemArray.count];
    //默认选中第一个button
    [mMenuHriZontal clickButtonAtIndex:1];
    //-------
    [self.view addSubview:mScrollPageView];
    [self.view addSubview:mMenuHriZontal];
}

#pragma mark - 其他辅助功能
#pragma mark MenuHrizontalDelegate
-(void)didMenuHrizontalClickedButtonAtIndex:(NSInteger)aIndex{
    NSLog(@"第%d个Button点击了",aIndex);
    [mScrollPageView moveScrollowViewAthIndex:aIndex];
}

#pragma mark ScrollPageViewDelegate
-(void)didScrollPageViewChangedPage:(NSInteger)aPage{
    NSLog(@"CurrentPage:%d",aPage);
    [mMenuHriZontal changeButtonStateAtIndex:aPage];
    [mScrollPageView freshContentTableAtIndex:aPage];
    
}

- (void)didSelectCollectionViewCell:(NSInteger)index
{
    NSString *imageNameToLoad = [NSString stringWithFormat:@"%d_full", index];
    NSString *pathToImage = [[NSBundle mainBundle] pathForResource:imageNameToLoad ofType:@"JPG"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:pathToImage];
    DetailViewController *detailVC = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.image = image;
//    detailVC.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
