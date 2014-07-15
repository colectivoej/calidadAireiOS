//
//  GlosarioViewController.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 07/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "GlosarioViewController.h"

@interface GlosarioViewController (){
    GlosarioDatos*datos;
}

@end

@implementation GlosarioViewController
@synthesize estaFiltrando;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) hideKeyboard {
    [searchBar resignFirstResponder];
      
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [searchBar resignFirstResponder];
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
    
    NSLog(@"%@",[[datosTablas objectAtIndex:0]titulo_glosario]);
    
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",[detalles objectAtIndex:indexPath.row]);
    
    DetallesGlosarioViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"DetallesGlosarioViewController"];
    
    index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;

    
    [self presentViewController:index animated:YES completion:^{
    }];
    if(estaFiltrando==NO){
    
    index.caja_texto.text=[[datosTablas objectAtIndex:indexPath.row]detalles];
    index.titulolbl.text=[[datosTablas objectAtIndex:indexPath.row]titulo_glosario];
    }else{
        index.caja_texto.text=[[filtroDatosTablas objectAtIndex:indexPath.row]detalles];
        index.titulolbl.text=[[filtroDatosTablas objectAtIndex:indexPath.row]titulo_glosario];

    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*identificador=@"MyCell";
    Cell*celda=[tableView dequeueReusableCellWithIdentifier:identificador];
    if(celda==nil){
        celda=[[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    if(estaFiltrando==YES){
        celda.titulo.text=[[filtroDatosTablas objectAtIndex:indexPath.row]titulo_glosario];
        
        
    }else{
        celda.titulo.text=[[datosTablas objectAtIndex:indexPath.row]titulo_glosario];
    }
    
  
    return celda;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(estaFiltrando==YES){
    return [filtroDatosTablas count];
    }else{
        return [datosTablas count];
    }
}

-(void)searchBar:(UISearchBar*)asearchBar textDidChange:(NSString *)searchText{
    
        
    if(searchText.length==0){
        estaFiltrando=NO;
        
    }else{
        estaFiltrando=YES;
        
        filtroDatosTablas=[[NSMutableArray alloc]init];
    }
    
    for(int i=0;i<=[datosTablas count]-1;i++){
        NSString*tituloDato=[[datosTablas objectAtIndex:i]titulo_glosario];
        NSRange rangoTitulo=[tituloDato rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        if(rangoTitulo.location!=NSNotFound){
            Glosario*glor=[[Glosario alloc]init];
            glor.titulo_glosario=tituloDato;
            glor.detalles=[[datosTablas objectAtIndex:i]detalles];
            [filtroDatosTablas addObject:glor];
        }
        //NSRange
    }
       [tabla reloadData];
   
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)asearchBar{
    [searchBar resignFirstResponder];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)asearchBar{
    [searchBar resignFirstResponder];
}


@end
