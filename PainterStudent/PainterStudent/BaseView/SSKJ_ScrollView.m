//
//  SSKJ_ScrollView.m
//  SSKJ
//
//  Created by 姚立志 on 2020/8/11.
//  Copyright © 2020 刘小雨. All rights reserved.
//

#import "SSKJ_ScrollView.h"

@implementation SSKJ_ScrollView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setPagingEnabled:YES];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        
        
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return self;
}



- (void)scrollToBottomAnimated:(BOOL)animated
{
     CGPoint bottomOffset = CGPointMake(0, self.contentSize.height - self.bounds.size.height);
     [self setContentOffset:bottomOffset animated:animated];
}







@end
