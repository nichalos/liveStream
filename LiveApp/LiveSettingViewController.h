//
//  LiveSettingViewController.h
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveSuperViewController.h"
@interface LiveSettingViewController : LiveSuperViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;

@end
