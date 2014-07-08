//
//  LiveSettingViewController.m
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveSettingViewController.h"
#import "LiveSettingDetailViewController.h"

@interface LiveSettingViewController ()

@end

@implementation LiveSettingViewController

@synthesize tableView = _tableView;
@synthesize dataArray = _dataArray;
CGFloat head = 64;
CGFloat foot = 63;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self prepareData];
    [self initTableView];
    [self LogOutBtn];
}

#pragma data

-(void)prepareData
{
    if (!_dataArray) {
         _dataArray = [NSArray arrayWithObjects:@"修改资料",@"更改密码",@"连接社交账号",@"保存路径",@"通知提示",@"FTP直播输入",@"直播秀设备",@"远程摄像", nil];
    }
}



#pragma tableView

-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, head + (_dataArray.count * 45)) style:UITableViewStylePlain];
    [_tableView setScrollEnabled:NO];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
//    //适配ios7 cell分割线不到头的问题
//    if ([UITableView instancesRespondToSelector:@selector(setSeparatorInset:)]) {
//        
//        [_tableView setSeparatorInset:UIEdgeInsetsZero];
//        
//    }
    
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"reuse";
    
    __autoreleasing UITableViewCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    if (cell == NULL)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellStyleDefault;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"press %d",indexPath.row);
    
    LiveSettingDetailViewController * nextVC = [[LiveSettingDetailViewController alloc] init];
    nextVC.touchIndex = indexPath.row;
    [self.navigationController pushViewController:nextVC animated:YES];
    
}


#pragma log out

-(void)LogOutBtn
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor purpleColor];
    button.frame = CGRectMake(_tableView.frame.origin.x, head + _dataArray.count * 45 + 20, _tableView.frame.size.width, 40);
    [button addTarget:self action:@selector(LogOut:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"退出登录" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"大按钮背景"] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
}

-(void)LogOut:(UIButton *)button
{
    NSLog(@"log out");
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
