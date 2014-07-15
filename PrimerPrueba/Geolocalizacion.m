//
//  Geolocalizacion.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 04/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "Geolocalizacion.h"

@implementation Geolocalizacion
@synthesize Coord;

-(void)inicializar:(NSMutableArray*)todos_lugares{
    
    //DatosLugares*datos=[[DatosLugares alloc]init];
    lugares=todos_lugares;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    [LoadingPantalla setPorcentaje:40];

}
-(CLLocationCoordinate2D*)getCoordenadas{
   
    
    return &(Coord);
}

/* -(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
 //CLLocation *location = [locations lastObject];
     locacion=[locations lastObject];
     NSLog(@"lat%f - lon%f",locacion.coordinate.latitude,locacion.coordinate.longitude);

     [locationManager stopUpdatingLocation];
     [self calculos];
 
 }
 */
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    UIAlertView*alerta=[[UIAlertView alloc]initWithTitle:@"Error" message:@"La autolocalización se ha denegado por el usuario" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    [alerta show];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
     CLLocation *currentLocation = newLocation;
    
    
    
   Coord=newLocation.coordinate;
    NSLog(@"lat%f - lon%f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
    
    [locationManager stopUpdatingLocation];
    
    [LoadingPantalla setPorcentaje:50];
    [self calculos];
    
    
    
   
}
-(void)calculos{
    
    
   
    arreglo_distancias=[[NSMutableArray alloc]init];
    double res_distancia;
    for(int i=0;i<=[lugares count]-1;i++){
        /*res_distancia=[self Distancia:Coord.latitude :Coord.longitude :[[lugares objectAtIndex:i]coordenadas].latitude :[[lugares objectAtIndex:i]coordenadas].longitude];*/
        
        res_distancia=[self Distancia:Coord.latitude longitud1:Coord.longitude latitud2:[[lugares objectAtIndex:i]coordenadas].latitude longitud2:[[lugares objectAtIndex:i]coordenadas].longitude];
        LugaresCercanos*l=[[LugaresCercanos alloc]init];
        
        l.ciudad=[[lugares objectAtIndex:i]ciudad];
        l.lugar=[[lugares objectAtIndex:i]lugar];
        l.lugar_completo=[[lugares objectAtIndex:i]lugar_completo];
        l.dist=res_distancia;
        
        //[arreglo_distancias addObject:[NSNumber numberWithDouble:res_distancia]];
        [arreglo_distancias addObject:l];
        
        
    }
   // NSNumber*dato_menor=[arreglo_distancias valueForKeyPath:@"@min.doubleValue"];
    
    
    for(int j=0;j<=[arreglo_distancias count]-1;j++){
       
        for(int k=0;k<=[arreglo_distancias count]-2;k++){
            
            if([[arreglo_distancias objectAtIndex:k]dist]>[[arreglo_distancias objectAtIndex:k+1]dist]){
                
                LugaresCercanos*temporal=[[LugaresCercanos alloc]init];
                temporal=[arreglo_distancias objectAtIndex:k];
                
                [arreglo_distancias replaceObjectAtIndex:k withObject:[arreglo_distancias objectAtIndex:k+1]];
                [arreglo_distancias replaceObjectAtIndex:k+1 withObject:temporal];
                
                
            }
        }
    }
    
    [LoadingPantalla setPorcentaje:100];
    
   /* UIAlertView*alerta=[[UIAlertView alloc]initWithTitle:[[NSString alloc]initWithFormat:@"Mas cerca: %@",@"S"] message:[[NSString alloc]initWithFormat:@"El lugar mas cercano esta a: %@ metros",dato_menor] delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    
    [alerta show];
*/

    
}

-(double)Distancia:(double)lati1 longitud1:(double)long1 latitud2:(double)lati2  longitud2:(double)lon2{
    double deg2radMultiplier=PI/180;
    lati1=lati1*deg2radMultiplier;
    long1=long1*deg2radMultiplier;
    lati2=lati2*deg2radMultiplier;
    lon2=lon2*deg2radMultiplier;
    
   // double radio= 6371;
   // double dlon=lon2-lon1;
   // double distancia=acos((sin(lat1)*sin(lat2)+cos(lat1)*cos(lat2)*cos(dlon)))*radio;
    double distancia=sqrt(pow(long1-lon2,2)+ pow(lati1-lati2,2));
    [LoadingPantalla setPorcentaje:80];
    return distancia;
}
-(NSMutableArray*)getArregloDistancias{
    NSMutableArray*arreglo_temporal=[[NSMutableArray alloc]initWithArray:arreglo_distancias];
    return arreglo_temporal;
}

@end
