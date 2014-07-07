//
//  LiveHomeViewController.h
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveSuperViewController.h"
#import "MenuHrizontal.h"
#import "ScrollPageView.h"

@interface LiveHomeViewController : LiveSuperViewController<MenuHrizontalDelegate,ScrollPageViewDelegate>
{
    MenuHrizontal *mMenuHriZontal;
    ScrollPageView *mScrollPageView;
}


@end
