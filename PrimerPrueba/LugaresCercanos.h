//
//  LugaresCercanos.h
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 07/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LugaresCercanos : NSObject
@property(nonatomic,strong)NSString*ciudad;
@property(nonatomic,strong)NSString*lugar;
@property(nonatomic,strong)NSString*lugar_completo;
@property(nonatomic,readwrite)double dist;

@end
