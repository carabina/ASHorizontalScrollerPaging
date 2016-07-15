//
//  ASViewController.m
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/14/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import "ASViewController.h"

#define HIEGHT 450

@interface ASViewController ()

@end

@implementation ASViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.title = @"ASHorizontalScrollerPaging";
    
    // self.items = [[ASItem getInstance] items];
    self.colors = [[ASItem getInstance] colors];
    
    _scroller = [[ASHorizontalScroller alloc] initWithFrame:CGRectMake(VIEWS_OFFSET, VIEW_PADDING_DEFAULT, self.view.frame.size.width, HIEGHT)];
    _scroller.dataSource = self;
    _scroller.delegate = self;
    _scroller.scrollWidth = self.view.frame.size.width;
    [self.view addSubview:_scroller];
    
    _pageControl = [[DDPageControl alloc] init];
    [_pageControl setCenter:CGPointMake(self.view.center.x, HIEGHT - 50)];
    [_pageControl setNumberOfPages:self.colors.count]; // self.images.count
    [_pageControl setCurrentPage:0];
    [_pageControl setDefersCurrentPageDisplay:YES];
    [_pageControl setType:DDPageControlTypeOnFullOffFull];
    [_pageControl setOffColor:RGBA(80, 210, 235, 1)];
    [_pageControl setOnColor:RGBA(1, 171, 216, 1)];
    [_pageControl setIndicatorDiameter:12.0f];
    [_pageControl setIndicatorSpace:12.0f];
    [self.view addSubview:_pageControl];
}

#pragma mark - KCHorizontalScrollerDelegate

- (void)horizontalScrollerDidScrollView:(float)fractional {
    
    NSInteger nearestNumber = lround(fractional);
    
    if (_pageControl.currentPage != nearestNumber) {
        _pageControl.currentPage = nearestNumber;
        
        // if we are dragging, we want to update the page control directly during
        // the drag
        [_pageControl updateCurrentPageDisplay];
    }
}

- (void)horizontalScroller:(ASHorizontalScroller *)scroller tapViewAtIndex:(int)index {
    
    NSLog(@"index %d", index);
}

#pragma mark - KCHorizontalScrollerDataSource

- (NSInteger)numberOfViewsForHorizontalScroller:(ASHorizontalScroller *)scroller {
   
    // return self.items.count;
    return self.colors.count;
}

- (UIView *)horizontalScroller:(ASHorizontalScroller *)scroller viewAtIndex:(int)index {
   
    //    ASItem *item = [self.items objectAtIndex:index];
    //    return [[ASContentView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,self.view.frame.size.width, _scroller.frame.size.height) item:item];
    
    UIColor *color = [self.colors objectAtIndex:index];
    return [[ASContentView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width,300) withColor:color andIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
