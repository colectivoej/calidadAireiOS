//
//  LoadingPantalla.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 04/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "LoadingPantalla.h"

@interface LoadingPantalla ()

@end
static int porcentaje=20;
static NSString*accion=@"";

@implementation LoadingPantalla{
    Geolocalizacion*localizacion;

}
@synthesize imagenBarra;

+(void)setPorcentaje:(int)porcentaje_valor{
    porcentaje=porcentaje_valor;
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
   
    /*progreso=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    DatosLugares*datos=[[DatosLugares alloc]init];
    [datos datosLugares];
    lugares_ordenados=[[NSMutableArray alloc]init];
    lugares_ordenados=[datos getArregloDatosLugares];
    
    [self lugarMasCercano];*/
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    progreso=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    DatosLugares*datos=[[DatosLugares alloc]init];
    [datos datosLugares];
    lugares_ordenados=[[NSMutableArray alloc]init];
    lugares_ordenados=[datos getArregloDatosLugares];
    
    [self lugarMasCercano];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onTimer{
    NSLog(@"%d",porcentaje);
    switch (porcentaje) {
        case 0:
      
          //  imagenBarra.contentMode = UIViewContentModeScaleAspectFit;
            imagenBarra.image=[UIImage imageNamed:@"progressbar00.png"];
            break;
        
        case 20:
               
           //  imagenBarra.contentMode = UIViewContentModeScaleAspectFit;
            imagenBarra.image=[UIImage imageNamed:@"progressbar20.png"];
            
      
            break;
            
        case 40:
            
           // imagenBarra.contentMode = UIViewContentModeScaleAspectFit ;
            imagenBarra.image=[UIImage imageNamed:@"progressbar40.png"];
            
            break;
            
        case 50:
            
            // imagenBarra.contentMode = UIViewContentModeScaleAspectFit ;
            imagenBarra.image=[UIImage imageNamed:@"progressbar50.png"];
            break;
            
        case 60:
            
            // imagenBarra.contentMode = UIViewContentModeScaleAspectFit ;
            imagenBarra.image=[UIImage imageNamed:@"progressbar60.png"];
            break;
            
        case 80:
            
            // imagenBarra.contentMode = UIViewContentModeScaleAspectFit ;
            imagenBarra.image=[UIImage imageNamed:@"progressbar80.png"];
            break;
            
        case 100:
            imagenBarra.image=[UIImage imageNamed:@"progressbar100.png"];
            [progreso invalidate];
            
            if([accion isEqualToString:@""] || [accion isEqualToString:@"normal"]){
                [self ejecutarCalidadAire];
            }
            if([accion isEqualToString:@"promedio_df"]){
            [self ejecutarCalidadaireDFTOTAL];
            }
            if([accion isEqualToString:@"promedio_gdl"]){
                [self ejecutarCalidadAireGDLTOTAL];
            }
            if([accion isEqualToString:@"promedio_mty"]){
                [self ejecutarCalidadAireMTYTOTAL];
            }
            break;
    }
}
-(void)ejecutarCalidadAireGDLTOTAL{
    Conexiones*con=[[Conexiones alloc]init];
    [con obtenerDatosGuadalajaraPromedio];
    if([Conexiones getSucces]==1){
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
        
        index.vistaCompartir.hidden=YES;
        index.estado_label.text=[[NSString alloc]initWithFormat:@"Guadalajara"];
        index.titulo.text=[[NSString alloc]initWithFormat:@"Centro"];
        
        index.imeca_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getImeca]];
        
        
        [index setCiudadActual:@"Guadalajara"];
        
        index.contaminante_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getContaminante]];
        index.temperatura_label.text=[[NSString alloc]initWithFormat:@"%@ºC",[Conexiones getTemperatura]];
        index.humedad_label.text=[[NSString alloc]initWithFormat:@"%@%%",[Conexiones getHumedad]];
        
        [index setEstado:@"Guadalajara"];

        [index calificar];
    }else{
        NoDisponibleViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"NoDisponible"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
    }
    accion=@"";

}
-(void)ejecutarCalidadAireMTYTOTAL{
    Conexiones*con=[[Conexiones alloc]init];
    [con obtenerDatosMonterrey:@"Obispado"];
    if([Conexiones getSucces]==1){
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
        
        index.estado_label.text=[[NSString alloc]initWithFormat:@"Monterrey"];
        index.titulo.text=[[NSString alloc]initWithFormat:@"Obispado"];
        
        index.imeca_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getImeca]];
        index.vistaCompartir.hidden=YES;

        
        [index setCiudadActual:@"Monterrey"];
        
        index.contaminante_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getContaminante]];
        index.temperatura_label.text=[[NSString alloc]initWithFormat:@"%@ºC",[Conexiones getTemperatura]];
        index.humedad_label.text=[[NSString alloc]initWithFormat:@"%@%%",[Conexiones getHumedad]];
        
        [index setEstado:@"Monterrey"];
        
        [index calificar];
    }else{
        NoDisponibleViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"NoDisponible"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
    }
    accion=@"";
    
}

