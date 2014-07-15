//
//  Conexiones.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 08/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "Conexiones.h"

@implementation Conexiones
static NSString*contaminante_;
static NSString*imeca_;
static NSString*humedad_;
static NSString*temperatura_;
static NSInteger succes_;
static NSString*tipo_;

-(void)obtenerDatosGuadalajara:(NSString*)lugar_parametro{
    @try {
       // [LoadingPantalla setPorcentaje:40];
       
            NSString*lugar_busqueda=[[NSString alloc]initWithFormat:@"l_%@V",lugar_parametro];;
            NSString*tip=@"normal";
            NSString *post =[[NSString alloc] initWithFormat:@"locacion=%@&tipo=%@",lugar_busqueda,tip];

            // NSLog(@"PostData: %@",post);
           
            NSURL *url=[NSURL URLWithString:@"http://www.mapplesoft.com/app/GDL.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
    
        
            [request setURL:url];
       
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
          //  [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
                 
            
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            [LoadingPantalla setPorcentaje:60];
            
            // NSLog(@"Response code: %d", [response statusCode]);
            if ([response statusCode] >=200 && [response statusCode] <300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                //   NSLog(@"Response ==> %@", responseData);
                
                SBJsonParser *jsonParser = [SBJsonParser new];
                NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
                NSLog(@"%@",jsonData);
                NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                // NSInteger temperatura=[(NSNumber*)[jsonData objectForKey:@"temperatura"]integerValue];
                



                //   NSLog(@"%d",success);
                
                //  [DatosUsuario setId:id_usuario];
                // [DatosUsuario setNombre:nombre];
                //EXITO
                [LoadingPantalla setPorcentaje:80];
                NSLog(@"%d",success);
                succes_=success;
                if(success == 1)
                {
                    tipo_=@"normal";
                    NSString* contaminante=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"contaminante"] ];
                    NSString*imeca=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"imeca"] ];
                    NSString*temperatura=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"temperatura"] ];
                    NSString*humedad=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"humedad"] ];
                    
                    [LoadingPantalla setPorcentaje:100];
                    
                    NSLog(@"EL contaminante ES %@",contaminante);
                    
                    if([contaminante isEqualToString:@"PM10"]){
                         contaminante=@"PM\u00B9\u2070";
                    }
                    if([contaminante isEqualToString:@"O3"]){
                        contaminante=@"O\u00B3";
                    }
                    if([contaminante isEqualToString:@"Dióxido de Nitrógeno"]){
                        contaminante=@"NO\u00B2";
                    }
                    contaminante_=contaminante;
                    imeca_=imeca;
                    humedad_=humedad;
                    temperatura_=temperatura;
                    
                   
                    
                   
           /*         IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
                    
                   index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
                    index.titulo.text=contaminante;
                     [self presentViewController:index animated:YES completion:^{
                      }];
             */       
                    
                } else {
                    
                    
                    //NSString *error_msg =@"Por el momento los datos del lugar no se encuentran disponibles."; //(NSString *) [jsonData objectForKey:@"error_message"];
                    //[self alertStatus:error_msg :@"Atención"];
                    [self obtenerDatosGuadalajaraPromedio];
                }
                
            } else {
                if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Problemas con la conexion" :@"Error!"];
                
                
            }
            
            
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Problemas con la conexion." :@"Error!"];
    }
    
}
-(void)obtenerDatosGuadalajaraPromedio{
    @try {
        // [LoadingPantalla setPorcentaje:40];
        
       
       // NSString*tip=@"promedio";
        NSString*lugar_busqueda=[[NSString alloc]initWithFormat:@"l_%@V",@"Centro"];;
        NSString*tip=@"normal";
        NSString *post =[[NSString alloc] initWithFormat:@"locacion=%@&tipo=%@",lugar_busqueda,tip];
        
        // NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://www.mapplesoft.com/app/GDL.php"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        
   //     [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        [LoadingPantalla setPorcentaje:60];
        
        // NSLog(@"Response code: %d", [response statusCode]);
        if ([response statusCode] >=200 && [response statusCode] <300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            //   NSLog(@"Response ==> %@", responseData);
            
            SBJsonParser *jsonParser = [SBJsonParser new];
            NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
            NSLog(@"%@",jsonData);
            NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
            // NSInteger temperatura=[(NSNumber*)[jsonData objectForKey:@"temperatura"]integerValue];
            
            
            
            
            //   NSLog(@"%d",success);
            
            //  [DatosUsuario setId:id_usuario];
            // [DatosUsuario setNombre:nombre];
            //EXITO
            [LoadingPantalla setPorcentaje:80];
            NSLog(@"%d",success);
            succes_=success;
            if(success == 1)
            {
                tipo_=@"normal";
                NSString* contaminante=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"contaminante"] ];
                NSString*imeca=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"imeca"] ];
                NSString*temperatura=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"temperatura"] ];
                NSString*humedad=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"humedad"] ];
                
                [LoadingPantalla setPorcentaje:100];
                
                NSLog(@"EL contaminante ES %@",contaminante);
                
                if([contaminante isEqualToString:@"PM10"]){
                    contaminante=@"PM\u00B9\u2070";
                }
                if([contaminante isEqualToString:@"O3"]){
                    contaminante=@"O\u00B3";
                }
                if([contaminante isEqualToString:@"Dióxido de Nitrógeno"]){
                    contaminante=@"NO\u00B2";
                }
                contaminante_=contaminante;
                imeca_=imeca;
                humedad_=humedad;
                temperatura_=temperatura;
                
                
                /*         IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
                 
                 index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
                 index.titulo.text=contaminante;
                 [self presentViewController:index animated:YES completion:^{
                 }];
                 */
                
            } else {
                
                
                NSString *error_msg =@"Por el momento los datos del lugar no se encuentran disponibles."; //(NSString *) [jsonData objectForKey:@"error_message"];
                [self alertStatus:error_msg :@"Atención"];
                
            }
            
        } else {
            if (error) NSLog(@"Error: %@", error);
            [self alertStatus:@"Problemas con la conexion" :@"Error!"];
            
            
        }
        
        
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Problemas con la conexion." :@"Error!"];
    }
    
}

