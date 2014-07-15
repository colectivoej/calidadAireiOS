//
//  GlosarioNuevoViewController.m
//  calidaddelaire
//
//  Created by Jose Eduardo Quintero Gutierrez on 23/07/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "GlosarioNuevoViewController.h"

@interface GlosarioNuevoViewController (){
    GlosarioDatos*datos;
    NSMutableArray*datosTablas;
}

@end

@implementation GlosarioNuevoViewController

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
    datos=[[GlosarioDatos alloc]init];
    
    [datos datosGlosario];
    
    
    datosTablas=[[NSMutableArray alloc]initWithArray:[datos getArregloGlosarioDatos]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*identificador=@"identificador";
    
    UITableViewCell*celda=[tableView dequeueReusableCellWithIdentifier:identificador];
    
    if(celda==nil){
        celda=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    
    celda.textLabel.text=[[datosTablas objectAtIndex:indexPath.row]titulo_glosario];
    
    return celda;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [datosTablas count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetallesGlosarioViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"DetallesGlosarioViewController2"];
    
    index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
    
    
    [self presentViewController:index animated:YES completion:^{
    }];
  
        
        index.caja_texto.text=[[datosTablas objectAtIndex:indexPath.row]detalles];
        index.titulolbl.text=[[datosTablas objectAtIndex:indexPath.row]titulo_glosario];
    
    
  
}
@end
