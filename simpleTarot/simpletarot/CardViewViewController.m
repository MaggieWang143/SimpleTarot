//
//  CardViewViewController.m
//  simpletarot
//
//  Created by meihan on 15-1-2.
//  Copyright (c) 2015年 meihan. All rights reserved.
//

#import "CardViewViewController.h"
#import "Foundation/Foundation.h"
@interface CardViewViewController ()

@end

@implementation CardViewViewController

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
    // Do any additional setup after loading the view from its nib.
    //---- record the size of original imageview
    _centerframe= _ImageViewCenter.frame;
    _upframe= _ImageViewUp.frame;
    _leftframe= _ImageViewLeft.frame;
    _rightframe= _ImageViewRight.frame;
    _bottomframe= _ImageViewBottom.frame;
    //----- set background image--------
   [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background3.jpg"]]];
    //[super viewDidLoad];
    //--- set navigation bar to be translucent----
    [self.CardNavigation setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.CardNavigation.shadowImage = [UIImage new];
    self.CardNavigation.translucent = YES;
    //---------------------------------------------
    //generate random image array----------------------
    //use Set to avoid replicates----------------------
    NSMutableSet *randomSet = [[NSMutableSet alloc] init];
    while ([randomSet count] <  self.ButtonIndex) {
        int r = arc4random() % 78 +1;
        UIImage *image = [UIImage imageNamed:[ NSString stringWithFormat:@"%i.jpg",r]];
        [randomSet addObject:image];
    }
    NSArray *imageidx = [randomSet allObjects];
    //---------------------------------------------
    //---------- show images-----------------------
    UIImage *image = [imageidx objectAtIndex:0];
    CGAffineTransform transform = CGAffineTransformIdentity;              transform = CGAffineTransformTranslate(transform, image.size.width, 0);
    transform = CGAffineTransformRotate(transform, M_PI);/// rotate image 180 tranform 
    _ImageViewCenter.image = [imageidx objectAtIndex:0];
    int i = arc4random() % 2;// randomly rotate images
    if(i == 0){
        _ImageViewCenter.transform = transform;
    }
    //[self.view addSubview:_ImageViewCenter];
    if(self.ButtonIndex == 3 || self.ButtonIndex ==5){
    _ImageViewLeft.image = [imageidx objectAtIndex:1];
    _ImageViewRight.image = [imageidx objectAtIndex:2];
    //[self.view addSubview:_ImageViewLeft];
    //[self.view addSubview:_ImageViewRight];
     i = arc4random() % 2;// randomly rotate images
        if(i == 0){
            _ImageViewLeft.transform = transform;
        }
     i = arc4random() % 2;// randomly rotate images
        if(i == 0){
            _ImageViewRight.transform = transform;
        }
        if(self.ButtonIndex == 5){
        _ImageViewUp.image = [imageidx objectAtIndex:3];
        _ImageViewBottom.image = [imageidx objectAtIndex:4];
        //[self.view addSubview:_ImageViewUp];
        //[self.view addSubview:_ImageViewBottom];
        i = arc4random() % 2;// randomly rotate images
        if(i == 0){
            _ImageViewUp.transform = transform;
        }
        i = arc4random() % 2;// randomly rotate images
        if(i == 0){
           _ImageViewBottom.transform = transform;
        }
            
        
        }}
  
    _centerstate = NO;/// set zoom state to be NO
    _upstate = NO;
    _leftstate = NO;
    _rightstate = NO;
    _bottomstate = NO;
    
}
- (IBAction)zoomup:(id)sender {
    if(_upstate == NO){
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewUp.frame = self.view.window.bounds;// zoom up to full screen
         }];
        [self.view bringSubviewToFront:_ImageViewUp];// send subview to front
        _upstate = YES;}
    else{
        
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewUp.frame = _upframe;        }];
        [self.view sendSubviewToBack:_ImageViewCenter];
        _upstate = NO;
        // if it's fullscreen view, zoom back
    }
}
- (IBAction)zoomleft:(id)sender {
    if(_leftstate == NO){
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewLeft.frame = self.view.window.bounds;
         }];
        [self.view bringSubviewToFront:_ImageViewLeft];
        _leftstate = YES;}
    else{
        
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewLeft.frame = _leftframe;        }];
        //[self.view sendSubviewToBack:_ImageViewCenter];
        _leftstate = NO;
    }
}
- (IBAction)zoomright:(id)sender {
    if(_rightstate == NO){
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewRight.frame = self.view.window.bounds;
         }];
        [self.view bringSubviewToFront:_ImageViewRight];
        _rightstate = YES;}
    else{
        
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewRight.frame = _rightframe;        }];
        //[self.view sendSubviewToBack:_ImageViewCenter];
        _rightstate = NO;
    }
 
}
- (IBAction)zoombottom:(id)sender {
    if(_bottomstate == NO){
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewBottom.frame = self.view.window.bounds;
         }];
        [self.view bringSubviewToFront:_ImageViewBottom];
        _bottomstate = YES;}
    else{
        
        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewBottom.frame = _bottomframe;        }];
        //[self.view sendSubviewToBack:_ImageViewCenter];
        _bottomstate = NO;
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoom:(id)sender {
    if(_centerstate == NO){
    [UIView
     animateWithDuration:0.2
     animations:^{
         _ImageViewCenter.frame = self.view.window.bounds;
     }];
        [self.view bringSubviewToFront:_ImageViewCenter];
            _centerstate = YES;}
    else{

        [UIView
         animateWithDuration:0.2
         animations:^{
             _ImageViewCenter.frame = _centerframe;        }];
        //[self.view sendSubviewToBack:_ImageViewCenter];
        _centerstate = NO;
    }
    }

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil]; // close current view
}
@end
