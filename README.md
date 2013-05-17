ECListView
==============

A simple component to present a bulleted/numbered/custom list view with text indentation.
("The placement of text farther to the right to separate it from surrounding text") 

I just couldn't find an easy way to create a text list with indentation on iOS, so I decided to create one myself.


==============
![ECListView](https://github.com/eyalc/ECListView/raw/master/ECListView/ss.png)

Usage
==============

Just copy the ```ECListView.h``` and ```ECListView.m``` files to your project.  
  
  
**Example Code**  

Adding a numbered list view:
```
    NSArray *items = [NSArray arrayWithObjects:
                      @"This is the first list view item.",
                      @"This is the second one that will trigger a line break.",
                      @"This is the third one.",
                      nil];  
                      
    ECListView *listView = [[ECListView alloc] initWithFrame:CGRectMake(20.0, 50.0, 280.0, 0.0)
                                                   textItems:items
                                                   listStyle:ListStyleNumbered];  
  
    [self.view addSubview:listView];
    [listView release];
```
  
You can configure the look of the list as you want:  
```
    // optional configuration
    listView.indentation = 8.0;
    listView.itemsSpacing = 10.0;
    listView.textColor = [UIColor darkGrayColor];
    listView.font = [UIFont systemFontOfSize:18.0];
```

**License**
==============

```
Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 If you happen to meet one of the copyright holders in a bar you are obligated
 to buy them one pint of beer.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 ```



