//
//  ASItem.m
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/14/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import "ASItem.h"

#define IMAGESCOUNT 2

ASItem *tourInstance = nil;

@implementation ASItem

- (id)initWithImage:(UIImage *)image andValue:(NSString *)value;
{
    self = [super init];
    if (self) {
        _image = image;
        _value = value;
    }
    return self;
}

+ (instancetype)getInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (NSArray *)items {
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < IMAGESCOUNT; i++) {
        NSString *imageName = [NSString stringWithFormat:@"ip5_tour_%d", i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        ASItem *tourObject =
        [[ASItem alloc] initWithImage:image
                             andValue:[NSString stringWithFormat:@"%d", i + 1]];
        [resultArray addObject:tourObject];
    }
    return resultArray;
}

- (NSArray *)colors {
    return [NSArray arrayWithObjects:RGBA(70, 249, 26, 1), RGBA(70, 103, 26, 1),
            RGBA(70, 103, 97, 1), RGBA(244, 136, 0, 1),
            RGBA(224, 151, 255, 1), nil];
}
@end
