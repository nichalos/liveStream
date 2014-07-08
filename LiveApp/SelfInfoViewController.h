//
//  SelfInfoViewController.h
//  LiveApp
//
//  Created by 夏宝梦 on 14-7-7.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "LiveSuperViewController.h"

@interface SelfInfoViewController : UIViewController<UITextFieldDelegate>



@property (nonatomic,strong) UITextField *nameTF;
@property (nonatomic,strong) UITextField *mailTF;
@property (nonatomic,strong) UITextField *sexTF;
@property (nonatomic,strong) UITextField *tagTF;
@property (nonatomic,strong) UITextField *birthTF;
@property (nonatomic,strong) UITextField *detailTF;



@end
