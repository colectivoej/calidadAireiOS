//
//  LoadingPantallaCompartir.h
//  calidaddelaire
//
//  Created by Jose Eduardo Quintero Gutierrez on 31/07/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "IndexViewController.h"
#import "ViewController.h"
#import "DatosLugares.h"
#import "Geolocalizacion.h"
#import "Conexiones.h"
#import "NoDisponibleViewController.h"
#import <Social/Social.h>

@interface LoadingPantallaCompartir : UIViewController{
    NSTimer*progreso;
    NSMutableArray*lugares_ordenados;
    
    CLLocationCoordinate2D*coordnedas_usuario;
}
@property (retain, nonatomic) IBOutlet UIImageView *imagenBarra;
+(void)setPorcentaje:(int)porcentaje_valor;
@end
