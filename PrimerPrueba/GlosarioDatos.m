//
//  GlosarioDatos.m
//  PrimerPrueba
//
//  Created by Jose Eduardo Quintero Gutierrez on 15/06/13.
//  Copyright (c) 2013 Jose Eduardo Quintero Gutierrez. All rights reserved.
//

#import "GlosarioDatos.h"

@implementation GlosarioDatos

-(void)datosGlosario{
    arregloGlosarioDatos=[[NSMutableArray alloc]init];
    Glosario*glor1=[[Glosario alloc]init];
    glor1.titulo_glosario=@"Dióxido de Azufre (SO\u00B2)";
    glor1.detalles=@"Valores fijados en las Directrices de Norma Oficial Mexicana NOM-022-SSA1-1993\nSO2\n341 ug/m\u00B3 de media en 24h\n Fuente: Cuarto almanaque de datos y tendencias de la calidad del aire en 20 ciudades mexicanas (2000-2009) - Instituto Nacional de Ecologia.\n \nValores fijados en las Directrices de la Organización Mundial de la Salud\nSO2\n20 ug/m\u00B3 de media en 24h\n \nDefinición y fuentes principales\nEl SO2 es un gas incoloro con un olor penetrante que se genera con la combustión de fósiles (carbón y petróleo) y la fundición de menas que contienen azufre. La principal fuente antropogénica del SO2 es la combustión de fósiles que contienen azufre usados para la calefacción doméstica, la generación de electricidad y los vehículos a motor.\nEfectos sobre la salud\nSO2 puede afectar al sistema respiratorio y las funciones pulmonares, y causa irritación ocular. La inflamación del sistema respiratorio provoca tos, secreción mucosa y agravamiento del asma y la bronquitis crónica; asimismo, aumenta la propensión de las personas a contraer infecciones del sistema respiratorio. Los ingresos hospitalarios por cardiopatías y la mortalidad aumentan en los días en que los niveles de SO2 son más elevados. En combinación con el agua, el SO2 se convierte en ácido sulfúrico, que es el principal componente de la lluvia ácida que causa la deforestación.\nLa OMS ayudará a los Estados Miembros en el intercambio de información sobre enfoques eficaces, métodos de análisis sobre exposición y vigilancia de las repercusiones de la contaminación en la salud.\n";
    [arregloGlosarioDatos addObject:glor1];
    
    
    
    Glosario*glor2=[[Glosario alloc]init];
    glor2.titulo_glosario=@"Dióxido de Nitrógeno (NO\u00B2)";
    glor2.detalles=@"Valores fijados en las Directrices de la Norma Oficial Mexicana NOM-023-SSA1-1993 NO2\n395 ug/m\u00B3 de media en 1h\nFuente: Cuarto almanaque de datos y tendencias de la calidad del aire en 20 ciudades mexicanas (2000-2009) -Instituto Nacional de Ecologia\n\nValores fijados en las Directrices de la Organización Mundial de la Salud\nNO2\n200 ug/m\u00B3 de media en 1h\nDefinición y fuentes principales\nComo contaminante atmosférico, el NO2 puede correlacionarse con varias actividades:\n-Como contaminante atmosférico, el NO2 puede correlacionarse con varias actividades: En concentraciones de corta duración superiores a 200 mg/m\u00B3, es un gas tóxico que causa una importante inflamación de las vías respiratorias\n-Es la fuente principal de los aerosoles de nitrato, que constituyen una parte importante de las PM2.5 y, en presencia de luz ultravioleta, del ozono.\nLas principales fuentes de emisiones antropogénicas de NO2 son los procesos de combustión (calefacción, generación de electricidad y motores de vehículos y barcos).\nEfectos sobre la salud\nEstudios epidemiológicos han revelado que los síntomas de bronquitis en niños asmáticos aumentan en relación con la exposición prolongada alLa disminución del desarrollo de la función pulmonar también se asocia con las concentraciones de NO2 registradas (u observadas) actualmente en ciudades europeas y norteamericanas.\n";
    [arregloGlosarioDatos addObject:glor2];

    Glosario*glor3=[[Glosario alloc]init];
    glor3.titulo_glosario=@"Estación de Monitoreo";
    glor3.detalles=@"Una estación meteorológica se refiere a un grupo de instrumentos que llevan a cabo mediciones continuas de los parámetros seleccionados.En este caso, los valores de la contaminación del aire están documentados.\nFuente: http://de.wikipedia.org/wiki/Messstation (translated)\n";
    [arregloGlosarioDatos addObject:glor3];

    Glosario*glor4=[[Glosario alloc]init];
    glor4.titulo_glosario=@"Imeca";
    glor4.detalles=@"El índice metropolitano de la Calidad del Aire (IMECA) es un valor de referencia para que la población conozca los niveles de contaminación prevalecientes en su zona de residencia, de manera precisa y oportuna, para que tome las medidas pertinentes de protección.";
    [arregloGlosarioDatos addObject:glor4];
    
    Glosario*glor5=[[Glosario alloc]init];
    glor5.titulo_glosario=@"Más Vulnerables";
    glor5.detalles=@"Grupo de personas con un mayor riesgo de padecer los efectos de la contaminación del aire. Este grupo incluye:\n -Niños y niñas\n -Mujeres Embarazadas\n -Personas de la 3era edad\n -Enfermos\n -Ciclistas (Cuando la calidad del aire va de Mala a Extremadamente Mala)";
    [arregloGlosarioDatos addObject:glor5];
    
    Glosario*glor6=[[Glosario alloc]init];
    glor6.titulo_glosario=@"Monóxido de Carbono (CO)";
    glor6.detalles=@"Valores fijados en las Directrices de Norma Oficial Mexicana NOM-021-SSA1-1993 CO\n12595 ug/m\u00B3 de media en 8h\nFuente: Cuarto almanaque de datos y tendencias de la calidad del aire en 20 ciudades mexicanas (2000-2009) ñ Instituto Nacional de Ecologia\n\nValores fijados en las Directrices de la Organización Mundial de la Salud\nCO10000 ug/m\u00B3 de media en 8h\nDefinición y Fuentes principales\nEl monóxido de carbono también denominado óxido de carbono (II), gas carbonoso y anhídrido carbonoso (los dos últimos cada vez más en desuso)cuya fórmula química es CO, es un gas inodoro, incoloro, inflamable y altamente tóxico. Puede causar la muerte cuando se respira en niveles elevados.\nLos vehículos de motor producen cerca del 60% del monóxido de carbono; en ocasiones, en las ciudades pueden llegar a aportar el 95%. Otras fuentes incluyen los procesos industriales, la quema de combustibles no empleados para transporte y los incendios.\n\nEfectos sobre la salud\nEl monóxido de carbono entra al torrente sanguíneo a través de los pulmones y reduce la cantidad de oxígeno que llega a los órganos y los tejidos. Para quienes sufren de angina de pecho, aún los niveles bajos representan un riesgo. A niveles más altos, el CO puede ser venenoso. Incluso las personas sanas pueden verse afectadas. Síntomas como problemas de visión, capacidad laboral reducida, menor destreza operativa, menor capacidad de aprendizaje y dificultades para desempeÒar tareas complejas están asociados con la exposición al monóxido de carbon.\n Fuente: http://www.cleanairtrust.org/carbonmonoxide.html y http://es.wikipedia.org/wiki/Mon%C3%B3xido_de_carbono\n";
    [arregloGlosarioDatos addObject:glor6];
    
    Glosario*glor7=[[Glosario alloc]init];
    glor7.titulo_glosario=@"Organización Mundial de la Salud";
    glor7.detalles=@"La OMS es la autoridad directiva y coordinadora de la acción sanitaria en el sistema de las Naciones Unidas.\n\nEs la responsable de desempeñar una función de liderazgo en los asuntos sanitarios mundiales, configurar la agenda de las investigaciones en salud, establecer normas, articular opciones de política basadas en la evidencia, prestar apoyo técnico a los países y vigilar las tendencias sanitarias mundiales.\n Fuente: http://www.who.int/about/es/index.html.\n";
    [arregloGlosarioDatos addObject:glor7];
    
    Glosario*glor8=[[Glosario alloc]init];
    glor8.titulo_glosario=@"Ozono (O\u00B3)";
    glor8.detalles=@"Valores fijados en las Directrices de la Norma Oficial Mexicana NOM-020-SSA1-1993\nO3\n0.08 ppm de media en 8h\nFuente: Cuarto almanaque de datos y tendencias de la calidad del aire en 20 ciudades mexicanas (2000-2009) ñ Instituto Nacional de Ecologia\nValores fijados en las Directrices de la Organización Mundial de la Salud\nO3\n0.05 ppm de la media en 8h\nDefinición y fuentes principales\nEl ozono a nivel del suelo -que no debe confundirse con la capa de ozono en la atmósfera superior- es uno de los principalescomponentes de la niebla tóxica. …ste se forma por la reacción con la luz solar (fotoquímica) de contaminantes como los óxidosde nitrógeno (NOx) procedentes de las emisiones de vehículos o la industria y los compuestos orgánicos volátiles (COV) emitidos por los vehículos, los disolventes y la industria. Los niveles de ozono más elevados se registran durante los períodos de tiempo soleado.\nEfectos sobre la salud\nEl exceso de ozono en el aire puede producir efectos adversos de consideración en la salud humana. Puede causar problemas respiratorios, provocar asma, reducir la función pulmonar y originar enfermedades pulmonares. Actualmente se trata de uno de los contaminantes atmosféricos que más preocupan en el mundo. Diversos estudios europeos han revelado que la mortalidad diaria y mortalidad por cardiopatías aumentan un 0,3% y un 0,4% respectivamente con un aumento de 10 ug/m\u00B3 en la concentración de ozono.";
    [arregloGlosarioDatos addObject:glor8];
    
    Glosario*glor9=[[Glosario alloc]init];
    glor9.titulo_glosario=@"Partículas Suspendidas";
    glor9.detalles=@"Valores fijados en las Directrices de la Norma Oficial Mexicana NOM-025-SSA1-1993\nPM2.5\n15 ug/m\u00B3 de media anual\n65 ug/m\u00B3 de media en 24h\nPM10\n50 ug/m\u00B3 de media anual\n120 ug/m\u00B3 de media en 24h\nFuente: Cuarto almanaque de datos y tendencias de la calidad del aire en 20 ciudades mexicanas (2000-2009)  Instituto Nacional de Ecologia\n\nValores fijados en las Directrices de la Organización Mundial de la Salud\nPM2.5\n10 ug/m\u00B3 de media anual\n25 ug/m\u00B3 de media en 24h\nPM10\n20 ug/m\u00B3 de media anual\n50 ug/m\u00B3 de media en 24h\nDefinición y fuentes principales\nLas PM afectan a más personas que cualquier otro contaminante y sus principales componentes son los sulfatos, los nitratos, el amoníaco, el cloruro sódico, el carbón, el polvo de minerales y el agua. Las PM consisten en una compleja mezcla de partículas líquidas y sólidas de sustancias orgánicas e inorgánicas suspendidas en el aire. Las partículas se clasifican en función de su diámetro aerodinámico en PM\u00B1\u00B0 (partículas con un diámetro aerodinámico inferior a 10 um) y PM2.5 (diámetro aerodinámico inferior a 2,5 um). Estas últimas suponen mayor peligro porque, al inhalarlas, pueden alcanzar las zonas periféricas de los bronquiolos y alterar el intercambio pulmonar de gases.\n Efectos sobre la salud\nLos efectos de las PM sobre la salud se producen a los niveles de exposición a los que está sometida actualmente la mayoría de la población urbana y rural de los países desarrollados y en desarrollo. La exposición crónica a las partículas aumenta el riesgo de enfermedades cardiovasculares y respiratorias, así como de cáncer de pulmón. En los países en desarrollo, la exposición a los contaminantes derivados de la combustión de combustibles sólidos en fuegos abiertos y cocinas tradicionales en espacios cerrados aumenta el riesgo de infección aguda en las vías respiratorias inferiores y la mortalidad por esta causa en los niños pequeños; la polución atmosférica en espacios interiores procedente de combustibles sólidos constituye también un importante factor de riesgo de enfermedad pulmonar obstructiva crónica y cáncer de pulmón entre los adultos. La mortalidad en ciudades con niveles elevados de contaminación supera entre un 15% y un 20% la registrada en ciudades más limpias. Incluso en la Unión Europea, la esperanza de vida promedio es 8,6 meses inferior debido a la exposición a las PM2.5 generadas por actividades humanas.\n";
    [arregloGlosarioDatos addObject:glor9];
    
    Glosario*glor10=[[Glosario alloc]init];
    glor10.titulo_glosario=@"PPM";
    glor10.detalles=@"Partes por millón (ppm) es la unidad de medida con la que se evalua la concentración. Se refiere a la cantidad de unidades de la sustancia (agente, etc) que hay por cada millón de unidades del conjunto. Por ejemplo en un millón de granos de arroz, si se pintara uno de negro, este grano representaría una (1) parte por millón. Se abrevia como 'ppm'\nFuente: http://es.wikipedia.org/wiki/Partes_por_mill%C3%B3n";
    [arregloGlosarioDatos addObject:glor10];
    
    Glosario*glor11=[[Glosario alloc]init];
    glor11.titulo_glosario=@"Vulnerables";
    glor11.detalles=@"Todos somos vulnerables porque respiramos un promedio de 12 mil litros de aire por persona por día. Sin embargo, en este grupo se consideran quienes no tienen un riesgo significativo mayor de sufrir los efectos de la contaminación.";
    [arregloGlosarioDatos addObject:glor11];

    Glosario*glor12=[[Glosario alloc]init];
    glor12.titulo_glosario=@"UG/M\u00B3";
    glor12.detalles=@"La concentración de los contaminantes atmosféricos suele expresarse en microgramos (una millonésima de gramo) por metro cúbico de aire  o ug/m\u00B3.";
    [arregloGlosarioDatos addObject:glor12];




    
    /* titulos=[[NSMutableArray alloc]initWithObjects:@"Dióxido de Azufre (SO2)",
     @"Dióxido de Nitrógeno (NO2)",
     @"Estación de Monitoreo",
     @"Imeca",
     @"Más Vulnerables",
     @"Monóxido de Carbono (CO) ",
     @"Organización Mundial de la Salud",
     @"Ozono (O3)",
     @"Partículas Suspendidas",
     @"PPM",
     @"Radiación Ultravioleta (UV)",
     @"Vulnerables",
     @"UG/m\u00B3", nil];
*/
    
}
-(NSMutableArray*)getArregloGlosarioDatos{
    return arregloGlosarioDatos;
}
@end
