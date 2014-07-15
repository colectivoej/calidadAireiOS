//
//  ViewController.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 02/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "IndexViewController.h"
#import "Geolocalizacion.h"
#import "DatosLugares.h"
#import "LoadingPantalla.h"

@interface ViewController : UIViewController{
    NSMutableArray*lugares;
}

@property (retain, nonatomic) IBOutlet UITextField *nombre;

-(IBAction)enviar:(id)sender;
@end
