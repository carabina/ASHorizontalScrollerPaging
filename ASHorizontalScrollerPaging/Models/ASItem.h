//
//  ASItem.h
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/14/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASItem : NSObject

@property (nonatomic, copy, readonly) UIImage *image;
@property (nonatomic, copy, readonly) NSString *value;

+ (instancetype)getInstance;
- (instancetype)initWithImage:(UIImage *)image andValue:(NSString *)value;
- (NSArray *)items;
- (NSArray *)colors;

@end
