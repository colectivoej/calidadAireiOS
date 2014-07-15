//
//  GlosarioViewController.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 07/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "DetallesGlosarioViewController.h"
#import "GlosarioDatos.h"
#import "Glosario.h"
@interface GlosarioViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
    NSMutableArray*titulos;
    NSMutableArray*detalles;
    
    IBOutlet UISearchBar*searchBar;
    IBOutlet UITableView*tabla;
    
    NSMutableArray*datosTablas;
    NSMutableArray*filtroDatosTablas;
}
@property BOOL estaFiltrando;

@end
