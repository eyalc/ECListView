//
//  ViewController.m
//  ECListView
//
//  Created by Eyal Cohen on 4/27/13.
//  Copyright (c) 2013 Eyal Cohen. All rights reserved.
//

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
