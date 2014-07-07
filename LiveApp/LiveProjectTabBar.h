//
//  LiveProjectTabBar.h
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveTabBarButton.h"
@interface LiveProjectTabBar : UITabBarController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *sideBar;
    LiveTabBarButton *selectBtn;
    NSArray *sideBarItemBackgroundImg;
    NSArray *sideBarItemSelectBackground;
}

@end
