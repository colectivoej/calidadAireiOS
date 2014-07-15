//
//  Conexiones.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 08/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"
#import "LoadingPantalla.h"
#import "IndexViewController.h"
#import "Lugares.h"
@interface Conexiones : NSObject

-(void)obtenerDatosGuadalajara:(NSString*)lugar_parametro;
+(NSString*)getContaminante;
+(NSString*)getImeca;
+(NSString*)getHumedad;
+(NSString*)getTemperatura;
+(NSInteger)getSucces;
+(NSString*)getTipo;
-(void)obtenerLugar:(Lugares*)lugr;
-(void)obtenerDatosDFPromedio;
-(void)obtenerDatosGuadalajaraPromedio;
-(void)obtenerDatosMonterrey:(NSString*)lugar_parametro;


@end
