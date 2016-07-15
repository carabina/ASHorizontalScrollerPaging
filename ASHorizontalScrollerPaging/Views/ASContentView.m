//
//  ASContentView.m
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/20/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import "ASContentView.h"

@implementation ASContentView

- (instancetype)initWithFrame:(CGRect)frame item:(ASItem *)tour {
    self = [super initWithFrame:frame];
    
    if (self) {
        UIImageView *backgroundImage = [[UIImageView alloc] init];
        backgroundImage.frame = frame;
        backgroundImage.image = tour.image;
        [self addSubview:backgroundImage];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = frame;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:85.0f];
        label.text = tour.value;
        [self addSubview:label];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor *)color andIndex:(int)index {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = color;
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = frame;
        label.center = self.center;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:85.0f];
        label.text = [NSString stringWithFormat:@"%i",index];
        [self addSubview:label];
    }
    return self;
}

@end
