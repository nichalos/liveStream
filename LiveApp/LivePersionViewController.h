//
//  LivePersionViewController.h
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveSuperViewController.h"

@interface LivePersionViewController : LiveSuperViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>



@property(strong,nonatomic)  UIButton * yourLiveBtn;
@property(strong,nonatomic)  UIButton * yourDraftBtn;
@property(strong,nonatomic)  UICollectionView * liveVideosView;

@end
