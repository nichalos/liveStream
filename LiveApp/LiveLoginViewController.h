//
//  LiveLoginViewController.h
//  LiveApp
//
//  Created by nichalos on 14-7-5.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LiveLoginDelegate;

@interface LiveLoginViewController : UIViewController


@property(weak, nonatomic) id<LiveLoginDelegate> delegate;
@end

@protocol LiveLoginDelegate <NSObject>

-(void)loginSuccess;

@end