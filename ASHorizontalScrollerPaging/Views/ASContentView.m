//
//  ASContentView.m
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/20/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import "ASContentView.h"

@implementation ASContentView

- (instancetype)initWithFrame:(CGRect)frame item:(ASItem *)item {
    self = [super initWithFrame:frame];
    
    if (self) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = item.value;
        titleLabel.font = [UIFont systemFontOfSize:40.0];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.width*.1, self.height*.1, self.frame.size.width*.8, self.width)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = item.image;
        [self addSubview:imageview];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor *)color andIndex:(int)index {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = color;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = frame;
        titleLabel.center = self.center;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:85.0f];
        titleLabel.text = [NSString stringWithFormat:@"%i",index];
        [self addSubview:titleLabel];
    }
    return self;
}

@end
