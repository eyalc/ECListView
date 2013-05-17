//
//  ECListView.m
//  ECListView
//
//  Created by Eyal Cohen on 4/27/13.
//  Copyright (c) 2013 Eyal Cohen. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// If you happen to meet one of the copyright holders in a bar you are obligated
// to buy them one pint of beer.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "ECListView.h"

@interface ECListView ()
@property (nonatomic, retain) NSArray *items;
@end

@implementation ECListView
@synthesize items = _items;
@synthesize font = _font;
@synthesize textColor = _textColor;
@synthesize indentation = _indentation;
@synthesize itemsSpacing = _itemsSpacing;
@synthesize listStyle = _listStyle;
@synthesize itemImage = _itemImage;

- (id)initWithFrame:(CGRect)frame textItems:(NSArray *)items listStyle:(ListStyle)style {
    self = [super initWithFrame:frame];
    if (self) {
        self.items = items;
        self.listStyle = style;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self rebuildList];
    }
    return self;
}

- (void)dealloc {
    [_items release];
    [_font release];
    [_textColor release];
    [_itemImage release];
    
    [super dealloc];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_shouldRebuildList) {
        _shouldRebuildList = NO;
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        CGRect sectionFrame;
        CGFloat width = self.frame.size.width;
        CGFloat xOffset = self.indentation;
        CGFloat height = 0.0;

        NSInteger numericItem = 1;
        
        for (int i=0; i < self.items.count; i++) {
            id item = [self.items objectAtIndex:i];
            if ([item isKindOfClass:[NSString class]]) {
                NSString *text = (NSString *)item;
                
                // item bullet
                if (self.listStyle == ListStyleImage) {
                    UIImageView *iv = [[UIImageView alloc] initWithImage:self.itemImage];
                    iv.frame = CGRectMake(0.0, height, iv.bounds.size.width, iv.bounds.size.height);
                    xOffset = iv.bounds.size.width + self.indentation;
                    [self addSubview:iv];
                    [iv release];
                } else {
                    UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, height, 0.0, 0.0)];
                    itemLabel.backgroundColor = [UIColor clearColor];
                    itemLabel.textAlignment = UITextAlignmentLeft;
                    itemLabel.font = self.font;
                    itemLabel.textColor = self.textColor;
                    
                    NSString *itemStr = @"";
                    if (self.listStyle == ListStyleNumbered) {
                        itemStr = [NSString stringWithFormat:@"%d.", numericItem++];
                    } else if (self.listStyle == ListStyleBulleted) {
                        itemStr = @"•";
                    }
                    
                    itemLabel.text = itemStr;
                    [itemLabel sizeToFit];
                    
                    xOffset = itemLabel.bounds.size.width + self.indentation;
                    [self addSubview:itemLabel];
                    [itemLabel release];
                }

                sectionFrame = CGRectMake(xOffset, height, width - xOffset, 0.0);
                
                // item text
                UILabel *textLabel = [[UILabel alloc] initWithFrame:sectionFrame];
                textLabel.backgroundColor = [UIColor clearColor];
                textLabel.numberOfLines = 0;
                textLabel.textColor = self.textColor;
                textLabel.font = self.font;
                textLabel.text = text;
                [textLabel sizeToFit];
                
                CGFloat sectionSpace = i < self.items.count - 1 ? self.itemsSpacing : 0.0;
                height += textLabel.bounds.size.height + sectionSpace;
                sectionFrame = CGRectMake(xOffset, height, width - xOffset, 0.0);
                
                [self addSubview:textLabel];
                [textLabel release];
            }
        }
        
        CGRect newFrame = self.frame;
        newFrame.size.height = height;
        self.frame = newFrame;
    }
}

- (void)rebuildList {
    _shouldRebuildList = YES;
    [self setNeedsLayout];
}

- (CGFloat)calHeight {
    CGRect sectionFrame;
    CGFloat width = self.frame.size.width;
    CGFloat xOffset = self.indentation;
    CGFloat height = 0.0;
    
    NSInteger numericItem = 1;
    
    for (int i=0; i < self.items.count; i++) {
        id item = [self.items objectAtIndex:i];
        if ([item isKindOfClass:[NSString class]]) {
            NSString *text = (NSString *)item;
            
            if (self.listStyle == ListStyleImage) {
                UIImageView *iv = [[UIImageView alloc] initWithImage:self.itemImage];
                iv.frame = CGRectMake(0.0, height, iv.bounds.size.width, iv.bounds.size.height);
                xOffset = iv.bounds.size.width + self.indentation;
                [iv release];
            } else {
                UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, height, 0.0, 0.0)];
                itemLabel.font = self.font;
                
                NSString *itemStr = @"";
                if (self.listStyle == ListStyleNumbered) {
                    itemStr = [NSString stringWithFormat:@"%d.", numericItem++];
                } else if (self.listStyle == ListStyleBulleted) {
                    itemStr = @"•";
                }
                
                itemLabel.text = itemStr;
                [itemLabel sizeToFit];
                
                xOffset = itemLabel.bounds.size.width + self.indentation;
                [itemLabel release];
            }

            sectionFrame = CGRectMake(xOffset, height, width - xOffset, 0.0);
            
            UILabel *textLabel = [[UILabel alloc] initWithFrame:sectionFrame];
            textLabel.numberOfLines = 0;
            textLabel.font = self.font;
            textLabel.text = text;
            [textLabel sizeToFit];
            
            CGFloat sectionSpace = i < self.items.count - 1 ? self.itemsSpacing : 0.0;
            height += textLabel.bounds.size.height + sectionSpace;
            sectionFrame = CGRectMake(xOffset, height, width - xOffset, 0.0);
            
            [textLabel release];
        }
    }
    
    return height;
}

#pragma mark - Setters

- (void)setListStyle:(ListStyle)listStyle {
    if (_listStyle != listStyle) {
        _listStyle = listStyle;
        [self rebuildList];
    }
}

- (void)setItemsSpacing:(CGFloat)itemsSpacing {
    if (_itemsSpacing != itemsSpacing) {
        _itemsSpacing = itemsSpacing;
        [self rebuildList];
    }
}

- (void)setIndentation:(CGFloat)indentation {
    if (_indentation != indentation) {
        _indentation = indentation;
        [self rebuildList];
    }
}

- (void)setFont:(UIFont *)font {
    if (_font != font) {
        [_font release];
        _font = [font retain];
        [self rebuildList];
    }
}

- (void)setTextColor:(UIColor *)textColor {
    if (_textColor != textColor) {
        [_textColor release];
        _textColor = [textColor retain];
        [self rebuildList];
    }
}

- (void)setItemImage:(UIImage *)itemImage {
    if (_itemImage != itemImage) {
        [_itemImage release];
        _itemImage = [itemImage retain];
        [self rebuildList];
    }
}

@end
