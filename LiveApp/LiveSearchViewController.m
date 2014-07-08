//
//  LiveSearchViewController.m
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveSearchViewController.h"

@interface LiveSearchViewController ()

@end

@implementation LiveSearchViewController

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
	UISearchBar *mySearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, VIEW_WIDTH, 40)];
    if ([UISearchBar instancesRespondToSelector:@selector(setBarTintColor:)]) {
        mySearchBar.barTintColor = [UIColor clearColor];
        mySearchBar.backgroundImage = [UIImage imageNamed:@"main_background_phone"];//适配iOS7.1 clear后会显示黑色背景
    }else{
        [[[mySearchBar subviews] objectAtIndex:0] removeFromSuperview];
        mySearchBar.backgroundImage = [UIImage imageNamed:@"5.png"];
    }
//    UITextField *txfSearchField = [mySearchBar valueForKey:@"_searchField"];
//    CALayer *layer=[txfSearchField layer];
//    [layer setMasksToBounds:YES];
//    [layer setCornerRadius:ISIOS7?4:15];
//    [layer setBorderWidth:1];
//    [layer setBorderColor:[UIColor colorWithRed:61/255.0 green:126/255.0 blue:78/255.0 alpha:1].CGColor];
    [mySearchBar setSearchFieldBackgroundImage:nil forState:UIControlStateNormal];
    mySearchBar.barStyle = UISearchBarStyleProminent;
    mySearchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    mySearchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    mySearchBar.delegate = self;
    mySearchBar.showsCancelButton  = YES;
    mySearchBar.placeholder = [NSString stringWithFormat:@"%@",@"输入关键字"];
    [self.view addSubview:mySearchBar];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
