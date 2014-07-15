//
//  NoDisponibleViewController.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 08/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "NoDisponibleViewController.h"

@interface NoDisponibleViewController ()

@end

@implementation NoDisponibleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{

    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botonDF:(id)sender {
   // UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  //  spinner.frame = CGRectMake(0, 0, 24, 24);
   
   
    
    LoadingPantalla*load=[[LoadingPantalla alloc]init];
    [load setAccion:@"promedio_df"];
   
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
      
  
    
}

- (IBAction)botonGDL:(id)sender {
    
    LoadingPantalla*load=[[LoadingPantalla alloc]init];
    [load setAccion:@"promedio_gdl"];
    
    IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
    
    index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
    [self presentViewController:index animated:YES completion:^{
    }];
}

- (IBAction)botonMTY:(id)sender {
    LoadingPantalla*load=[[LoadingPantalla alloc]init];
    [load setAccion:@"promedio_mty"];
    
    IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
    
    index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
    [self presentViewController:index animated:YES completion:^{
    }];
}
- (void)dealloc {
   
    
    [super dealloc];
}
@end
