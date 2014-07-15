//
//  nivelesImecaView.m
//  calidaddelaire
//
//  Created by Jose Eduardo Quintero Gutierrez on 26/08/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "nivelesImecaView.h"

@interface nivelesImecaView ()

@end

@implementation nivelesImecaView

-(void)colocarTabla:(NSString*)tb{
    if([tb isEqualToString:@"Monterrey"]){
        _tabla.hidden=YES;
        _tabla2.hidden=NO;
    }else{
        _tabla2.hidden=YES;
        _tabla.hidden=NO;
    }
}
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

- (void)dealloc {
    [_tabla release];
    [_tabla2 release];
    [super dealloc];
}
@end
