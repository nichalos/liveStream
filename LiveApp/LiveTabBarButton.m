//
//  LiveTabBarButton.m
//  LiveApp
//
//  Created by nichalos on 14-7-4.
//  Copyright (c) 2014年 nichalos. All rights reserved.
//

#import "LiveTabBarButton.h"

@implementation LiveTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-30)/2, (frame.size.height-30)/2, 30, 30)];
        self.icon.backgroundColor = [UIColor clearColor];
        [self addSubview:_icon];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
