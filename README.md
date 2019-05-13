# Scroll Views

* maybe 90% of apps on the app store have scroll views.
* Built to simulate natural gestures.
* Instagram uses scroll Views
  - The feed up and and down
  - The messages & comments
  - Gallery (collection view) 
  - Zooming
* Why? More content than the view can show.

## Panning 

if you have a really big image, you can "pan" scroll around the different parts of the image to see each part in detail.

![Panning & Zooming](http://i.imgur.com/6HoxHTc.png)

* Just set the content size and you're good to go.

```objc
self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
```

## `UIScrollViewDelegate`

https://developer.apple.com/documentation/uikit/uiscrollviewdelegate?language=objc

## Zooming

* We have to use the UIScrollViewDelegate
zoom in and out on a large visual element

```objc
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return self.tiger;
}
```

## Paging

![Imgur](http://i.imgur.com/DgdVqB4.png)

```objc
- (void)setupScrollView {
  int numberOfImage = 4;
  for (int i = 1; i <= numberOfImage; i++) {
    NSString *imageName = [NSString stringWithFormat:@"tiger%i", i];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    imageView.frame = CGRectMake(self.scrollView.frame.size.width*(i-1), 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.scrollView addSubview:imageView];
  }
  
  self.scrollView.contentSize = CGSizeMake(numberOfImage*self.scrollView.frame.size.width, 0);
  
  self.scrollView.pagingEnabled = YES;
}
```

## ScrollViews and Auto Layout

We can use auto layout to constrain the contents to the edge of the scrollview. this makes it so we don't have to set the content size directly.
Check the auto layout view controller for examples using auto layout.

## Open Browser Tabs

* https://ios.compass.lighthouselabs.ca/days/w03d1/activities/945
* http://i.imgur.com/6HoxHTc.png
* http://i.imgur.com/DgdVqB4.png
* https://www.google.com/search?q=baby+tigers&newwindow=1&tbm=isch&tbas=0&source=lnt&sa=X&ved=0ahUKEwiJz4eOzJjiAhUKQhoKHbtWCwgQpwUIHw&biw=960&bih=523&dpr=3.5#imgrc=CDJaKsZf3b9I-M:
* https://www.google.com/search?q=contentInsetAdjustmentBehavior&oq=contentInsetAdjustmentBehavior&aqs=chrome..69i57.332j0j1&sourceid=chrome&ie=UTF-8
* https://developer.apple.com/documentation/uikit/uiscrollviewcontentinsetadjustmentbehavior?language=objc
* https://www.google.com/search?q=visual+format+language&oq=visual+format+language&aqs=chrome..69i57.4375j0j1&sourceid=chrome&ie=UTF-8
* https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html
