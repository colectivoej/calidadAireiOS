//
//  IndexViewController.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 03/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Conexiones.h"
#import <Social/Social.h>
#import "LoadingPantalla.h"
#import "nivelesImecaView.h"
@interface IndexViewController : UIViewController{
    int imeca_int;
    int calificacion_int;
    NSString*estado;

}
- (IBAction)accionMasBoton:(id)sender;
- (IBAction)compTwitter:(id)sender;
- (IBAction)compFacebook:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *vistaCompartir;
@property (retain, nonatomic) IBOutlet UILabel *titulo;
@property (retain, nonatomic) IBOutlet UILabel *calificacion;

@property (retain, nonatomic) IBOutlet UILabel *contaminante_label;
@property (retain, nonatomic) IBOutlet UILabel *temperatura_label;
@property (retain, nonatomic) IBOutlet UILabel *humedad_label;
@property (retain, nonatomic) IBOutlet UILabel *imeca_label;

@property (retain, nonatomic) IBOutlet UIImageView *cal_imagen;
@property(nonatomic,retain)IBOutlet UIView*subView;
@property (retain, nonatomic) IBOutlet UIView *subViewPrincipal;
@property (retain, nonatomic) IBOutlet UILabel *estatus_lbl;

@property (retain, nonatomic) IBOutlet UIView *subViewDetalles;
@property (retain, nonatomic) IBOutlet UIButton *botonCambiar;

@property (retain, nonatomic) IBOutlet UISegmentedControl *controlVuln;
@property (retain, nonatomic) IBOutlet UIView *vulnerablesView;
@property (retain, nonatomic) IBOutlet UITextView *vulnerablesLabel;
@property (retain, nonatomic) IBOutlet UITextView *mVulnerablesLabel;
@property (retain, nonatomic) IBOutlet UIView *mVulnerablesView;
@property (retain, nonatomic) IBOutlet UIView *imecaView;
@property (retain, nonatomic) IBOutlet UIButton *botonMas;

//BOTONES Y SOMBRAS
@property (retain, nonatomic) IBOutlet UIButton *botonMasVuln;
- (IBAction)presionarMasVuln:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *vulnerablesBotonActivo;
@property (retain, nonatomic) IBOutlet UIView *sombraVulnerables;
@property (retain, nonatomic) IBOutlet UIView *sombraVulnerables2;

@property (retain, nonatomic) IBOutlet UIButton *botonMasVulnActivo;

@property (retain, nonatomic) IBOutlet UIView *sombraMasVuln;
@property (retain, nonatomic) IBOutlet UIView *sombraMasVuln2;
@property (retain, nonatomic) IBOutlet UIButton *botonVulnerables;
- (IBAction)presionarVulnerables:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *estado_label;


- (IBAction)compartir:(id)sender;
- (IBAction)facebookBtn:(id)sender;
- (IBAction)twitterBtn:(id)sender;
- (IBAction)cancelar:(id)sender;

-(void)setCiudadActual:(NSString*)ciudad;
- (IBAction)cambiarControl:(id)sender;

-(void)calificar;

//MAS VULNERABLES ACCIONES
- (IBAction)ninosAccion:(id)sender;
- (IBAction)ciclistasAccion:(id)sender;
- (IBAction)embarazadasAccion:(id)sender;
- (IBAction)ancianosAccion:(id)sender;
- (IBAction)enfermosAccion:(id)sender;


- (IBAction)flechaDerecha:(id)sender;
- (IBAction)flechaIzquierda:(id)sender;


//MAS VULN BOTONES
@property (retain, nonatomic) IBOutlet UIButton *ciclistaboton;
@property (retain, nonatomic) IBOutlet UIButton *bebeboton;
@property (retain, nonatomic) IBOutlet UIButton *embarazadaboton;
@property (retain, nonatomic) IBOutlet UIButton *ancianoboton;
@property (retain, nonatomic) IBOutlet UIButton *enfermoboton;



-(void)compartirFacebook;
-(void)setCompartir:(bool)dato;
-(void)setEstado:(NSString*)est;
@end
