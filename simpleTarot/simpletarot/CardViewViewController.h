//
//  CardViewViewController.h
//  simpletarot
//
//  Created by meihan on 15-1-2.
//  Copyright (c) 2015年 meihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardViewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *CardNavigation;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Refresh;
- (IBAction)back:(id)sender;
@property (strong, atomic) IBOutlet UIImageView *ImageViewUp;
@property (strong, atomic) IBOutlet UIImageView *ImageViewCenter;
@property (strong, atomic) IBOutlet UIImageView *ImageViewLeft;
@property (strong, atomic) IBOutlet UIImageView *ImageViewRight;
@property (strong, atomic) IBOutlet UIImageView *ImageViewBottom;
@property NSInteger ButtonIndex;
@property CGRect centerframe,upframe,leftframe,rightframe,bottomframe;
@property BOOL centerstate,upstate,leftstate,rightstate,bottomstate;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *TapZoom;

@end