-(void)obtenerDatosDFPromedio{
    @try {
        // [LoadingPantalla setPorcentaje:40];
        
      
        NSString*tip=@"promedio";
        NSString *post =[[NSString alloc] initWithFormat:@"locacion=nad&tipo=%@",tip];
        // NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://www.mapplesoft.com/app/DF.php"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        
      //  [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        [LoadingPantalla setPorcentaje:60];
        
        // NSLog(@"Response code: %d", [response statusCode]);
        if ([response statusCode] >=200 && [response statusCode] <300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            //   NSLog(@"Response ==> %@", responseData);
            
            SBJsonParser *jsonParser = [SBJsonParser new];
            NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
            NSLog(@"%@",jsonData);
            NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
            // NSInteger temperatura=[(NSNumber*)[jsonData objectForKey:@"temperatura"]integerValue];
            
            
            
            
            //   NSLog(@"%d",success);
            
            //  [DatosUsuario setId:id_usuario];
            // [DatosUsuario setNombre:nombre];
            //EXITO
            [LoadingPantalla setPorcentaje:80];
            NSLog(@"EL SUCCES ES %d",success);
       
            succes_=success;
            if(success == 1)
            {
                tipo_=@"promedio";
                NSString* contaminante=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"contaminante"] ];
                NSString*imeca=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"imeca"] ];
                NSString*temperatura=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"temperatura"] ];
                NSString*humedad=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"humedad"] ];
                
                [LoadingPantalla setPorcentaje:100];
                
                if([contaminante isEqualToString:@"PM10"]){
                    contaminante=@"PM\u00B9\u2070";
                }
                if([contaminante isEqualToString:@"O3"]){
                    contaminante=@"O\u00B3";
                }
                if([contaminante isEqualToString:@"Dióxido de Nitrógeno"]){
                    contaminante=@"NO\u00B2";
                }
                NSLog(@"EL contaminante ES %@",contaminante);
                contaminante_=contaminante;
                imeca_=imeca;
                humedad_=humedad;
                temperatura_=temperatura;
                
                
                /*         IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
                 
                 index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
                 index.titulo.text=contaminante;
                 [self presentViewController:index animated:YES completion:^{
                 }];
                 */
                
            } else {
                
                
                NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                [self alertStatus:error_msg :@"Error!"];
                
            }
            
        } else {
            if (error) NSLog(@"Error: %@", error);
            [self alertStatus:@"Problemas con la conexion" :@"Error!"];
            
            
        }
        
        
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Problemas con la conexion." :@"Error!"];
    }
     

}
-(void)obtenerDatosDF:(NSString*)lugar_parametro{
    @try {
        // [LoadingPantalla setPorcentaje:40];
        
        NSString*lugar_busqueda=[[NSString alloc]initWithFormat:@"%@",lugar_parametro];;
        NSString*tip=@"normal";
        NSString *post =[[NSString alloc] initWithFormat:@"locacion=%@&tipo=%@",lugar_busqueda,tip];
        // NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://www.mapplesoft.com/app/DF.php"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        
     //   [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        [LoadingPantalla setPorcentaje:60];
        
        // NSLog(@"Response code: %d", [response statusCode]);
        if ([response statusCode] >=200 && [response statusCode] <300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            //   NSLog(@"Response ==> %@", responseData);
            
            SBJsonParser *jsonParser = [SBJsonParser new];
            NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
            NSLog(@"%@",jsonData);
            NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
            // NSInteger temperatura=[(NSNumber*)[jsonData objectForKey:@"temperatura"]integerValue];
            
            
            
            
            //   NSLog(@"%d",success);
            
            //  [DatosUsuario setId:id_usuario];
            // [DatosUsuario setNombre:nombre];
            //EXITO
            [LoadingPantalla setPorcentaje:80];
            NSLog(@"EL SUCCES ES %d",success);
          
            succes_=success;
            if(success == 1)
            {
                tipo_=@"normal";
                NSString* contaminante=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"contaminante"] ];
                NSString*imeca=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"imeca"] ];
                NSString*temperatura=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"temperatura"] ];
                NSString*humedad=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"humedad"] ];
                
                [LoadingPantalla setPorcentaje:100];
                
                if([contaminante isEqualToString:@"PM10"]){
                    contaminante=@"PM\u00B9\u2070";
                }
                if([contaminante isEqualToString:@"O3"]){
                    contaminante=@"O\u00B3";
                }
                if([contaminante isEqualToString:@"Dióxido de Nitrógeno"]){
                    contaminante=@"NO\u00B2";
                }
                NSLog(@"EL contaminante ES %@",contaminante);
                contaminante_=contaminante;
                imeca_=imeca;
                humedad_=humedad;
                temperatura_=temperatura;
                
                
                /*         IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
                 
                 index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
                 index.titulo.text=contaminante;
                 [self presentViewController:index animated:YES completion:^{
                 }];
                 */
                
            } else {
                
                [self obtenerDatosDFPromedio];
               // NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
               // [self alertStatus:error_msg :@"Error!"];
                
            }
            
        } else {
            if (error) NSLog(@"Error: %@", error);
            [self alertStatus:@"Problemas con la conexion" :@"Error!"];
            
            
        }
        
      
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Problemas con la conexion." :@"Error!"];
    }
    
    
    
}
-(void)obtenerDatosMonterrey:(NSString*)lugar_parametro{
    @try {
        // [LoadingPantalla setPorcentaje:40];
        if([lugar_parametro isEqualToString:@"Garcia" ]){
            lugar_parametro=@"6";
        }
        if([lugar_parametro isEqualToString:@"San Bernabe"]){
            lugar_parametro=@"1";
        }
        if([lugar_parametro isEqualToString:@"Escobedo"]){
            lugar_parametro=@"7";
        }
        if([lugar_parametro isEqualToString:@"San nicolas"]){
            lugar_parametro=@"4";
        }
     
        if([lugar_parametro isEqualToString:@"Santa Catarina" ]){
            lugar_parametro=@"2";
        }
        if([lugar_parametro isEqualToString:@"Obispado"]){
            lugar_parametro=@"3";
        }
        if([lugar_parametro isEqualToString:@"La pastora"]){
            lugar_parametro=@"5";
        }
        
     
        NSLog(@"int es:%@",lugar_parametro);
        
        NSString *post =[[NSString alloc] initWithFormat:@"locacion=%@",lugar_parametro];
        // NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://www.mapplesoft.com/app/MTY.php"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        
       // [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        [LoadingPantalla setPorcentaje:60];
        
        // NSLog(@"Response code: %d", [response statusCode]);
        if ([response statusCode] >=200 && [response statusCode] <300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            //   NSLog(@"Response ==> %@", responseData);
            
            SBJsonParser *jsonParser = [SBJsonParser new];
            NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
            NSLog(@"%@",jsonData);
            NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
            // NSInteger temperatura=[(NSNumber*)[jsonData objectForKey:@"temperatura"]integerValue];
            
            
            
            
            //   NSLog(@"%d",success);
            
            //  [DatosUsuario setId:id_usuario];
            // [DatosUsuario setNombre:nombre];
            //EXITO
            [LoadingPantalla setPorcentaje:80];
            NSLog(@"%d",success);
            succes_=success;
            if(success == 1)
            {
                tipo_=@"normal";
                NSString* contaminante=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"contaminante"] ];
                NSString*imeca=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"imeca"] ];
                NSString*temperatura=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"temperatura"] ];
                NSString*humedad=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"humedad"] ];
                
                [LoadingPantalla setPorcentaje:100];
                
                NSLog(@"EL contaminante ES %@",contaminante);
                
                if([contaminante isEqualToString:@"PM10"]){
                    contaminante=@"PM\u00B9\u2070";
                }
                if([contaminante isEqualToString:@"O3"]){
                    contaminante=@"O\u00B3";
                }
                if([contaminante isEqualToString:@"Dióxido de Nitrógeno"]){
                    contaminante=@"NO\u00B2";
                }
                contaminante_=contaminante;
                imeca_=imeca;
                humedad_=humedad;
                temperatura_=temperatura;
                
                
                /*         IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
                 
                 index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
                 index.titulo.text=contaminante;
                 [self presentViewController:index animated:YES completion:^{
                 }];
                 */
                
            } else {
                
                
                 NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                [self alertStatus:error_msg :@"Atención"];
                
            }
            
        } else {
            if (error) NSLog(@"Error: %@", error);
            [self alertStatus:@"Problemas con la conexion" :@"Error!"];
            
            
        }
        
        
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Problemas con la conexion." :@"Error!"];
    }
    
}


+(NSString*)getContaminante{
    return contaminante_;
}
+(NSString*)getImeca{
    return imeca_;
}
+(NSString*)getHumedad{
    return humedad_;
}
+(NSString*)getTemperatura{
    return temperatura_;
}
+(NSInteger)getSucces{
    return succes_;
}
- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Aceptar"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}
-(void)obtenerLugar:(Lugares*)lugr{
    if([lugr.ciudad isEqualToString:@"Monterrey"]){
        [self obtenerDatosMonterrey:lugr.lugar];
    }
    if([lugr.ciudad isEqualToString:@"Guadalajara"]){
        [self obtenerDatosGuadalajara:lugr.lugar];
    }
    if([lugr.ciudad isEqualToString:@"DF"]){
        [self obtenerDatosDF:lugr.lugar];
        NSLog(@"ENTRO DF");
    }
    
}
+(NSString*)getTipo{
    return tipo_;
}
@end
