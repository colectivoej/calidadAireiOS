//
//  IndexViewController.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 03/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController
@synthesize subView,subViewDetalles,botonCambiar,subViewPrincipal;
static NSString*ciudad_actual;
static bool compartir;

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
    
   
    [self configurarVistas];
    _mVulnerablesView.hidden=YES;
    
       
    NSLog(@"BOOL = %@\n", (compartir ? @"YES" : @"NO"));
    
  //  subView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3f];
  
   	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
   
}
-(void)configurarVistas{
    
//subView.frame=CGRectMake( 300, 200, subView.frame.size.width,subView.frame.size.height );
   //self.botonCambiar = [UIButton buttonWithType:UIButtonTypeCustom];
    //botonCambiar.backgroundColor = [UIColor redColor];
   // self.botonCambiar.layer.borderColor = [UIColor blackColor].CGColor;
        subViewPrincipal.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
      
    subView.backgroundColor=[[UIColor colorWithPatternImage:[UIImage imageNamed:@"pat3.png"]]colorWithAlphaComponent:0.5f];
    
    UIColor * color = [UIColor colorWithRed:25/255.0f green:156/255.0f blue:205/255.0f alpha:0.9f];
    //subView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5f];
    subView.backgroundColor=color;
    subViewDetalles.backgroundColor = color;
   // subViewDetalles.backgroundColor=[[UIColor colorWithPatternImage:[UIImage imageNamed:@"pat3.png"]]colorWithAlphaComponent:0.3f];
    // border radius
    [subView.layer setCornerRadius:20.0f];
    [subViewDetalles.layer setCornerRadius:20.0f];
    
    // border
    [subView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [subView.layer setBorderWidth:0.0f];
    
    [subViewDetalles.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [subViewDetalles.layer setBorderWidth:0.0f];

    
    // drop shadow
    [subView.layer setShadowColor:[UIColor blackColor].CGColor];
    [subView.layer setShadowOpacity:0.8];
    [subView.layer setShadowRadius:3.0];
    [subView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [subViewDetalles.layer setShadowColor:[UIColor blackColor].CGColor];
    [subViewDetalles.layer setShadowOpacity:0.8];
    [subViewDetalles.layer setShadowRadius:3.0];
    [subViewDetalles.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)presionarMasVuln:(id)sender {
    _vulnerablesBotonActivo.hidden=YES;
    _sombraVulnerables.hidden=YES;
    _sombraVulnerables2.hidden=YES;
    _vulnerablesView.hidden=YES;
    
    _mVulnerablesView.hidden=NO;
    _botonMasVuln.hidden=YES;
    _botonMasVulnActivo.hidden=NO;
    _sombraMasVuln.hidden=NO;
    _sombraMasVuln2.hidden=NO;
    
    _botonVulnerables.hidden=NO;
    
    [self consejosMV:@"ciclista"];
    
}

- (IBAction)presionarVulnerables:(id)sender {
    _vulnerablesBotonActivo.hidden=NO;
    _sombraVulnerables.hidden=NO;
    _sombraVulnerables2.hidden=NO;
    _vulnerablesView.hidden=NO;
    
    _mVulnerablesView.hidden=YES;
    _botonMasVuln.hidden=NO;
    _botonMasVulnActivo.hidden=YES;
    _sombraMasVuln.hidden=YES;
    _sombraMasVuln2.hidden=YES;
    
    _botonVulnerables.hidden=YES;

}

- (IBAction)compartir:(id)sender {
    subViewPrincipal.hidden=NO;
}

- (IBAction)facebookBtn:(id)sender {
    SLComposeViewController*facebook=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        facebook=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebook setInitialText:[[NSString alloc]initWithFormat:@"La calidad de aire en %@ es %@.",ciudad_actual,_calificacion.text]];
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
            
            //[self dismissViewControllerAnimated:YES completion:nil];
            
            
        };
        
        // por último mostramos la interfaz de publicación
        [self presentViewController:facebook animated:YES completion:nil];
        
        // asignamos el completionHandler para manipular los resultados del envío
        [facebook setCompletionHandler:completionHandler];
        
        subViewPrincipal.hidden=YES;
        
    }
    
}

- (IBAction)twitterBtn:(id)sender {
    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
    // ponemos un texto inicial para la publicación
    [twitter setInitialText:[[NSString alloc]initWithFormat:@"La calidad de aire en %@ es %@.",ciudad_actual,_calificacion.text]];
    
    // añadimos una imagen a nuestra publicación
    [twitter addImage:[UIImage imageNamed:@"calidad_del_aire_logo_redes.png"]];
    
    // añadimos también una URL
    [twitter addURL:[NSURL URLWithString:@"https://play.google.com/store/apps/details?id=com.avitia.calidaddelaire&hl=es"]];
    
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
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    };
    
    // por último mostramos la interfaz de publicación
    [self presentViewController:twitter animated:YES completion:nil];
    
    // asignamos el completionHandler para manipular los resultados del envío
    [twitter setCompletionHandler:completionHandler];
    
    subViewPrincipal.hidden=YES;
   
}

