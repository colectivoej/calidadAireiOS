//
//  nivelesImecaView.h
//  calidaddelaire
//
//  Created by Jose Eduardo Quintero Gutierrez on 26/08/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nivelesImecaView : UIViewController
@property (retain, nonatomic) IBOutlet UIView *tabla;
@property (retain, nonatomic) IBOutlet UIView *tabla2;

-(void)colocarTabla:(NSString*)tb;
@end
