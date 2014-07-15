//
//  DatosLugares.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 04/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lugares.h"
#import <CoreLocation/CoreLocation.h>
#import "LoadingPantalla.h"
@interface DatosLugares : NSObject{
    NSMutableArray*arregloDatosLugares;
}

-(void)datosLugares;
-(NSMutableArray*)getArregloDatosLugares;
@end
