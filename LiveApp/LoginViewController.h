//
//  LoginViewController.h
//  LiveApp
//
//  Created by nichalos on 14-7-5.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    UITextField* userNameField;
    UITextField* passWordField;
}

@end
