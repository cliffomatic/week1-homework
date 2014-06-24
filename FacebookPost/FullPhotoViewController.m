//
//  FullPhotoViewController.m
//  FacebookPost
//
//  Created by Cliff Curry on 6/22/14.
//  Copyright (c) 2014 Cliff Curry. All rights reserved.
//

#import "FullPhotoViewController.h"

@interface FullPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fullPicView;
- (IBAction)onDoneButton:(id)sender;

@end

@implementation FullPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
}
@end
