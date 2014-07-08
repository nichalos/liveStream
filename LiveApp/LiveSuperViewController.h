//
//  LiveSuperViewController.h
//  LiveApp
//
//  Created by nichalos on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveSuperViewController : UIViewController
{
    BOOL isShowBackBtn;
}


-(void)initPopTitileView:(NSString *)title;
- (void)backAction:(UIButton*)backBtn;
@end