- (IBAction)cancelar:(id)sender {
    subViewPrincipal.hidden=YES;
}

-(void)calificar{
    
    imeca_int=[_imeca_label.text intValue];

    if(![estado isEqualToString:@"Monterrey"]){
    
    if(imeca_int>200){
        _calificacion.text=@"EXT MALA";
         _cal_imagen.image=[UIImage imageNamed:@"num_extmala.png"];
        [_imecaView setBackgroundColor:[UIColor colorWithRed:(164/255.0) green:(30/255.0) blue:(27/255.0) alpha:1]];
        [self consejosVulnerablesExtMala];
        calificacion_int=0;
    }else{
        if(imeca_int>150){
            _calificacion.text=@"MUY MALA";
             _cal_imagen.image=[UIImage imageNamed:@"num_muymala.png"];
            [_imecaView setBackgroundColor:[UIColor colorWithRed:(240/255.0) green:(67/255.0) blue:(35/255.0) alpha:1]];
            [self consejosVulnerablesMuyMala];
            calificacion_int=1;
            
        }else{
            if(imeca_int>100){
                _calificacion.text=@"MALA";
                 _cal_imagen.image=[UIImage imageNamed:@"num_mala.png"];
                [_imecaView setBackgroundColor:[UIColor colorWithRed:(250/255.0) green:(166/255.0) blue:(52/255.0) alpha:1]];
                
                [self consejosVulnerablesMala];
                calificacion_int=2;
            }else{
                if(imeca_int>50){
                    _calificacion.text=@"REGULAR";
                     _cal_imagen.image=[UIImage imageNamed:@"num_regular.png"];
                    [_imecaView setBackgroundColor:[UIColor colorWithRed:(251/255.0) green:(230/255.0) blue:(25/255.0) alpha:1]];
                    [self consejosVulnerablesRegular];
                    calificacion_int=3;
                }else{
                    if(imeca_int>0){
                        _calificacion.text=@"BUENA";
                        _cal_imagen.image=[UIImage imageNamed:@"num_buena.png"];
                        [_imecaView setBackgroundColor:[UIColor colorWithRed:(105/255.0) green:(189/255.0) blue:(75/255.0) alpha:1]];
                        [self consejosVulnerablesBuena];
                        calificacion_int=4;
                    }
                }
            }
        }
        
    }
    }else{
        if(imeca_int>500){
            _calificacion.text=@"EXT MALA";
            _cal_imagen.image=[UIImage imageNamed:@"num_extmala.png"];
            [_imecaView setBackgroundColor:[UIColor colorWithRed:(164/255.0) green:(30/255.0) blue:(27/255.0) alpha:1]];
            [self consejosVulnerablesExtMala];
            calificacion_int=0;
        }else{
            if(imeca_int>301){
                _calificacion.text=@"MUY MALA";
                _cal_imagen.image=[UIImage imageNamed:@"num_muymala.png"];
                [_imecaView setBackgroundColor:[UIColor colorWithRed:(240/255.0) green:(67/255.0) blue:(35/255.0) alpha:1]];
                [self consejosVulnerablesMuyMala];
                calificacion_int=1;
                
            }else{
                if(imeca_int>201){
                    _calificacion.text=@"MALA";
                    _cal_imagen.image=[UIImage imageNamed:@"num_mala.png"];
                    [_imecaView setBackgroundColor:[UIColor colorWithRed:(250/255.0) green:(166/255.0) blue:(52/255.0) alpha:1]];
                    
                    [self consejosVulnerablesMala];
                    calificacion_int=2;
                }else{
                    if(imeca_int>101){
                        _calificacion.text=@"REGULAR";
                        _cal_imagen.image=[UIImage imageNamed:@"num_regular.png"];
                        [_imecaView setBackgroundColor:[UIColor colorWithRed:(251/255.0) green:(230/255.0) blue:(25/255.0) alpha:1]];
                        [self consejosVulnerablesRegular];
                        calificacion_int=3;
                    }else{
                        if(imeca_int>0){
                            _calificacion.text=@"BUENA";
                            _cal_imagen.image=[UIImage imageNamed:@"num_buena.png"];
                            [_imecaView setBackgroundColor:[UIColor colorWithRed:(105/255.0) green:(189/255.0) blue:(75/255.0) alpha:1]];
                            [self consejosVulnerablesBuena];
                            calificacion_int=4;
                        }
                    }
                }
            }

      }
    }
    [self animacionuiView];
    
    [self consejosMV:@"bebe"];
   
}
-(void)consejosMV:(NSString*)tipo{
    
    if([tipo isEqualToString:@"bebe"]){
    switch (calificacion_int) {
        case 0:
            _mVulnerablesLabel.text=@"-Evita salir a la calle en la medida de los posible.\n-Procura que niños y niñas realicen las actividades físicas en instalaciones cerradas.\n-Aumenta el Consumo de antioxidantes en la dieta de los niños y niñas recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-En caso de tener alguna enfermedad respiratoria esta puede agravarse de manera crónica.";
            break;
            
        case 1:
            _mVulnerablesLabel.text=@"-Evita salir a la calle en la medida de los posible.\n-Procura que niños y niñas realicen las actividades físicas en instalaciones cerradas.\n-Aumenta el Consumo de antioxidantes en la dieta de los niños y niñas recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-Pueden comenzar síntomas de alguna enfermedad respiratorias";

            break;
            
        case 2:
            _mVulnerablesLabel.text=@"-Reprograma actividades al aire libre en los horarios y temporadas en que la contaminación es comparativamente más baja. Guíate por la información de la estación de monitoreo más cercana.\n-Educa a los niños y niñas sobre las consecuencias de la mala calidad del aire, probablemente les quede una vida por delante en ciudades contaminadas.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios recomendado por el médico.\n\nEFECTOS A LA SALUD: \n-Los niños tienen riesgo de sufrir los mayores efectos negativos a la salud por la exposición a la mala calidad del  aire.";

            break;
            
        case 3:
            
            _mVulnerablesLabel.text=@"-Ponte alerta, la OMS considera de riesgo estas concentraciones de contaminantes.\n-Recomienda a niños y niñas no jugar a menos de cinco calles de avenidas muy transitadas.\n\nEFECTOS A LA SALUD: \n-Los niños tienden a pasar más tiempo al aire libre realizando actividades vigorosas, como la práctica de deportes, por lo que respiran proporcionalmente más aire, esto puede tener en algunos caso efectos a la salud.";
            break;
        case 4:
              _mVulnerablesLabel.text=@"-Realiza con normalidad tus actividades al aire libre.\n\nEFECTOS A LA SALUD: \n-En este nivel la exposición a los contaminantes se encuentra dentro de parámetros permitidos, sin embargo algunas personas pueden presentar algunas molestias.";
            break;
    }
    }
    if([tipo isEqualToString:@"ciclista"]){
        switch (calificacion_int) {
            case 0:
                _mVulnerablesLabel.text=@"-Utiliza una máscara anti-contaminación especialmente diseñada para ciclistas.\n-Evita el tráfico en horas pico. \n-Busca rutas alternas alejadas del trafico.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios  recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-Pedalear por lugares con altos niveles de contaminación puede traer serios problemas a la salud.";
                break;
                
            case 1:
                _mVulnerablesLabel.text=@"-Utiliza una máscara anti-contaminación especialmente diseñada para ciclistas.\n-Evita el tráfico en horas pico. \n-Busca rutas alternas alejadas del trafico.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios  recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-Pedalear por lugares con altos niveles de contaminación puede traer serios problemas a la salud.";
                
                break;
                
            case 2:
                _mVulnerablesLabel.text=@"-Reduce tu exposición utilizando calles secundarias en lugar de avenidas con  mucho tránsito.\n-Prefiere rutas arboladas. \nConsume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios  recomendados por el médico\n\nEFECTOS A LA SALUD: \n-Algunos efectos inmediatos como tos, irritación de ojos y garganta se pueden agravar.";
                
                break;
                
            case 3:
                
                _mVulnerablesLabel.text=@"-Ponte alerta, la OMS considera de riesgo estas concentraciones de contaminantes.\n-Prefiere rutas arboladas que ofrecen protección de la contaminación del aire.\n\nEFECTOS A LA SALUD: \n-Los ciclistas están más expuestos a los efectos negativos a la salud por la mala calidad del aire.";
                break;
            case 4:
                _mVulnerablesLabel.text=@"-Realiza con normalidad tus actividades al aire libre.\n\nEFECTOS A LA SALUD: \n-En este nivel la exposición a los contaminantes se encuentra dentro de parámetros permitidos, sin embargo algunas personas pueden presentar algunas molestias.";
                break;
        }
    }
    if([tipo isEqualToString:@"embarazada"]){
        switch (calificacion_int) {
            case 0:
                _mVulnerablesLabel.text=@"-Disminuye tu actividad física al aire libre al mínimo.\n-Si la actividad al aire libre es forzosa utiliza una máscara anticontaminación como als que usan los ciclistas.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios recomendados por el médico.\nEFECTOS A LA SALUD: \n-Algunos estudios menciona que el impacto de los contaminantes ambientales puede ser de largo alcance ya que puede afectar el desarrollo en el útero.";
                break;
                
            case 1:
                _mVulnerablesLabel.text=@"-Disminuye tu actividad física al aire libre al mínimo.\n-Si la actividad al aire libre es forzosa utiliza una máscara anticontaminación como als que usan los ciclistas.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-Algunos estudios menciona que el impacto de los contaminantes ambientales puede ser de largo alcance ya que puede afectar el desarrollo en el útero.";
                
                break;
                
            case 2:
                _mVulnerablesLabel.text=@"-Evita los lugares muy contaminados, monitorea de manera rutinaria la calidad del aire en tu ciudad.\n-Aumenta el número de antioxidantes en tu dieta, especialmente consumiendo frutas frescas y vegetales.\n-Visita al doctor de manera regular para checar tu salud y la de tu bebé.\n\nEFECTOS A LA SALUD: \n-La salud del Feto puede verse afectada por la mala calidad del aire";
                
                break;
                
            case 3:
                
                _mVulnerablesLabel.text=@"-Ponte alerta, la OMS considera de riesgo estas concentraciones de contaminantes.\n-Evita los lugares muy contaminados, especialmente en el primer trimestre del embarazo y en los últimos meses antes del parto.\n\nEFECTOS A LA SALUD: \n-La exposición prenatal a  los contaminantes del aire puede resultar en un individuo con impedimentos físicos a largo plazo.\n-Los contaminantes del aire pueden provocar partos prematuros, lo cual incrementa la vulnerabilidad debido al menor desarrollo de los pulmones y del sistema  inmunológico Las partículas más finas  pueden entrar a través  de los pulmones y llegar al feto por la sangre.";
                break;
            case 4:
                _mVulnerablesLabel.text=@"-Realiza con normalidad tus actividades al aire libre.\n\nEFECTOS A LA SALUD: \n-En este nivel la exposición a los contaminantes se encuentra dentro de parámetros permitidos, sin embargo algunas personas pueden presentar algunas molestias.";
                break;
        }
    }
    if([tipo isEqualToString:@"anciano"]){
        switch (calificacion_int) {
            case 0:
                _mVulnerablesLabel.text=@"-Evita realizar actividades al aire libre.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios  recomendados por el  médico.\n\nEFECTOS A LA SALUD: \n-La enfermedades respiratorias se pueden agravar por la mala calidad del aire.";
                break;
                
            case 1:
                _mVulnerablesLabel.text=@"-Evita realizar actividades al aire libre.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios  recomendados por el  médico.\n\nEFECTOS A LA SALUD: \n-La enfermedades respiratorias se pueden agravar por la mala calidad del aire.";
                
                break;
                
            case 2:
                _mVulnerablesLabel.text=@"-Disminuye tu actividad física al aire libre.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-La capacidad pulmonar se reduce por el envejecimiento y puede empeorar a causa de la contaminación del aire.";
                
                break;
                
            case 3:
                
                _mVulnerablesLabel.text=@"-Ponte alerta, la OMS considera de riesgo estas concentraciones de contaminantes.\n-Para caminar, prefiere parques, calles arboladas y bosques.\n-Refuerza tu sistema inmunológico con dieta apropiada y antioxidantes.\n\nEFECTOS A LA SALUD: \n-Un sistema inmunológico débil es más propenso a sufrir daños por la contaminación  atmosférica.";
                break;
            case 4:
                _mVulnerablesLabel.text=@"-Realiza con normalidad tus actividades al aire libre.\n\nEFECTOS A LA SALUD: \n-En este nivel la exposición a los contaminantes se encuentra dentro de parámetros permitidos, sin embargo algunas personas pueden presentar algunas molestias.";
                break;
        }
    }
    if([tipo isEqualToString:@"enfermo"]){
        switch (calificacion_int) {
            case 0:
                _mVulnerablesLabel.text=@"-Evita realizar actividades al aire libre.\n-En caso de ser asmático vas a realizar actividades al aire libre, ten a la mano tu inhalador en óptimas condiciones.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-El ozono influye negativamente en el intercambio de gases en el pulmón y por ello empeora la insuficiencia cardiaca congestiva o  enfermedad de la arteria coronaria.";
                break;
                
            case 1:
                _mVulnerablesLabel.text=@"-Evita realizar actividades al aire libre.\n-En caso de ser asmático vas a realizar actividades al aire libre, ten a la mano tu inhalador en óptimas condiciones.\n-Consume un extra de antioxidantes ya sea de manera natural a través de las frutas o suplementos alimenticios recomendados por el médico.\n\nEFECTOS A LA SALUD: \n-Los síntomas del asma y otras enfermedades se agravan.";
                
                break;
                
            case 2:
                _mVulnerablesLabel.text=@"-Evita realizar actividades al aire libre.\n-En caso de ser asmático vas a realizar actividades al aire libre, ten a la mano tu inhalador en óptimas condiciones.\n\nEFECTOS A LA SALUD: \n-Los contaminantes del aire pueden provocar ataques de asma y reforzar el potencial de los alérgenos.";
                
                break;
                
            case 3:
                
                _mVulnerablesLabel.text=@"-Ponte alerta, la OMS considera de riesgo estas concentraciones de contaminantes.\n-Si has estado expuesto o te expondrás a contaminantes atmosféricos, consulta con tu médico si las dosis y/o los  medicamentos que toma deben ser ajustados. \n\nEFECTOS A LA SALUD: \n-La presencia de los contaminantes atmosféricos puede empeorar las enfermedades  respiratorias  preexistentes.";
                break;
            case 4:
                _mVulnerablesLabel.text=@"-Realiza con normalidad tus actividades al aire libre.\n\nEFECTOS A LA SALUD: \n-En este nivel la exposición a los contaminantes se encuentra dentro de parámetros permitidos, sin embargo algunas personas pueden presentar algunas molestias.";
                break;
        }
    }
   
}
-(void)animacionuiView{
   // subView.frame=CGRectMake( 100, 200, subView.frame.size.width,subView.frame.size.height );
}
-(void)consejosVulnerablesBuena{
    
    _vulnerablesLabel.text=@"-Realiza con normalidad tus actividades al aire libre. \n\nEFECTOS A LA SALUD: \n-No hay efectos dañinos a la salud.";
}
-(void)consejosVulnerablesRegular{
    _vulnerablesLabel.text=@"-Ponte alerta, la OMS considera de riesgo estas concentraciones de contaminantes. \n\nEFECTOS A LA SALUD: \n-Ojos irritados.\n-Incremento en la producción de mucosidad en nariz y garganta.\n-Tos.\n-Dificultad para respirar especialmente cuando se hace ejercicio.";

    
}
-(void)consejosVulnerablesMala{
    _vulnerablesLabel.text=@"-Evita circular por calles y avenidas con gran carga vehicular.\n-Fortalece tu dieta comiendo antioxidantes (Frutas frescas y verduras). \n-Si eres ciclista utiliza una máscara anticontaminación Evita la actividad física vigorosa en áreas con mala calidad del aire.\n\nEFECTOS A LA SALUD: \n-Ojos irritados.\n-Incremento en la producción de mucosidad en nariz y garganta.\n-Tos.\n-Dificultad para respirar especialmente cuando se hace ejercicio.";

}
-(void)consejosVulnerablesMuyMala{
    _vulnerablesLabel.text=@"-Evita salir a la calle en la medida de los posible.\n-Evita caminar por calles y avenidas con gran carga vehicular.\n-Fortalece tu dieta comiendo antioxidantes (Frutas frescas y verduras).\n-Si eres ciclista utiliza una máscara anticontaminación.\n-Evita la actividad física vigorosa en áreas con mala calidad del aire.\n\nEFECTOS A LA SALUD: \n-Ojos irritados.\n-Incremento en la producción de mucosidad en nariz y garganta.\n-Tos.\n-Dificultad para respirar especialmente cuando se hace ejercicio.";

}
-(void)consejosVulnerablesExtMala{
    _vulnerablesLabel.text=@"-Evita salir a la calle en la medida de los posible.\n-Evita caminar por calles y avenidas con gran carga vehicular.\n-Fortalece tu dieta comiendo antioxidantes (Frutas frescas y verduras).\n-Si eres ciclista utiliza una máscara anticontaminación.\n-Evita la actividad física vigorosa en áreas con mala calidad del aire.\n\nEFECTOS A LA SALUD: \n-Ojos irritados.\n-Incremento en la producción de mucosidad en nariz y garganta.\n-Tos.\n-Dificultad para respirar especialmente cuando se hace ejercicio.";

    
}
- (void)dealloc {
    
    [_temperatura_label release];
    [_humedad_label release];
    [_imeca_label release];
    [_contaminante_label release];
    
    [_calificacion release];
    [_cal_imagen release];

    [_titulo release];
    [botonCambiar release];
    [subViewPrincipal release];
  
    [_estatus_lbl release];
    [_vulnerablesView release];
    [_vulnerablesLabel release];
    [_controlVuln release];
    [_mVulnerablesLabel release];
    [_mVulnerablesView release];
    
    [_botonMasVuln release];
    [_vulnerablesBotonActivo release];
    [_sombraVulnerables release];
    [_sombraVulnerables2 release];
    [_botonMasVulnActivo release];
    [_sombraMasVuln release];
    [_sombraMasVuln2 release];
    [_botonVulnerables release];
    [_ciclistaboton release];
    [_bebeboton release];
    [_embarazadaboton release];
    [_ancianoboton release];
    [_enfermoboton release];
    [_imecaView release];
    [_botonMas release];
    [_estado_label release];

    [_vistaCompartir release];
    [super dealloc];
}
-(void)setCiudadActual:(NSString*)ciudad{
    ciudad_actual=ciudad;
}

