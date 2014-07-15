//
//  DatosLugares.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 04/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "DatosLugares.h"

@implementation DatosLugares

-(void)datosLugares{
    [LoadingPantalla setPorcentaje:40];
   
    arregloDatosLugares=[[NSMutableArray alloc]init];
    
    //GUADALAJARA
    Lugares*lugar1=[Lugares alloc];
    CLLocationCoordinate2D coordenada1={20.678716166666668, -103.39867322222223};
    lugar1.ciudad=@"Guadalajara";
    lugar1.lugar=@"Vallarta";
    lugar1.coordenadas=coordenada1;
    lugar1.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar1];
    
    Lugares*lugar2=[Lugares alloc];
    CLLocationCoordinate2D coordenada2={20.672366666666665, -103.33335883333334};
    lugar2.ciudad=@"Guadalajara";
    lugar2.lugar=@"Centro";
    lugar2.coordenadas=coordenada2;
    lugar2.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar2];
    
    Lugares*lugar3=[Lugares alloc];
    CLLocationCoordinate2D coordenada3={20.61310388888889,-103.34344175};
    lugar3.ciudad=@"Guadalajara";
    lugar3.lugar=@"Miravalle";
    lugar3.coordenadas=coordenada3;
    lugar3.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar3];
    
    Lugares*lugar4=[Lugares alloc];
    CLLocationCoordinate2D coordenada4={20.699048277777777, -103.29667683333334};
    lugar4.ciudad=@"Guadalajara";
    lugar4.lugar=@"Oblatos";
    lugar4.coordenadas=coordenada4;
    lugar4.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar4];
    
    
    Lugares*lugar5=[Lugares alloc];
    CLLocationCoordinate2D coordenada5={20.718180277777776, -103.35549144444444};
    lugar5.ciudad=@"Guadalajara";
    lugar5.lugar=@"Atemajac";
    lugar5.coordenadas=coordenada5;
    lugar5.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar5];
    
    Lugares*lugar6=[Lugares alloc];
    CLLocationCoordinate2D coordenada6={20.629602722222224,-103.41677252777778};
    lugar6.ciudad=@"Guadalajara";
    lugar6.lugar=@"Aguilas";
    lugar6.coordenadas=coordenada6;
    lugar6.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar6];
    
    Lugares*lugar7=[Lugares alloc];
    CLLocationCoordinate2D coordenada7={20.627836333333335,-103.2641278888889};
    lugar7.ciudad=@"Guadalajara";
    lugar7.lugar=@"LomaDorada";
    lugar7.coordenadas=coordenada7;
    lugar7.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar7];
    
    Lugares*lugar8=[Lugares alloc];
    CLLocationCoordinate2D coordenada8={ 20.6395355,-103.31260952777778};
    lugar8.ciudad=@"Guadalajara";
    lugar8.lugar=@"Tlaquepaque";
    lugar8.coordenadas=coordenada8;
    lugar8.url=@"gdl_url";
    [arregloDatosLugares addObject:lugar8];
    
    //MONTERREY
    
    [LoadingPantalla setPorcentaje:60];
    

    Lugares*lugar9=[Lugares alloc];
    CLLocationCoordinate2D coordenada9={25.668333333333333,-100.24833333333333};
    lugar9.ciudad=@"Monterrey";
    lugar9.lugar=@"La pastora";
    lugar9.coordenadas=coordenada9;
    lugar9.url=@"mty_url";
    [arregloDatosLugares addObject:lugar9];
    
    Lugares*lugar10=[Lugares alloc];
    CLLocationCoordinate2D coordenada10={25.745,-100.25472222222223};
    lugar10.ciudad=@"Monterrey";
    lugar10.lugar=@"San nicolas";
    lugar10.coordenadas=coordenada10;
    lugar10.url=@"mty_url";
    [arregloDatosLugares addObject:lugar10];
    
    Lugares*lugar11=[Lugares alloc];
    CLLocationCoordinate2D coordenada11={25.675555555555555,-100.33833333333334};
    lugar11.ciudad=@"Monterrey";
    lugar11.lugar=@"Obispado";
    lugar11.coordenadas=coordenada11;
    lugar11.url=@"mty_url";
    [arregloDatosLugares addObject:lugar11];
    
    Lugares*lugar12=[Lugares alloc];
    CLLocationCoordinate2D coordenada12={25.753055555555555,-100.36972222222222};
    lugar12.ciudad=@"Monterrey";
    lugar12.lugar=@"San Bernabe";
    lugar12.coordenadas=coordenada12;
    lugar12.url=@"mty_url";
    [arregloDatosLugares addObject:lugar12];

    Lugares*lugar13=[Lugares alloc];
    CLLocationCoordinate2D coordenada13={25.675,-100.45833333333333};
    lugar13.ciudad=@"Monterrey";
    lugar13.lugar=@"Santa Catarina";
    lugar13.coordenadas=coordenada13;
    lugar13.url=@"mty_url";
    [arregloDatosLugares addObject:lugar13];
    
    Lugares*lugar14=[Lugares alloc];
    CLLocationCoordinate2D coordenada14={25.783055555555556,-100.585833333333333};
    lugar14.ciudad=@"Monterrey";
    lugar14.lugar=@"Garcia";
    lugar14.coordenadas=coordenada14;
    lugar14.url=@"mty_url";
    [arregloDatosLugares addObject:lugar14];
    
    Lugares*lugar15=[Lugares alloc];
    CLLocationCoordinate2D coordenada15={25.800675,-100.34435555555555};
    lugar15.ciudad=@"Monterrey";
    lugar15.lugar=@"Escobedo";
    lugar15.coordenadas=coordenada15;
    lugar15.url=@"mty_url";
    [arregloDatosLugares addObject:lugar15];

    
    [LoadingPantalla setPorcentaje:80];
    

    //DF
    Lugares*lugar16=[Lugares alloc];
    CLLocationCoordinate2D coordenada16={19.65767138888889,-99.09630666666666};
    lugar16.ciudad=@"DF";
    lugar16.lugar=@"vif";//Villa de las flores
    lugar16.lugar_completo=@"Villa de las flores";
    lugar16.coordenadas=coordenada16;
    lugar16.url=@"df_url";
    [arregloDatosLugares addObject:lugar16];
    
    Lugares*lugar17=[Lugares alloc];
    CLLocationCoordinate2D coordenada17={19.6355, -98.912};
    lugar17.ciudad=@"DF";
    lugar17.lugar=@"aco";//Acolman
    lugar17.lugar_completo=@"Acolman";
    lugar17.coordenadas=coordenada17;
    lugar17.url=@"df_url";
    [arregloDatosLugares addObject:lugar17];
    
    Lugares*lugar18=[Lugares alloc];
    CLLocationCoordinate2D coordenada18={19.601970833333333, -99.17683472222222};
    lugar18.ciudad=@"DF";
    lugar18.lugar=@"tli";//Tultitlan
    lugar18.lugar_completo=@"Tultitlan";
    lugar18.coordenadas=coordenada18;
    lugar18.url=@"df_url";
    [arregloDatosLugares addObject:lugar18];
    
    Lugares*lugar19=[Lugares alloc];
    CLLocationCoordinate2D coordenada19={19.578236666666665, -99.03928583333334};
    lugar19.ciudad=@"DF";
    lugar19.lugar=@"lla";//Los Laureles
    lugar19.lugar_completo=@"Los Laureles";
    lugar19.coordenadas=coordenada19;
    lugar19.url=@"df_url";
    [arregloDatosLugares addObject:lugar19];
    
    Lugares*lugar20=[Lugares alloc];
    CLLocationCoordinate2D coordenada20={19.576386666666668, -99.25386055555556};
    lugar20.ciudad=@"DF";
    lugar20.lugar=@"ati";//Atizapan
    lugar20.lugar_completo=@"Atizapan";
    lugar20.coordenadas=coordenada20;
    lugar20.url=@"df_url";
    [arregloDatosLugares addObject:lugar20];
    
    Lugares*lugar21=[Lugares alloc];
    CLLocationCoordinate2D coordenada21={19.53224722222222, -99.02993916666667};
    lugar21.ciudad=@"DF";
    lugar21.lugar=@"sag";//San agustin
    lugar21.lugar_completo=@"San agustin";
    lugar21.coordenadas=coordenada21;
    lugar21.url=@"df_url";
    [arregloDatosLugares addObject:lugar21];

    Lugares*lugar22=[Lugares alloc];
    CLLocationCoordinate2D coordenada22={19.527748055555556,-99.07644472222222};
    lugar22.ciudad=@"DF";
    lugar22.lugar=@"xal";//Xalostoc
    lugar22.lugar_completo=@"Xalostoc";
    lugar22.coordenadas=coordenada22;
    lugar22.url=@"df_url";
    [arregloDatosLugares addObject:lugar22];
    
    Lugares*lugar23=[Lugares alloc];
    CLLocationCoordinate2D coordenada23={19.53407888888889,-99.11735333333333};
    lugar23.ciudad=@"DF";
    lugar23.lugar=@"lpr";//La presa
    lugar23.lugar_completo=@"La presa";
    lugar23.coordenadas=coordenada23;
    lugar23.url=@"df_url";
    [arregloDatosLugares addObject:lugar23];

    Lugares*lugar24=[Lugares alloc];
    CLLocationCoordinate2D coordenada24={19.5235975, -99.16570222222222};
    lugar24.ciudad=@"DF";
    lugar24.lugar=@"val";//Vallejo
    lugar24.lugar_completo=@"Vallejo";
    lugar24.coordenadas=coordenada24;
    lugar24.url=@"df_url";
    [arregloDatosLugares addObject:lugar24];
    
    Lugares*lugar25=[Lugares alloc];
    CLLocationCoordinate2D coordenada25={19.528396944444445, -99.20423138888889};
    lugar25.ciudad=@"DF";
    lugar25.lugar=@"tla";//Tlalnepantla
    lugar25.lugar_completo=@"Tlalnepantla";
    lugar25.coordenadas=coordenada25;
    lugar25.url=@"df_url";
    [arregloDatosLugares addObject:lugar25];
    
    Lugares*lugar26=[Lugares alloc];
    CLLocationCoordinate2D coordenada26={19.48192277777778, -99.24327027777778};
    lugar26.ciudad=@"DF";
    lugar26.lugar=@"eac";//Enep acatlan
    lugar26.lugar_completo=@"Acatlán";
    lugar26.coordenadas=coordenada26;
    lugar26.url=@"df_url";
    [arregloDatosLugares addObject:lugar26];
    
    Lugares*lugar27=[Lugares alloc];
    CLLocationCoordinate2D coordenada27={19.4888925, -99.19866111111111};
    lugar27.ciudad=@"DF";
    lugar27.lugar=@"azc";//Azcapotzalco
    lugar27.lugar_completo=@"Azcapotzalco";
    lugar27.coordenadas=coordenada27;
    lugar27.url=@"df_url";
    [arregloDatosLugares addObject:lugar27];
    
    Lugares*lugar28=[Lugares alloc];
    CLLocationCoordinate2D coordenada28={19.336840833333333, -99.12320333333334};
    lugar28.ciudad=@"DF";
    lugar28.lugar=@"tac";//Tacuba
    lugar28.lugar_completo=@"Tacuba";
    lugar28.coordenadas=coordenada28;
    lugar28.url=@"df_url";
    [arregloDatosLugares addObject:lugar28];
    
    Lugares*lugar29=[Lugares alloc];
    CLLocationCoordinate2D coordenada29={19.4675, -99.16944444444445};
    lugar29.ciudad=@"DF";
    lugar29.lugar=@"cam";//Camarones
    lugar29.lugar_completo=@"Camarones";
    lugar29.coordenadas=coordenada29;
    lugar29.url=@"df_url";
    [arregloDatosLugares addObject:lugar29];
    
    Lugares*lugar30=[Lugares alloc];
    CLLocationCoordinate2D coordenada30={19.48872, -99.14729388888888};
    lugar30.ciudad=@"DF";
    lugar30.lugar=@"amp";//INS MEX DEL PETROLEO
    lugar30.lugar_completo=@"Instituto Mexicano Del Petróleo";
    lugar30.coordenadas=coordenada30;
    lugar30.url=@"df_url";
    [arregloDatosLugares addObject:lugar30];
    
    Lugares*lugar31=[Lugares alloc];
    CLLocationCoordinate2D coordenada31={19.44358111111111, -99.1185175};
    lugar31.ciudad=@"DF";
    lugar31.lugar=@"lag";//Lagunilla
     lugar31.lugar_completo=@"Lagunilla";
    lugar31.coordenadas=coordenada31;
    lugar31.url=@"df_url";
    [arregloDatosLugares addObject:lugar31];
    
    Lugares*lugar32=[Lugares alloc];
    CLLocationCoordinate2D coordenada32={19.469050833333334, -99.11775416666667};
    lugar32.ciudad=@"DF";
    lugar32.lugar=@"lvi";//La villa
    lugar32.lugar_completo=@"La villa";
    lugar32.coordenadas=coordenada32;
    lugar32.url=@"df_url";
    [arregloDatosLugares addObject:lugar32];
    
    Lugares*lugar33=[Lugares alloc];
    CLLocationCoordinate2D coordenada33={19.47138,-99.0745461111111};
    lugar33.ciudad=@"DF";
    lugar33.lugar=@"ara";//Aragon
     lugar33.lugar_completo=@"Aragon";
    lugar33.coordenadas=coordenada33;
    lugar33.url=@"df_url";
    [arregloDatosLugares addObject:lugar33];
    
    Lugares*lugar34=[Lugares alloc];
    CLLocationCoordinate2D coordenada34={19.451944444444443, -99.08583333333333};
    lugar34.ciudad=@"DF";
    lugar34.lugar=@"sja";//San Juan Aragon
    lugar34.lugar_completo=@"San Juan Aragon";
    lugar34.coordenadas=coordenada34;
    lugar34.url=@"df_url";
    [arregloDatosLugares addObject:lugar34];
    
    Lugares*lugar35=[Lugares alloc];
    CLLocationCoordinate2D coordenada35={19.459805, -98.90247777777778};
    lugar35.ciudad=@"DF";
    lugar35.lugar=@"cha";//Chapingo
    lugar35.lugar_completo=@"Chapingo";
    lugar35.coordenadas=coordenada35;
    lugar35.url=@"df_url";
    [arregloDatosLugares addObject:lugar35];
    
    Lugares*lugar36=[Lugares alloc];
    CLLocationCoordinate2D coordenada36={19.36382638888889, -99.29865444444444};
    lugar36.ciudad=@"DF";
    lugar36.lugar=@"cua";//Cuajimalpa
    lugar36.lugar_completo=@"Cuajimalpa";
    lugar36.coordenadas=coordenada36;
    lugar36.url=@"df_url";
    [arregloDatosLugares addObject:lugar36];

    Lugares*lugar37=[Lugares alloc];
    CLLocationCoordinate2D coordenada37={19.36702777777778, -99.20010472222222};
    lugar37.ciudad=@"DF";
    lugar37.lugar=@"pla";//Plateros
    lugar37.lugar_completo=@"Plateros";
    lugar37.coordenadas=coordenada37;
    lugar37.url=@"df_url";
    [arregloDatosLugares addObject:lugar37];

    Lugares*lugar38=[Lugares alloc];
    CLLocationCoordinate2D coordenada38={19.32473472222222, -99.20371583333333};
    lugar38.ciudad=@"DF";
    lugar38.lugar=@"ped";//Pedregal
    lugar38.lugar_completo=@"Pedregal";
    lugar38.coordenadas=coordenada38;
    lugar38.url=@"df_url";
    [arregloDatosLugares addObject:lugar38];
    
    Lugares*lugar39=[Lugares alloc];
    CLLocationCoordinate2D coordenada39={19.349383333333332, -99.1571388888889};
    lugar39.ciudad=@"DF";
    lugar39.lugar=@"coy";//Coyoacan
    lugar39.lugar_completo=@"Coyoacan";
    lugar39.coordenadas=coordenada39;
    lugar39.url=@"df_url";
    [arregloDatosLugares addObject:lugar39];

    Lugares*lugar40=[Lugares alloc];
    CLLocationCoordinate2D coordenada40={19.31368861111111,-99.149665};
    lugar40.ciudad=@"DF";
    lugar40.lugar=@"sur";//Santa ursula
    lugar40.lugar_completo=@"Santa ursula";
    lugar40.coordenadas=coordenada40;
    lugar40.url=@"df_url";
    [arregloDatosLugares addObject:lugar40];

    Lugares*lugar41=[Lugares alloc];
    CLLocationCoordinate2D coordenada41={19.336840833333333, -99.12320333333334};
    lugar41.ciudad=@"DF";
    lugar41.lugar=@"tax";//Taxque_a
    lugar41.lugar_completo=@"Taxque_a";
    lugar41.coordenadas=coordenada41;
    lugar41.url=@"df_url";
    [arregloDatosLugares addObject:lugar41];

    Lugares*lugar42=[Lugares alloc];
    CLLocationCoordinate2D coordenada42={19.384416666666667,-99.11763888888889};
    lugar42.ciudad=@"DF";
    lugar42.lugar=@"izt";//Iztacalco
    lugar42.lugar_completo=@"Iztacalco";
    lugar42.coordenadas=coordenada42;
    lugar42.url=@"df_url";
    [arregloDatosLugares addObject:lugar42];

    Lugares*lugar43=[Lugares alloc];
    CLLocationCoordinate2D coordenada43={19.362388055555556, -99.07117194444444};
    lugar43.ciudad=@"DF";
    lugar43.lugar=@"uiz";//UAM-IZTAPALAPA
    lugar43.lugar_completo=@"UAM Itzapalapa";
    lugar43.coordenadas=coordenada43;
    lugar43.url=@"df_url";
    [arregloDatosLugares addObject:lugar43];
    
    Lugares*lugar44=[Lugares alloc];
    CLLocationCoordinate2D coordenada44={19.384016666666668,- 98.99185555555556};
    lugar44.ciudad=@"DF";
    lugar44.lugar=@"per";//La Perla
    lugar44.lugar_completo=@"La Perla";
    lugar44.coordenadas=coordenada44;
    lugar44.url=@"df_url";
    [arregloDatosLugares addObject:lugar44];
    
    Lugares*lugar45=[Lugares alloc];
    CLLocationCoordinate2D coordenada45={19.2562875, -99.18392583333333};
    lugar45.ciudad=@"DF";
    lugar45.lugar=@"tpn";//Tlalpan
    lugar45.lugar_completo=@"Tlalpan";
    lugar45.coordenadas=coordenada45;
    lugar45.url=@"df_url";
    [arregloDatosLugares addObject:lugar45];

    Lugares*lugar46=[Lugares alloc];
    CLLocationCoordinate2D coordenada46={19.245729166666667,-99.17688527777777};
    lugar46.ciudad=@"DF";
    lugar46.lugar=@"tah";//Tlahuac
    lugar46.lugar_completo=@"Tlahuac";
    lugar46.coordenadas=coordenada46;
    lugar46.url=@"df_url";
    [arregloDatosLugares addObject:lugar46];

    Lugares*lugar47=[Lugares alloc];
    CLLocationCoordinate2D coordenada47={19.266944444444444,-98.88608333333333};
    lugar47.ciudad=@"DF";
    lugar47.lugar=@"cho";//Chalco
    lugar47.lugar_completo=@"Chalco";
    lugar47.coordenadas=coordenada47;
    lugar47.url=@"df_url";
    [arregloDatosLugares addObject:lugar47];


    
    [LoadingPantalla setPorcentaje:100];
}

-(NSMutableArray*)getArregloDatosLugares{
    return arregloDatosLugares;
}
@end
