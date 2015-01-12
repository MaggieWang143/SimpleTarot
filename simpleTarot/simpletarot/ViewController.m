//
//  ViewController.m
//  simpletarot
//
//  Created by meihan on 14-12-31.
//  Copyright (c) 2014年 meihan. All rights reserved.
//

#import "ViewController.h"
#import "CardViewViewController.h"
#import "QuartzCore/QuartzCore.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //----- set background image--------
    /*UIImage *image = [UIImage imageNamed:@"background1.jpeg"];
    self.view.layer.contents = (id) image.CGImage;*/
[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background4.jpg"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drawcardalert:(id)sender {
    // When click one of the three buttons , show alerts
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
    message:@"Please Concentrate\n\n"
    delegate:self
    cancelButtonTitle:@"Draw"
    
    otherButtonTitles:nil];
    [alertView show];
        
}

- (IBAction)setValue1:(id)sender {
    ButtonIndex = 1;// the number of card index
}

- (IBAction)setValue2:(id)sender {
    ButtonIndex = 3;
}

- (IBAction)setValue3:(id)sender {
    ButtonIndex = 5;
}

#pragma mark   showsecondView
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // click alert button, show second view of cards
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Draw"]){
        CardViewViewController *CardView =[[CardViewViewController alloc] init];
        CardView.ButtonIndex = ButtonIndex;
        [self presentViewController:CardView animated:NO completion:^{
        }];
        
      
   
        
    } }
-(void)willPresentAlertView:(UIAlertView *)alertView {
    // set alert view properties
    for( UIView * view in alertView.subviews )    
    {   
        if( [view isKindOfClass:[UILabel class]] )    
        {   
            UILabel* label = (UILabel*) view;            
            label.font=[UIFont fontWithName:@"STHeitiSC-Medium" size:18];
            //label.textColor=[UIColor blackColor];
            label.layer.borderWidth = 0;
 
        } 
    }
    alertView.backgroundColor = [UIColor grayColor];
    alertView.alpha = 0.1;
    alertView.layer.opacity = 0;

}       


@end
