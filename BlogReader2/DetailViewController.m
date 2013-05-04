//
//  DetailViewController.m
//  BlogReader
//
//  Created by Class Account on 3/30/13.
//  Copyright (c) 2013 Kush Agrawal. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end


@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

//- (void)configureView2
//{
//    // Update the user interface for the detail item.
//    
//    if (self.urlstr) {
//        NSURL *url = [NSURL URLWithString:self.urlstr];
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [self.Browser123 loadRequest:requestObj];
//        
//    }
//}
-(void) setUrlstr:(NSString *)newurlstr{
    _urlstr = newurlstr;
    
  //  [self configureView2];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.urlstr];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.Browser123 loadRequest:requestObj];
    	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
