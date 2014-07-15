//
//  CompartirViewController.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 10/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "CompartirViewController.h"

@interface CompartirViewController ()

@end

@implementation CompartirViewController
@synthesize subView;
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
    subView.backgroundColor=[[UIColor colorWithPatternImage:[UIImage imageNamed:@"pat3.png"]]colorWithAlphaComponent:0.5f];
    //subView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5f];
    UIColor * color = [UIColor colorWithRed:25/255.0f green:156/255.0f blue:205/255.0f alpha:0.9f];
    subView.backgroundColor=color;
    [subView.layer setCornerRadius:20.0f];
    [subView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [subView.layer setBorderWidth:0.0f];
    [subView.layer setShadowColor:[UIColor blackColor].CGColor];
    [subView.layer setShadowOpacity:0.8];
    [subView.layer setShadowRadius:3.0];
    [subView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [subView release];
  
    [super dealloc];
}
- (IBAction)facebook:(id)sender {
    SLComposeViewController*facebook=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        facebook=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebook setInitialText:@"Descarga la APP de Calidad del Aire para iOs y Android!."];
        [facebook addImage:[UIImage imageNamed:@"calidad_del_aire_logo_redes.png"]];
        [facebook addURL:[NSURL URLWithString:@"https://play.google.com/store/apps/details?id=com.avitia.calidaddelaire&hl=es"]];
        // [objetoSocial addImage:[UIImage imageNamed:@"Toypaj.jpeg"]];
        SLComposeViewControllerCompletionHandler completionHandler = ^(SLComposeViewControllerResult result)
        {
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"La publicación ha sido cancelada.");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Se ha publicado satisfactoriamente.");
                    break;
                default:
                    break;
            }
            
           // [self dismissViewControllerAnimated:YES completion:nil];
            
            
        };
        
        // por último mostramos la interfaz de publicación
        [self presentViewController:facebook animated:YES completion:nil];
        
        // asignamos el completionHandler para manipular los resultados del envío
        [facebook setCompletionHandler:completionHandler];
     
        
    }
}

- (IBAction)twitter:(id)sender {
    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
    // ponemos un texto inicial para la publicación
    [twitter setInitialText:@"Descarga la APP de Calidad del Aire para iOs y Android!."];
    
    // añadimos una imagen a nuestra publicación
    [twitter addImage:[UIImage imageNamed:@"calidad_del_aire_logo_redes.png"]];
    
    // añadimos también una URL
    [twitter addURL:[NSURL URLWithString:@"https://play.google.com/store/apps/details?id=com.avitia.calidaddelaire&hl=es"]];
    
    SLComposeViewControllerCompletionHandler completionHandler = ^(SLComposeViewControllerResult result)
    {
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                NSLog(@"La publicación ha sido cancelada.");
                break;
            case SLComposeViewControllerResultDone:
                NSLog(@"Se ha publicado satisfactoriamente.");
                break;
            default:
                break;
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    };
    
    // por último mostramos la interfaz de publicación
    [self presentViewController:twitter animated:YES completion:nil];
    
    // asignamos el completionHandler para manipular los resultados del envío
    [twitter setCompletionHandler:completionHandler];
    

}
@end
