//
//  ViewController.m
//  Fast Tweet
//
//  Created by Josh on 9/1/12.
//  Copyright (c) 2012 Jukaela Enterprises. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserverForName:@"tweet_yo" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *aNotification) {
        [self tweet:nil];
    }];
    
    [super viewDidLoad];
    
    [[self view] addKeyboardPanningWithActionHandler:^(CGRect keyboardFromInView) {
        return;
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    if ([[self hashTagTextField] isEnabled]) {
        [[self hashTagTextField] setText:nil];
        [[self hashTagTextField] setAlpha:0.0];
        [[self hashTagTextField] setEnabled:NO];
    }
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)showHashTagTextField:(id)sender
{
    if (![[self hashTagTextField] isEnabled]) {
        [UIView animateWithDuration:0.4 animations:^{
            [[self hashTagTextField] setAlpha:1.0];
            [[self hashTagTextField] setEnabled:YES];
        }];
    }
    else {
        [UIView animateWithDuration:0.4 animations:^{
            [[self hashTagTextField] setAlpha:0.0];
            [[self hashTagTextField] setEnabled:NO];
        }];
    }
}

-(IBAction)tweet:(id)sender
{
    TWTweetComposeViewController *tweetViewController = [[TWTweetComposeViewController alloc] init];
    
    if ([[[self hashTagTextField] text] length] > 0) {
        [tweetViewController setInitialText:[NSString stringWithFormat:@"#%@", [[self hashTagTextField] text]]];
    }
    [self presentViewController:tweetViewController animated:YES completion:^{
        [[self hashTagTextField] setText:nil];
        
        [self showHashTagTextField:nil];
    }];
}

-(IBAction)about:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Contact"
                                                        message:@"If you have any questions, comments, or suggestions, contact me on Twitter @Jukaela"
                                                       delegate:nil
                                              cancelButtonTitle:@"Happy Tweeting!"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

@end
