//
//  ASContentView.h
//  ASHorizontalScrollerPaging
//
//  Created by Askar on 03/20/13.
//  Copyright (c) 2013 Askar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASItem.h"

@interface ASContentView : UIView

/*
 
*/
- (instancetype)initWithFrame:(CGRect)frame item:(ASItem *)item ;

/*
 
 */
- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor *)color andIndex:(int)index ;

@end
