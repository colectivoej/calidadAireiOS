//
//  LoadingPantallaCompartir.m
//  calidaddelaire
//
//  Created by Jose Eduardo Quintero Gutierrez on 31/07/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "LoadingPantallaCompartir.h"

@interface LoadingPantallaCompartir (){
 Geolocalizacion*localizacion;
}
@end
static int porcentaje=20;
@implementation LoadingPantallaCompartir
@synthesize imagenBarra;
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
    
}
-(void)viewDidAppear:(BOOL)animated{
    progreso=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    DatosLugares*datos=[[DatosLugares alloc]init];
    [datos datosLugares];
    lugares_ordenados=[[NSMutableArray alloc]init];
    lugares_ordenados=[datos getArregloDatosLugares];
    
    [self lugarMasCercano];
    porcentaje=100;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)lugarMasCercano{
    localizacion=[[Geolocalizacion alloc]init];
    [localizacion inicializar:lugares_ordenados];
    
}
+(void)setPorcentaje:(int)porcentaje_valor{
    porcentaje=porcentaje_valor;
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
            
          
        [self ejecutarCalidadAire];
    }
}

-(void)ejecutarCalidadAire{
    
    lugares_ordenados=[localizacion getArregloDistancias];
    NSLog(@"%@",[[lugares_ordenados objectAtIndex:0]lugar]);
    
    Conexiones*con=[[Conexiones alloc]init];
    
    
    [con obtenerLugar:[lugares_ordenados objectAtIndex:0]];
    
    
    if([Conexiones getSucces]==1){
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
        
        [index setCompartir:true];
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
        
        index.vistaCompartir.hidden=NO;
        index.vulnerablesView.hidden=YES;
        index.vulnerablesBotonActivo.hidden=YES;
        index.vulnerablesLabel.hidden=YES;
        index.mVulnerablesView.hidden=YES;
        index.mVulnerablesLabel.hidden=YES;
        index.sombraMasVuln.hidden=YES;
        index.sombraMasVuln2.hidden=YES;
        index.sombraVulnerables.hidden=YES;
        index.sombraVulnerables2.hidden=YES;
        index.botonMasVuln.hidden=YES;

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
-(void)compartir{
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


@end
