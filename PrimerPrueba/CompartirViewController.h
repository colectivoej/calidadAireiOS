//
//  CompartirViewController.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 10/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <QuartzCore/QuartzCore.h>
@interface CompartirViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *subView;
- (IBAction)facebook:(id)sender;
- (IBAction)twitter:(id)sender;

@end