-(void)ejecutarCalidadaireDFTOTAL{
    Conexiones*con=[[Conexiones alloc]init];
    [con obtenerDatosDFPromedio];
    if([Conexiones getSucces]==1){
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
        
         index.estado_label.text=[[NSString alloc]initWithFormat:@"DF"];
        index.titulo.text=[[NSString alloc]initWithFormat:@"Valor Promedio"];
        
        index.imeca_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getImeca]];
        
        [index setCiudadActual:@"DF"];
        index.vistaCompartir.hidden=YES;

        index.contaminante_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getContaminante]];
        index.temperatura_label.text=[[NSString alloc]initWithFormat:@"%@ºC",[Conexiones getTemperatura]];
        index.humedad_label.text=[[NSString alloc]initWithFormat:@"%@%%",[Conexiones getHumedad]];
        [index setEstado:@"DF"];

        [index calificar];
    }else{
        NoDisponibleViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"NoDisponible"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
    }
    accion=@"";

}
-(void)ejecutarCalidadAire{
    
   lugares_ordenados=[localizacion getArregloDistancias];
    NSLog(@"%@",[[lugares_ordenados objectAtIndex:0]lugar]);
    
    Conexiones*con=[[Conexiones alloc]init];
    
    
    [con obtenerLugar:[lugares_ordenados objectAtIndex:0]];
    
    
    if([Conexiones getSucces]==1){
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
        if([[Conexiones getTipo]isEqualToString:@"normal"]){
            
            if(![[[lugares_ordenados objectAtIndex:0]ciudad]isEqualToString:@"DF"]){
                 index.estado_label.text=[[NSString alloc]initWithFormat:@"%@",[[lugares_ordenados objectAtIndex:0]ciudad]];
                index.titulo.text=[[NSString alloc]initWithFormat:@"%@",[[lugares_ordenados objectAtIndex:0]lugar]];
            }else{
                index.estado_label.text=[[NSString alloc]initWithFormat:@"%@",[[lugares_ordenados objectAtIndex:0]ciudad]];
                index.titulo.text=[[NSString alloc]initWithFormat:@"%@",[[lugares_ordenados objectAtIndex:0]lugar_completo]];
                
            }
        }else{
            index.estado_label.text=[[NSString alloc]initWithFormat:@"%@",[[lugares_ordenados objectAtIndex:0]ciudad]];

            index.titulo.text=[[NSString alloc]initWithFormat:@"Valor Promedio" ];
        }
        index.imeca_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getImeca]];
        
        index.vistaCompartir.hidden=YES;

        [index setCiudadActual:[[lugares_ordenados objectAtIndex:0]lugar]];
        
        index.contaminante_label.text=[[NSString alloc]initWithFormat:@"%@",[Conexiones getContaminante]];
        index.temperatura_label.text=[[NSString alloc]initWithFormat:@"%@ºC",[Conexiones getTemperatura]];
        index.humedad_label.text=[[NSString alloc]initWithFormat:@"%@%%",[Conexiones getHumedad]];
        
        [index setEstado:[[NSString alloc]initWithFormat:@"%@",[[lugares_ordenados objectAtIndex:0]ciudad]]] ;
        
        
        [index calificar];
    }else{
        NoDisponibleViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"NoDisponible"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];
    }
    
   
}
-(void)lugarMasCercano{
   localizacion=[[Geolocalizacion alloc]init];
    [localizacion inicializar:lugares_ordenados];
   
}
- (void)dealloc {
    [imagenBarra release];
    [super dealloc];
}
-(void)setAccion:(NSString*)dato{
    accion=dato;
}
@end
