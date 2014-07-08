//
//  LiveMovieViewController.h
//  LiveApp
//
//  Created by nichalos on 14-7-8.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALMoviePlayerController.h"

@interface LiveMovieViewController : UIViewController<ALMoviePlayerControllerDelegate>

@property (nonatomic, strong) ALMoviePlayerController *moviePlayer;
@property (nonatomic) CGRect defaultFrame;
@end
