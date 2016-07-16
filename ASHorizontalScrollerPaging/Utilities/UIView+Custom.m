//
//  UIView+Custom.m
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 04/14/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)

- (void)setX:(float)x {
    
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setY:(float)y {
    
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (float)x {
    
    return self.frame.origin.x;
}

- (float)y {
    
    return self.frame.origin.y;
}

- (void)setWidth:(float)width {
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, width);
}

- (void)setHeight:(float)height {
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (float)width {
    return self.frame.size.width;
}

- (float)height {
    return self.frame.size.height;
}

@end
