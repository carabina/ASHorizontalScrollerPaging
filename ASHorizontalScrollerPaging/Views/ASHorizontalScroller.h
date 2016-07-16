//
//  ASHorizontalScroller.h
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/20/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Custom.h"

@class ASHorizontalScroller ;
@protocol ASHorizontalScrollerDataSource <NSObject>

@required
// ask the delegate how many views he wants to present inside the horizontal scroller
- (NSInteger)numberOfViewsForHorizontalScroller:(ASHorizontalScroller*)scroller;

// ask the delegate to return the view that should appear at <index>
- (UIView*)horizontalScroller:(ASHorizontalScroller*)scroller viewAtIndex:(int)index;

@end

@protocol ASHorizontalScrollerDelegate <NSObject>

@required
// inform the delegate what the view at <index> has been tapped
- (void)horizontalScroller:(ASHorizontalScroller*)scroller tapViewAtIndex:(int)index;

@optional
// ask the delegate for the index of the initial view to display. this method is optional
// and defaults to 0 if it's not implemented by the delegate
- (NSInteger)initialViewIndexForHorizontalScroller:(ASHorizontalScroller*)scroller;

- (void)horizontalScrollerDidScrollView:(float)fractional ;

@end

@interface ASHorizontalScroller : UIView

@property (nonatomic, assign) float scrollWidth;
@property (nonatomic, assign) float scrollHeight;
@property (nonatomic, weak) id <ASHorizontalScrollerDataSource> dataSource ;
@property (nonatomic, weak) id <ASHorizontalScrollerDelegate> delegate;

- (void)reload;

@end
