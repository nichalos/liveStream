//
//  LivePersionViewController.m
//  LiveApp
//
//  Created by Artron on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LivePersionViewController.h"


#import "CollectionCell.h"
#import "SelfInfoViewController.h"

@interface LivePersionViewController ()

@end

@implementation LivePersionViewController

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
    
    
    [self creatUpView];
    
}

-(void)creatUpView
{
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 203)];
    bgImageView.image = [UIImage imageNamed:@"用户本人给人资料背景.png"];
    [self.view addSubview:bgImageView];
    
    UIButton * editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    editBtn.frame = CGRectMake(0, CGRectGetMinY(bgImageView.frame) + 30, 33, 33);
    [editBtn addTarget:self action:@selector(editSelfFiles) forControlEvents:UIControlEventTouchUpInside];
    [editBtn setImage:[UIImage imageNamed:@"编辑资料图标.png"] forState:UIControlStateNormal];
    [self.view addSubview:editBtn];
    
    UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2 - 44, CGRectGetMinY(editBtn.frame), 88, 88)];
    headImage.image = [UIImage imageNamed:@"185-185个人资料内头像.png"];
    [self.view addSubview:headImage];
    
    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(VIEW_WIDTH - 40, CGRectGetMinY(editBtn.frame), 33, 33);
    [shareBtn addTarget:self action:@selector(shareBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setImage:[UIImage imageNamed:@"个人资料内分享图标png.png"] forState:UIControlStateNormal];
    [self.view addSubview:shareBtn];
    
    UILabel * userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headImage.frame)+2, VIEW_WIDTH, 25)];
    userNameLabel.text = @"猫咪";///////////////////////////////////
    userNameLabel.textColor = [UIColor whiteColor];
    userNameLabel.textAlignment = NSTextAlignmentCenter;
    userNameLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:userNameLabel];
    
    UILabel * insterestLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, CGRectGetMaxY(userNameLabel.frame)+1, 35, 20)];
    insterestLabel.text = @"关注";
    insterestLabel.textColor = [UIColor whiteColor];
    insterestLabel.textAlignment = NSTextAlignmentCenter;
    insterestLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:insterestLabel];
    
    UILabel * insterestNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(insterestLabel.frame)+3, CGRectGetMaxY(userNameLabel.frame)+1, 40, 20)];
    insterestNumLabel.text = @"899";/////////////////////////////
    insterestNumLabel.textColor = [UIColor whiteColor];
    insterestNumLabel.textAlignment = NSTextAlignmentCenter;
    insterestNumLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:insterestNumLabel];
    
    UIImageView * lineView = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2-2, CGRectGetMinY(insterestNumLabel.frame) +3, 2, CGRectGetHeight(insterestNumLabel.frame) - 5)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lineView];
    
    UILabel * fanLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lineView.frame) +4, CGRectGetMinY(insterestNumLabel.frame), 35, 20)];
    fanLabel.text = @"粉丝";
    fanLabel.textColor = [UIColor whiteColor];
    fanLabel.textAlignment = NSTextAlignmentCenter;
    fanLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:fanLabel];
    
    UILabel * fanNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(fanLabel.frame)+3, CGRectGetMinY(insterestNumLabel.frame)+1, 40, 20)];
    fanNumLabel.text = @"456";/////////////////////////////
    fanNumLabel.textColor = [UIColor whiteColor];
    fanNumLabel.textAlignment = NSTextAlignmentCenter;
    fanNumLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:fanNumLabel];
    
    self.yourLiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _yourLiveBtn.frame = CGRectMake(50, CGRectGetMaxY(bgImageView.frame) + 10, 112, 45);
    [_yourLiveBtn setTitle:@"你的直播" forState:UIControlStateNormal];
    _yourLiveBtn.tag = 101;
    _yourLiveBtn.titleLabel.textColor = [UIColor redColor];
    [_yourLiveBtn setBackgroundImage:[UIImage imageNamed:@"选择秀友按钮颜色.png"] forState:UIControlStateSelected];
    [_yourLiveBtn addTarget:self action:@selector(buttonDidSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_yourLiveBtn];
    
    
    self.yourDraftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _yourDraftBtn.frame = CGRectMake(VIEW_WIDTH/2, CGRectGetMaxY(bgImageView.frame) + 10, 112, 45);
    [_yourDraftBtn setTitle:@"草稿" forState:UIControlStateNormal];
    _yourDraftBtn.tag = 102;
    _yourDraftBtn.titleLabel.textColor = [UIColor redColor];
    [_yourDraftBtn setBackgroundImage:[UIImage imageNamed:@"选择秀友按钮颜色.png"] forState:UIControlStateSelected];
    [_yourDraftBtn addTarget:self action:@selector(buttonDidSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_yourDraftBtn];
    
    
    [self addLiveVideosView];
    [self buttonDidSelect:self.yourLiveBtn];
    
}

-(void)addLiveVideosView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.liveVideosView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.yourLiveBtn.frame) + 10, VIEW_WIDTH, 245) collectionViewLayout:layout];
    [self.liveVideosView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"cell"];
    _liveVideosView.tag = 50;
    _liveVideosView.backgroundColor = [UIColor clearColor];
    _liveVideosView.showsVerticalScrollIndicator = NO;
    _liveVideosView.delegate = self;
    _liveVideosView.dataSource = self;
    
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"cell";
    CollectionCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell sizeToFit];
    
    if (!cell) {
        cell = [[CollectionCell alloc]initWithFrame:CGRectMake(0, 0, 150, 120)];
    }

    
    cell.backgroundColor = [UIColor redColor];

    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 120);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 5, 2, 5);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


//编辑个人资料
-(void)editSelfFiles
{
    SelfInfoViewController * editInfoVC = [[SelfInfoViewController alloc]init];    
    [self.navigationController  pushViewController:editInfoVC animated:YES];
    
}
//分享按钮点击事件
-(void)shareBtnClicked
{
    
}

//点击按钮切换
-(void)buttonDidSelect:(UIButton *)sender
{
    UIButton *button = (UIButton *)sender;
    for (int i = 50; i <= 51; i ++)
    {
        UIView * view = [self.view viewWithTag:i];
        if (view)
        {
            [view removeFromSuperview];
        }
    }
    [_yourLiveBtn setSelected:NO];
    [_yourDraftBtn setSelected:NO];
    [button setSelected:YES];
    
    switch (button.tag - 101) {
        case 0:
            //点击“你的直播"按钮
        {
            [self.view addSubview:_liveVideosView];
        }
            break;
        case 1:
            //点击“草稿”按钮
        {
//            [self.view addSubview:newsReportTableView];
        }
            break;
            
        default:
            break;
    }

    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end









