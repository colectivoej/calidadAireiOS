//
//  GlosarioDatos.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 15/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Glosario.h"

@interface GlosarioDatos : NSObject{
NSMutableArray*arregloGlosarioDatos;
}

-(void)datosGlosario;
-(NSMutableArray*)getArregloGlosarioDatos;

@end