- (IBAction)cambiarControl:(id)sender {
    if(_controlVuln.selectedSegmentIndex==0){
        _vulnerablesView.hidden=NO;
        _mVulnerablesView.hidden=YES;
    }else{
        if(_controlVuln.selectedSegmentIndex==1){
            _vulnerablesView.hidden=YES;
            _mVulnerablesView.hidden=NO;
            [self consejosMV:@"bebe"];
        }
    }
}
- (IBAction)ninosAccion:(id)sender {
    [self consejosMV:@"bebe"];
    
    _bebeboton.selected=YES;
    _ciclistaboton.selected=NO;
    _embarazadaboton.selected=NO;
    _ancianoboton.selected=NO;
    _enfermoboton.selected=NO;
}

- (IBAction)ciclistasAccion:(id)sender {
    [self consejosMV:@"ciclista"];
    _bebeboton.selected=NO;
    _ciclistaboton.selected=YES;
    _embarazadaboton.selected=NO;
    _ancianoboton.selected=NO;
    _enfermoboton.selected=NO;
}

- (IBAction)embarazadasAccion:(id)sender {
    [self consejosMV:@"embarazada"];
    _bebeboton.selected=NO;
    _ciclistaboton.selected=NO;
    _embarazadaboton.selected=YES;
    _ancianoboton.selected=NO;
    _enfermoboton.selected=NO;
}

