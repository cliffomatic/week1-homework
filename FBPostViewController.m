//
//  FBPostViewController.m
//  FacebookPost
//
//  Created by Cliff Curry on 6/22/14.
//  Copyright (c) 2014 Cliff Curry. All rights reserved.
//

#import "FBPostViewController.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>
#import "FullPhotoViewController.h"

@interface FBPostViewController ()

@property (weak, nonatomic) IBOutlet UIView *postCardView;
@property (weak, nonatomic) IBOutlet UIView *postImageContainerView;
- (IBAction)onCommentClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *commentBoxView;
- (IBAction)onPostButton:(id)sender;
- (IBAction)onPictureButton:(id)sender;
- (IBAction)onLikeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;

@end

@implementation FBPostViewController

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
    
    
    //Added from Attributed
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(8, 18, 280, 150) ];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor grayColor];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    
    NSString *text = @"From the collarless shirts to high-waisted pants, #Her's costume designer, Casey Storm, explains how he created his fashion looks for the future: http://bit.ly/1jVCM8";
    
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
    label.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
    
    label.text = @"Fork me on GitHub! (http://github.com/mattt/TTTAttributedLabel/)"; // Repository URL will be automatically detected and linked
    
    NSRange range = [label.text rangeOfString:@"me"];
    [label addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range]; // Embedding a custom link in a substring
    
    
    
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"#Her's" options:NSCaseInsensitiveSearch];
       
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            CFRelease(font);
        }
        
        return mutableAttributedString;
    }];
    
    [self.postCardView addSubview:label];
    
    //End of Attributed
    
    
    
    
    
    self.postCardView.layer.cornerRadius = 2;
    self.postCardView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.postCardView.layer.shadowOffset = CGSizeMake(.5,.5);
    self.postCardView.layer.shadowOpacity = .3;
    self.postCardView.layer.shadowRadius = 1;
    
    self.postImageContainerView.layer.cornerRadius = 2;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)onCommentClick:(id)sender {
    self.commentBoxView.frame = CGRectMake(self.commentBoxView.frame.origin.x, 300, self.commentBoxView.frame.size.width, self.commentBoxView.frame.size.height);
    
    
}
- (IBAction)onPostButton:(id)sender {
    [_commentTextField resignFirstResponder];
    self.commentBoxView.frame = CGRectMake(self.commentBoxView.frame.origin.x, 472, self.commentBoxView.frame.size.width, self.commentBoxView.frame.size.height);

}

- (IBAction)onPictureButton:(id)sender {
    UIViewController *vc = [[FullPhotoViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)onLikeButton:(id)sender {
            self.likeButton.selected = !self.likeButton.selected;
    }

@end
