//
//  ASViewController.m
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/14/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import "ASViewController.h"

@interface ASViewController ()

@property (nonatomic, assign) float viewHeight;

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
    
    self.items = [[ASItem getInstance] items];
    self.colors = [[ASItem getInstance] colors];
    
    //set ScrollView Height
    _viewHeight = self.view.height * 0.6;
    
    _scroller = [[ASHorizontalScroller alloc] initWithFrame:CGRectMake(VIEWS_OFFSET, VIEW_PADDING_DEFAULT, self.view.width, _viewHeight)];
    _scroller.dataSource = self;
    _scroller.delegate = self;
    _scroller.scrollWidth = self.view.frame.size.width;
    _scroller.scrollHeight = _viewHeight;
    [self.view addSubview:_scroller];
    
    _pageControl = [[DDPageControl alloc] init];
    [_pageControl setCenter:CGPointMake(self.view.center.x, _scroller.y + _viewHeight + 20)];
    [_pageControl setNumberOfPages:self.items.count]; // self.colors.count
    [_pageControl setCurrentPage:0];
    [_pageControl setDefersCurrentPageDisplay:YES];
    [_pageControl setType:DDPageControlTypeOnFullOffFull];
    [_pageControl setOffColor:RGBA(80, 210, 235, 1)];
    [_pageControl setOnColor:RGBA(1, 171, 216, 1)];
    [_pageControl setIndicatorDiameter:10.0f];
    [_pageControl setIndicatorSpace:10.0f];
    [self.view addSubview:_pageControl];
}

#pragma mark - ASHorizontalScrollerDelegate

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

#pragma mark - ASHorizontalScrollerDataSource

- (NSInteger)numberOfViewsForHorizontalScroller:(ASHorizontalScroller *)scroller {
    
    return self.items.count;
    //return self.colors.count;
}

- (UIView *)horizontalScroller:(ASHorizontalScroller *)scroller viewAtIndex:(int)index {
    
    ASItem *item = self.items[index];
    return [[ASContentView alloc] initWithFrame:_scroller.frame item:item];
    
//    Using Colors
//    UIColor *color = self.colors[index];
//    return [[ASContentView alloc] initWithFrame:_scroller.frame withColor:color andIndex:index];
}

#pragma mark - Event Handler
- (IBAction)doneAction:(id)sender {
    
    ASRootViewController *rootView = [[ASRootViewController alloc] initWithNibName:@"ASRootViewController" bundle:nil];
    [self.navigationController pushViewController:rootView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
