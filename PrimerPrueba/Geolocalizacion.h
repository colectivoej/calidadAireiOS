//
//  Geolocalizacion.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 04/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include <math.h>
#define PI 3.14159265358979323846
#import "LoadingPantalla.h"
#import "DatosLugares.h"
#import "LugaresCercanos.h"
#import "NoDisponibleViewController.h"

@interface Geolocalizacion : NSObject<CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
    CLLocation*locacion;
    
    NSMutableArray*lugares;
    double a,b;
    NSMutableArray*arreglo_distancias;
    
    
}
@property (nonatomic, readwrite) CLLocationCoordinate2D Coord;

-(void)inicializar:(NSMutableArray*)todos_lugares;
-(CLLocationCoordinate2D*)getCoordenadas;
-(NSMutableArray*)getArregloDistancias;
@end
