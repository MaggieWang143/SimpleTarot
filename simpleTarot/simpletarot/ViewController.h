//
//  ViewController.h
//  simpletarot
//
//  Created by meihan on 14-12-31.
//  Copyright (c) 2014年 meihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sys/sysctl.h"
@interface ViewController : UIViewController<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *drawcardalert;
- (IBAction)drawcardalert:(id)sender;
- (IBAction)setValue1:(id)sender;
- (IBAction)setValue2:(id)sender;
- (IBAction)setValue3:(id)sender;

@end

NSInteger ButtonIndex;