- (IBAction)ancianosAccion:(id)sender {
    [self consejosMV:@"anciano"];
    _bebeboton.selected=NO;
    _ciclistaboton.selected=NO;
    _embarazadaboton.selected=NO;
    _ancianoboton.selected=YES;
    _enfermoboton.selected=NO;
}

- (IBAction)enfermosAccion:(id)sender {
    [self consejosMV:@"enfermo"];
    _bebeboton.selected=NO;
    _ciclistaboton.selected=NO;
    _embarazadaboton.selected=NO;
    _ancianoboton.selected=NO;
    _enfermoboton.selected=YES;
}

- (IBAction)flechaDerecha:(id)sender {
    if([estado isEqualToString:@"Guadalajara"]){
        NSLog(@"Monterrey");
        
        LoadingPantalla*load=[[LoadingPantalla alloc]init];
        [load setAccion:@"promedio_mty"];
        
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];

    }
    if([estado isEqualToString:@"Monterrey"]){
        NSLog(@"DF");
        
        LoadingPantalla*load=[[LoadingPantalla alloc]init];
        [load setAccion:@"promedio_df"];
        
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];

    }
    if([estado isEqualToString:@"DF"]){
         NSLog(@"Guadalajara");
        
        LoadingPantalla*load=[[LoadingPantalla alloc]init];
        [load setAccion:@"promedio_gdl"];
        
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];

    }
}

