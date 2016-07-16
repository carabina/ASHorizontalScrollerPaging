# ASHorizontalScrollerPaging
========================
ASHorizontalScrollerPaging is an easy way to use it for inroducing some screens of your application so the user will be familiar with your application.





![ASHorizontalScrollerPaging](https://github.com/AhmedAskar/ASHorizontalScrollerPaging/blob/master/ASHorizontalScrollerPaging/Shoot1.png)     ![ASHorizontalScrollerPaging](https://github.com/AhmedAskar/ASHorizontalScrollerPaging/blob/master/ASHorizontalScrollerPaging/Shoot2.png)


To use the ASHorizontalScrollerPaging please do the following:

Add the follwing files found in the CLASSES folder to your project:
```
*ASHorizontalScroller.h
*ASHorizontalScroller.m
```


Add the following lines of code to your ViewDidLoad:
```
//set ScrollView Height
_viewHeight = self.view.height * 0.6;

_scroller = [[ASHorizontalScroller alloc] initWithFrame:CGRectMake(VIEWS_OFFSET, VIEW_PADDING_DEFAULT, self.view.width, _viewHeight)];
_scroller.dataSource = self;
_scroller.delegate = self;
_scroller.scrollWidth = self.view.frame.size.width;
_scroller.scrollHeight = _viewHeight;
[self.view addSubview:_scroller];

_pageControl = [[DDPageControl alloc] init];
[_pageControl setCenter:CGPointMake(self.view.center.x, _scroller.y + _viewHeight + 20)];
[_pageControl setNumberOfPages:self.items.count]; // self.colors.count
[_pageControl setCurrentPage:0];
[_pageControl setDefersCurrentPageDisplay:YES];
[_pageControl setType:DDPageControlTypeOnFullOffFull];
[_pageControl setOffColor:RGBA(80, 210, 235, 1)];
[_pageControl setOnColor:RGBA(1, 171, 216, 1)];
[_pageControl setIndicatorDiameter:10.0f];
[_pageControl setIndicatorSpace:10.0f];
[self.view addSubview:_pageControl];

```

Then check the sample you will find what you need

# Note
You can display this sample eighter with images or colors

# License

This code is licensed under the terms of the MIT License.

[@AhmedAskar](https://www.linkedin.com/in/ahmed-askar-8a093244?trk=hp-identity-photo)