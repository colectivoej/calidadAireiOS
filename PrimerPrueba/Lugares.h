//
//  Lugares.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 04/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Lugares : NSObject{
    NSMutableArray*arregloLugares;
}

@property(nonatomic,strong)NSString*ciudad;
@property(nonatomic,strong)NSString*lugar;
@property(nonatomic,strong)NSString*lugar_completo;
@property (nonatomic,assign) CLLocationCoordinate2D coordenadas;
@property(nonatomic,strong)NSString*url;


@end