- (IBAction)flechaIzquierda:(id)sender {
    if([estado isEqualToString:@"Guadalajara"]){
        NSLog(@"DF");
        LoadingPantalla*load=[[LoadingPantalla alloc]init];
        [load setAccion:@"promedio_df"];
        
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];

    }
    if([estado isEqualToString:@"Monterrey"]){
        NSLog(@"Guadalajara");
        LoadingPantalla*load=[[LoadingPantalla alloc]init];
        [load setAccion:@"promedio_gdl"];
        
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];

    }
    if([estado isEqualToString:@"DF"]){
        NSLog(@"Monterrey");
        LoadingPantalla*load=[[LoadingPantalla alloc]init];
        [load setAccion:@"promedio_mty"];
        
        IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"loadScreen"];
        
        index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
        [self presentViewController:index animated:YES completion:^{
        }];

    }
}

-(void)compartirFacebook{
    
    SLComposeViewController*facebook=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        facebook=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebook setInitialText:[[NSString alloc]initWithFormat:@"La calidad de aire en %@ es %@. \nImeca:%@ \nContaminante:%@",ciudad_actual,_calificacion.text,_imeca_label.text,_contaminante_label.text]];
        [facebook addImage:[UIImage imageNamed:@"calidad_del_aire_logo_redes.png"]];
        [facebook addURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/calidad-del-aire-mexico/id579020049?l=es&ls=1&mt=8"]];

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
         [facebook setCompletionHandler:completionHandler];
        
        
        compartir=false;
        // asignamos el completionHandler para manipular los resultados del envío
                
        
    }
    
}
-(void)compartirTwitter{
    
    SLComposeViewController*twitter=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        twitter=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitter setInitialText:[[NSString alloc]initWithFormat:@"La calidad de aire en %@ es %@. \nImeca:%@ \nContaminante:%@",ciudad_actual,_calificacion.text,_imeca_label.text,_contaminante_label.text]];
        [twitter addImage:[UIImage imageNamed:@"calidad_del_aire_logo_redes.png"]];
        [twitter addURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/calidad-del-aire-mexico/id579020049?l=es&ls=1&mt=8"]];
        
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
        [self presentViewController:twitter animated:YES completion:nil];
        [twitter setCompletionHandler:completionHandler];
        
        
        compartir=false;
        // asignamos el completionHandler para manipular los resultados del envío
        
        
    }
    
}
-(void)setCompartir:(bool)dato{
    compartir=dato;
}
-(void)setEstado:(NSString*)est{
    estado=est;
}

- (IBAction)accionMasBoton:(id)sender {
    nivelesImecaView*imec=[[nivelesImecaView alloc]init];
    imec=[[self storyboard]instantiateViewControllerWithIdentifier:@"nivelesImeca"];
    NSLog(@"%@",estado);
    if([estado isEqualToString:@"Monterrey"]){
        [self presentViewController:imec animated:YES completion:^{[imec colocarTabla:@"Monterrey"];}];

    }else{
        [self presentViewController:imec animated:YES completion:^{[imec colocarTabla:@"Normal"];}];
    }
    


}


- (IBAction)compTwitter:(id)sender {
    [self compartirTwitter];
}

- (IBAction)compFacebook:(id)sender {
    [self compartirFacebook];
}
@end
