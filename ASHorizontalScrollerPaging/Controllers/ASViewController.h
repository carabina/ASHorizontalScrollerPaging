//
//  ASViewController.h
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/14/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASHorizontalScroller.h"
#import "DDPageControl.h"
#import "ASItem.h"
#import "ASContentView.h"

@interface ASViewController : UIViewController <ASHorizontalScrollerDataSource,ASHorizontalScrollerDelegate>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) DDPageControl *pageControl;
@property (nonatomic, strong) ASHorizontalScroller *scroller;

@end
