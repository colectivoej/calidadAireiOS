//
//  ViewController.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 02/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nombre;
- (void)viewDidLoad
{
    lugares=[[NSMutableArray alloc]init];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)enviar:(id)sender {
      @try {
          [LoadingPantalla setPorcentaje:40];
        if([[nombre text] isEqualToString:@""] ) {
            [self alertStatus:@"Llena todos los campos" :@"Advertencia!"];
            
         
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"locacion=%@",[nombre text]];
            // NSLog(@"PostData: %@",post);
            NSLog(@"%@",[nombre text]);
            NSURL *url=[NSURL URLWithString:@"http://grupoairsoft.com/pikochas/experimento.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            
            [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
            
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
                NSString* contaminante=[[NSString alloc]initWithFormat:@"%@",[jsonData objectForKey:@"contaminante"] ];
                //   NSLog(@"%d",success);
                
              //  [DatosUsuario setId:id_usuario];
               // [DatosUsuario setNombre:nombre];
                //EXITO
                 [LoadingPantalla setPorcentaje:80];
                NSLog(@"%d",success);
                if(success == 1)
                {
                    
                     [LoadingPantalla setPorcentaje:100];
                    
                   NSLog(@"EL contaminante ES %@",contaminante);
                    
                    //
                   // IndexViewController*index=[[self storyboard] instantiateViewControllerWithIdentifier:@"IndexView"];
                    
                    //index.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
                    
                   // [self presentViewController:index animated:YES completion:^{
                  //  }];
                    
                    
                } else {
                    
                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                    [self alertStatus:error_msg :@"Error!"];
                    
                }
                
            } else {
                if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Problemas con la conexion" :@"Error!"];
               
                
            }
            
            
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Problemas con la conexion." :@"Error!"];
    }
    
}
- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

- (void)dealloc {
   
    [super dealloc];
}
@end
