//
//  ViewController.m
//  Tigers
//
//  Created by Sam Meech-Ward on 2019-05-13.
//  Copyright © 2019 meech-ward. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *tiger;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self setupScrollView];
}

- (void)setupScrollView {
  self.tiger = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tiger1"]];
  
  // Add both of these views to a container uiview then use that for zooming
//  UIImageView *small = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"small"]];
  [self.scrollView addSubview:self.tiger];
//  [self.scrollView addSubview:small];
  self.scrollView.contentSize = self.tiger.frame.size;
  self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
  
  CGFloat minZoom = self.scrollView.frame.size.width / self.tiger.frame.size.width;
  self.scrollView.minimumZoomScale = minZoom;
  self.scrollView.maximumZoomScale = 1.0;
  self.scrollView.zoomScale = minZoom;
  
  self.scrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return self.tiger;
}

@end
