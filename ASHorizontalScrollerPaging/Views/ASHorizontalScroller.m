//
//  ASHorizontalScroller.m
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/20/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import "ASHorizontalScroller.h"

@interface ASHorizontalScroller () <UIScrollViewDelegate>
{
    UIScrollView *scroller;
}
@end

@implementation ASHorizontalScroller

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(VIEWS_OFFSET, VIEW_PADDING_DEFAULT, frame.size.width, 450)];
        scroller.showsHorizontalScrollIndicator = NO ;
        scroller.delegate = self;
        [scroller setPagingEnabled:YES];
        [self addSubview:scroller];
        
        UITapGestureRecognizer *tapGuesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollerIsTapped:)];
        [scroller addGestureRecognizer:tapGuesture];
    }
    return self;
}

- (void)scrollerIsTapped:(UITapGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:gesture.view];
    
    // Enumerate only all subviews we added
    for (int index = 0; index < [self.dataSource numberOfViewsForHorizontalScroller:self]; index++)
    {
        UIView *view = scroller.subviews[index];
        
        if (CGRectContainsPoint(view.frame, location))
        {
            [self.delegate horizontalScroller:self tapViewAtIndex:index];
            
            break;
        }
    }
}

- (void)reload
{
    if (self.dataSource == nil)
        return;
    
    [scroller.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    
    //the starting point of the views inside the scroller
    CGFloat startValue = VIEWS_OFFSET;
    for (int i = 0; i < [self.dataSource numberOfViewsForHorizontalScroller:self]; i++)
    {
        // 4 - add a view at the right position
        startValue += VIEW_PADDING_DEFAULT;
        UIView *view = [self.dataSource horizontalScroller:self viewAtIndex:i];
        view.frame = CGRectMake(startValue, VIEW_PADDING_DEFAULT, self.scrollWidth, self.scrollWidth);
        [scroller addSubview:view];
        startValue += self.scrollWidth + VIEW_PADDING_DEFAULT;
    }
    
    [scroller setContentSize:CGSizeMake(startValue + VIEWS_OFFSET, self.frame.size.height)];
}

- (void)didMoveToSuperview
{
    [self reload];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    CGFloat pageWidth = scroller.bounds.size.width ;
    float fractionalPage = scroller.contentOffset.x / pageWidth ;
    [self.delegate horizontalScrollerDidScrollView:fractionalPage];
}


@end
