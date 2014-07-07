//
//  ScrollPageView.h
//  ShowProduct
//
//  Created by lin on 14-5-23.
//  Copyright (c) 2014年 @"". All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ScrollPageViewDelegate <NSObject>

-(void)didScrollPageViewChangedPage:(NSInteger)aPage;
-(void)didSelectCollectionViewCell:(NSInteger)index;
@end

@interface ScrollPageView : UIView<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger mCurrentPage;
    BOOL mNeedUseDelegate;
}
@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray *contentItems;

@property (nonatomic,weak) id<ScrollPageViewDelegate> delegate;

@property (nonatomic,strong) UICollectionView *myCollectionView;

#pragma mark 添加ScrollowViewd的ContentView
-(void)setContentOfTables:(NSInteger)aNumerOfTables;
#pragma mark 滑动到某个页面
-(void)moveScrollowViewAthIndex:(NSInteger)aIndex;
#pragma mark 刷新某个页面
-(void)freshContentTableAtIndex:(NSInteger)aIndex;
@end
