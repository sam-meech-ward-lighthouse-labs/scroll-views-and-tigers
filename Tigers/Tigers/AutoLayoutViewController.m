//
//  AutoLayoutViewController.m
//  Tigers
//
//  Created by Sam Meech-Ward on 2019-05-13.
//  Copyright © 2019 meech-ward. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) UIImageView *tiger;
@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  [self setupScrollViewPaging];
}

//- (void)setupScrollViewPanning {
//  self.tiger = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tiger1"]];
//
//  [self.scrollview addSubview:self.tiger];
//
//  self.tiger.translatesAutoresizingMaskIntoConstraints = NO;
//
//  [self.tiger.topAnchor constraintEqualToAnchor:self.scrollview.topAnchor].active = YES;
//  [self.tiger.leftAnchor constraintEqualToAnchor:self.scrollview.leftAnchor].active = YES;
//  [self.tiger.rightAnchor constraintEqualToAnchor:self.scrollview.rightAnchor].active = YES;
//  [self.tiger.bottomAnchor constraintEqualToAnchor:self.scrollview.bottomAnchor].active = YES;
//}

- (void)setupScrollViewPaging {
  
  // The best way to do paging with auto layout is with a stack view
  // You could use visual format language, but .....
  
  int numberOfImage = 4;
  for (int i = 1; i <= numberOfImage; i++) {
    NSString *imageName = [NSString stringWithFormat:@"tiger%i", i];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
//    imageView.frame = CGRectMake(self.scrollview.frame.size.width*(i-1), 0, self.scrollview.frame.size.width, self.scrollview.frame.size.height);
    
    [self.tiger.topAnchor constraintEqualToAnchor:self.scrollview.topAnchor].active = YES;
  [self.tiger.leftAnchor constraintEqualToAnchor:self.tiger.leftAnchor constant:self.scrollview.frame.size.width*(i-1)].active = YES;
    [self.tiger.rightAnchor constraintEqualToAnchor:self.scrollview.rightAnchor constant:self.scrollview.frame.size.width*(numberOfImage-i)].active = YES;
    [self.tiger.bottomAnchor constraintEqualToAnchor:self.scrollview.bottomAnchor].active = YES;
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.scrollview addSubview:imageView];
  }
  
  self.scrollview.pagingEnabled = YES;
}

@end
