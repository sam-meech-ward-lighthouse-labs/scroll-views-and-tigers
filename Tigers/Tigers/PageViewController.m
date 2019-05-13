//
//  PageViewController.m
//  Tigers
//
//  Created by Sam Meech-Ward on 2019-05-13.
//  Copyright © 2019 meech-ward. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  [self setupScrollView];
}

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

@end
