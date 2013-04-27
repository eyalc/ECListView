//
//  ECListView.h
//  ECListView
//
//  Created by Eyal Cohen on 4/27/13.
//  Copyright (c) 2013 Eyal Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ListStyleNumbered,
    ListStyleBulleted,
    ListStyleImage
}ListStyle;

@interface ECListView : UIView {
    BOOL _shouldRebuildList;
}

@property (nonatomic) ListStyle listStyle;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic) CGFloat indentation;
@property (nonatomic) CGFloat itemsSpacing;
@property (nonatomic, retain) UIImage *itemImage;

- (id)initWithFrame:(CGRect)frame textItems:(NSArray *)items listStyle:(ListStyle)style;

- (void)rebuildList;

- (CGFloat)calHeight;


@end
