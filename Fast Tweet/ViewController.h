//
//  ViewController.h
//  Fast Tweet
//
//  Created by Josh on 9/1/12.
//  Copyright (c) 2012 Jukaela Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import "DAKeyboardControl.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *hashTagButton;
@property (strong, nonatomic) IBOutlet UIButton *tweetButton;
@property (strong, nonatomic) IBOutlet UITextField *hashTagTextField;

-(IBAction)showHashTagTextField:(id)sender;
-(IBAction)tweet:(id)sender;
-(IBAction)about:(id)sender;

@end
