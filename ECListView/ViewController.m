//
//  ViewController.m
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

#import "ViewController.h"
#import "ECListView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *items = [NSArray arrayWithObjects:
                      @"This is the first list view item.",
                      @"This is the second one that will trigger a line break.",
                      @"This is the third one.",
                      nil];
    
    // numeric list view
    ECListView *listView = [[ECListView alloc] initWithFrame:CGRectMake(20.0, 50.0, 280.0, 0.0)
                                                   textItems:items
                                                   listStyle:ListStyleNumbered];

    // optional configuration
    listView.indentation = 8.0;
    listView.itemsSpacing = 10.0;
    listView.textColor = [UIColor darkGrayColor];
    listView.font = [UIFont systemFontOfSize:18.0];
    [self.view addSubview:listView];
    [listView release];

    
    // bullet list view
    ECListView *bulletListView = [[ECListView alloc] initWithFrame:CGRectMake(20.0, 70.0 + [listView calHeight], 280.0, 0.0)
                                                         textItems:items
                                                         listStyle:ListStyleBulleted];
    bulletListView.indentation = 8.0;
    bulletListView.itemsSpacing = 5.0;
    bulletListView.textColor = [UIColor redColor];
    bulletListView.font = [UIFont systemFontOfSize:15.0];
    
    [self.view addSubview:bulletListView];
    [bulletListView release];
    
    // image list view
    ECListView *imageListView = [[ECListView alloc] initWithFrame:CGRectMake(20.0, 90.0 + [listView calHeight] + [bulletListView calHeight], 280.0, 0.0)
                                                        textItems:items
                                                        listStyle:ListStyleImage];
    imageListView.indentation = 15.0;
    imageListView.itemsSpacing = 10.0;
    imageListView.textColor = [UIColor blueColor];
    imageListView.font = [UIFont systemFontOfSize:20.0];
    imageListView.itemImage = [UIImage imageNamed:@"check"];
    
    [self.view addSubview:imageListView];
    [imageListView release];
}


@end
