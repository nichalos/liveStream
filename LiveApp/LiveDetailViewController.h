//
//  LiveDetailViewController.h
//  LiveApp
//
//  Created by nichalos on 14-7-8.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveSuperViewController.h"
#import "DMCustomModalViewController.h"
@interface LiveDetailViewController : LiveSuperViewController<DMCustomViewControllerDelegate>
{
    NSString *titleStr;
}
@property (nonatomic, strong) DMCustomModalViewController *modal;
- (id)initWithModel:(NSString*)title;
@end
