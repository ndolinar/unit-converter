//
//  Calculator.m
//  UnitConverter
//
//  Created by Neja Dolinar on 28/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(double)router:(NSString*)quantity firstUnit:(NSString*)firstUnit secondUnit:(NSString*)secondUnit value:(double)value{
    
    double result = 0;
    if([quantity isEqualToString:@"Length"]){
        result = [self lengthCalculator:firstUnit second:secondUnit value:value];
    }
    else if([quantity isEqualToString:@"Weight"]){
        result = [self weightCalculator:firstUnit second:secondUnit value:value];
    }
    else if([quantity isEqualToString:@"Volume"]){
        result = [self volumeCalculator:firstUnit second:secondUnit value:value];
    }
    else if([quantity isEqualToString:@"Area"]){
        result = [self areaCalculator:firstUnit second:secondUnit value:value];
    }
    else if([quantity isEqualToString:@"Speed"]){
        result = [self speedCalculator:firstUnit second:secondUnit value:value];
    }
    else if([quantity isEqualToString:@"Temperature"]){
        result = [self temperatureCalculator:firstUnit second:secondUnit value:value];
    }
    else if([quantity isEqualToString:@"Time"]){
        result = [self timeCalculator:firstUnit second:secondUnit value:value];
    }
    else if([quantity isEqualToString:@"Angle"]){
        result = [self angleCalculator:firstUnit second:secondUnit value:value];
    }
    
    return result;
    
}

-(double)lengthCalculator:(NSString*)first second:(NSString*)second value:(double)value{
    
    double temp = 0;
    //inch
    if([first isEqualToString:@"Inch"]){
        if([second isEqualToString:@"Foot"]){
            temp = value / 12;
        } else if ([second isEqualToString:@"Yard"]){
            temp = value / 36;
        } else if([second isEqualToString:@"Mile"]){
            temp = value / 63360;
        } else if([second isEqualToString:@"Centimeter"]){
            temp = value * 2.54;
        } else if([second isEqualToString:@"Meter"]){
            temp = value * 0.0254;
        } else if([second isEqualToString:@"Kilometer"]){
            temp = value * 0.0000254;
        }
    }
    
    //foot
    if([first isEqualToString:@"Foot"]){
        if([second isEqualToString:@"Inch"]){
            temp = value * 12;
        } else if([second isEqualToString:@"Yard"]){
            temp = value * 1/3;
        } else if([second isEqualToString:@"Mile"]){
            temp = value / 5280;
        } else if([second isEqualToString:@"Centimeter"]){
            temp = value * 30.48;
        } else if([second isEqualToString:@"Meter"]){
            temp = value * 0.3048;
        } else if([second isEqualToString:@"Kilometer"]){
            temp = value * 0.0003048;
        }
    }
    //yard
    if([first isEqualToString:@"Yard"]){
        if([second isEqualToString:@"Inch"]){
            temp = value * 36;
        } else if([second isEqualToString:@"Foot"]){
            temp = value * 3;
        } else if([second isEqualToString:@"Mile"]){
            temp = value * 1/1760;
        } else if([second isEqualToString:@"Centimeter"]){
            temp = value * 91.44;
        } else if([second isEqualToString:@"Meter"]){
            temp = (value * 91.44) / 100;
        } else if([second isEqualToString:@"Kilometer"]){
            temp = (value * 91.44) / 100000;
        }
    }
    
    //mile
    if([first isEqualToString:@"Mile"]){
        if([second isEqualToString:@"Inch"]){
            temp = value * 63360;
        } else if([second isEqualToString:@"Foot"]){
            temp = value * 5280;
        } else if([second isEqualToString:@"Yard"]){
            temp = value * 1760;
        } else if([second isEqualToString:@"Centimeter"]){
            temp = value * 160934.4;
        } else if([second isEqualToString:@"Meter"]){
            temp = value * 1609.344;
        } else if([second isEqualToString:@"Kilometer"]){
            temp = value * 1.609344;
        }
    }
    
    //Centimeter
    if([first isEqualToString:@"Centimeter"]){
        if([second isEqualToString:@"Inch"]){
            temp = value / 2.54;
        } else if([second isEqualToString:@"Foot"]){
            temp = (value / 2.54) / 12;
        } else if([second isEqualToString:@"Yard"]){
            temp = ((value /2.54) / 12) / 3;
        } else if([second isEqualToString:@"Mile"]){
            temp = (((value /2.54) / 12) / 3) / 1760;
        } else if([second isEqualToString:@"Meter"]){
            temp = value / 100;
        } else if([second isEqualToString:@"Kilometer"]){
            temp = value / 100000;
        }
    }
    
    //meter
    if([first isEqualToString:@"Meter"]){
        if([second isEqualToString:@"Inch"]){
            temp = value * 100/2.54;
        } else if([second isEqualToString:@"Foot"]){
            temp = value * (100 / 2.54) / 12;
        } else if([second isEqualToString:@"Yard"]){
            temp = value * ((100 /2.54) / 12) / 3;
        } else if([second isEqualToString:@"Mile"]){
            temp = value * (((100 /2.54) / 12) / 3) / 1760;
        } else if([second isEqualToString:@"Centimeter"]){
            temp = value * 100;
        } else if([second isEqualToString:@"Kilometer"]){
            temp = value / 1000;
        }
    }
    
    //km
    if([first isEqualToString:@"Kilometer"]){
        if([second isEqualToString:@"Inch"]){
            temp = value * (100000/2.54);
        } else if([second isEqualToString:@"Foot"]){
            temp = value * (100000 / 2.54) / 12;
        } else if([second isEqualToString:@"Yard"]){
            temp = value * ((100000 /2.54) / 12) / 3;
        } else if([second isEqualToString:@"Mile"]){
            temp = value * (((100000 /2.54) / 12) / 3) / 1760;
        } else if([second isEqualToString:@"Centimeter"]){
            temp = value * 100000;
        } else if([second isEqualToString:@"Meter"]){
            temp = value * 1000;
        }
    }
    
    return temp;
    
}
-(double)weightCalculator:(NSString*)first second:(NSString*)second value:(double)value{
    double temp = 0;
    
    //oz
    if([first isEqualToString:@"Ounce"]){
        if([second isEqualToString:@"Pound"]){
            temp = value / 16;
        } else if([second isEqualToString:@"Stone"]){
            temp = value / 224;
        } else if([second isEqualToString:@"Long Ton"]){ //long ton
            temp = value / 35840;
        } else if([second isEqualToString:@"Short Ton"]){ //short ton
            temp = value / 32000;
        } else if([second isEqualToString:@"Gram"]){
            temp = (value / 16) * 453.59237;
        } else if([second isEqualToString:@"Kilogram"]){
            temp =  (value / 16) * 0.45359237;
        } else if([second isEqualToString:@"Metric Ton"]){
            temp = (value / 16) * 0.00045359237;
        }
    }
    
    //lb
    if([first isEqualToString:@"Pound"]){
        if([second isEqualToString:@"Ounce"]){
            temp = value * 16;
        } else if([second isEqualToString:@"Stone"]){
            temp = value / 14;
        } else if([second isEqualToString:@"Long Ton"]){ //long ton
            temp = value / 2240;
        } else if([second isEqualToString:@"Short Ton"]){ //short ton
            temp = value / 2000;
        } else if([second isEqualToString:@"Gram"]){
            temp = value * 453.59237;
        } else if([second isEqualToString:@"Kilogram"]){
            temp =  value * 0.45359237;
        } else if([second isEqualToString:@"Metric Ton"]){
            temp = value * 0.00045359237;
        }
    }
    
    //st
    if([first isEqualToString:@"Stone"]){
        if([second isEqualToString:@"Ounce"]){
            temp = value * 224;
        } else if([second isEqualToString:@"Pound"]){
            temp = value * 14;
        } else if([second isEqualToString:@"Long Ton"]){ //long ton
            temp = value / 160;
        } else if([second isEqualToString:@"Short Ton"]){ //short ton
            temp = value / 142.857143;
        } else if([second isEqualToString:@"Gram"]){
            temp = (value * 453.59237) * 14;
        } else if([second isEqualToString:@"Kilogram"]){
            temp = (value * 0.45359237) * 14;
        } else if([second isEqualToString:@"Metric Ton"]){
            temp = (value * 0.00045359237) * 14;
        }
    }
    
    //long ton
    if([first isEqualToString:@"Long Ton"]){
        if([second isEqualToString:@"Ounce"]){
            temp = value * 35840;
        } else if([second isEqualToString:@"Pound"]){
            temp = value * 2240;
        } else if([second isEqualToString:@"Stone"]){
            temp = value * 160;
        } else if([second isEqualToString:@"Short Ton"]){ //short ton
            temp = value / 1.12;
        } else if([second isEqualToString:@"Gram"]){
            temp = (value * 453.59237) * 2240;
        } else if([second isEqualToString:@"Kilogram"]){
            temp = (value * 0.45359237) * 2240;
        } else if([second isEqualToString:@"Metric Ton"]){
            temp = (value * 0.00045359237) * 2240;
        }
    }
    
    //short ton
    if([first isEqualToString:@"Short Ton"]){
        if([second isEqualToString:@"Ounce"]){
            temp = value * 32000;
        } else if([second isEqualToString:@"Pound"]){
            temp = value * 2000;
        } else if([second isEqualToString:@"Stone"]){
            temp = value * 142.857143;
        } else if([second isEqualToString:@"Long Ton"]){ //long ton
            temp = value * 1.12;
        } else if([second isEqualToString:@"Gram"]){
            temp = (value * 453.59237) * 2000;
        } else if([second isEqualToString:@"Kilogram"]){
            temp = (value * 0.45359237) * 2000;
        } else if([second isEqualToString:@"Metric Ton"]){
            temp = (value * 0.00045359237) * 2000;
        }
    }
    
    //gram
    if([first isEqualToString:@"Gram"]){
        if([second isEqualToString:@"Ounce"]){
            temp = (value / 453.59237) * 16;
        } else if([second isEqualToString:@"Pound"]){
            temp = value / 453.59237;
        } else if([second isEqualToString:@"Stone"]){
            temp = (value / 453.59237) / 14;
        } else if([second isEqualToString:@"Short Ton"]){ //short ton
            temp = (value / 453.59237) / 2000;
        } else if([second isEqualToString:@"Long Ton"]){ //long ton
            temp = (value / 453.59237) / 2240;
        } else if([second isEqualToString:@"Kilogram"]){
            temp = value / 1000;
        } else if([second isEqualToString:@"Metric Ton"]){
            temp = value / 1000000;
        }
    }
    
    //kg
    if([first isEqualToString:@"Kilogram"]){
        if([second isEqualToString:@"Ounce"]){
            temp = (value / 0.45359237) * 16;
        } else if([second isEqualToString:@"Pound"]){
            temp = value / 0.45359237;
        } else if([second isEqualToString:@"Stone"]){
            temp = (value / 0.45359237) / 14;
        } else if([second isEqualToString:@"Short Ton"]){ //short ton
            temp = (value / 0.45359237) / 2000;
        } else if([second isEqualToString:@"Long Ton"]){ //long ton
            temp = (value / 0.45359237) / 2240;
        } else if([second isEqualToString:@"Gram"]){
            temp = value * 1000;
        } else if([second isEqualToString:@"Metric Ton"]){
            temp = value / 1000;
        }
    }
    
    //t
    if([first isEqualToString:@"Metric Ton"]){
        if([second isEqualToString:@"Ounce"]){
            temp = (value / 0.00045359237) * 16;
        } else if([second isEqualToString:@"Pound"]){
            temp = value / 0.00045359237;
        } else if([second isEqualToString:@"Stone"]){
            temp = (value / 0.00045359237) / 14;
        } else if([second isEqualToString:@"Short Ton"]){ //short ton
            temp = (value / 0.00045359237) / 2000;
        } else if([second isEqualToString:@"Long Ton"]){ //long ton
            temp = (value / 0.00045359237) / 2240;
        } else if([second isEqualToString:@"Gram"]){
            temp = value * 1000000;
        } else if([second isEqualToString:@"Kilogram"]){
            temp = value * 1000;
        }
    }

    return temp;
}
-(double)volumeCalculator:(NSString*)first second:(NSString*)second value:(double)value{
    double temp = 0;
    
    //liter
    if([first isEqualToString:@"Liter"]){
        if([second isEqualToString:@"Cubic Cm"]){
            temp = value * 1000;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = value * 0.001;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = value * 61.0237440947323;
        } else if([second isEqualToString:@"Cubic Foot"]){
            temp = value * 0.035314666721489;
        } else if([second isEqualToString:@"US Gallon"]){
            temp = value / 3.785411784;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            temp = (value / 3.785411784) * 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = value / 4.54609;
        } else if([second isEqualToString:@"Fluid Oz"]){
            temp = (value / 4.54609) * 160;
        }
    }
    
    //cubic cm
    if([first isEqualToString:@"Cubic Cm"]){
        if([second isEqualToString:@"Liter"]){
            temp = value / 1000;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = value * 0.000001;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = (value * 61.0237440947323) / 1000;
        } else if([second isEqualToString:@"Cubic Foot"]){
            temp = (value * 3.5314666721489) / 100000;
        } else if([second isEqualToString:@"US Gallon"]){
            temp = (value / 3.785411784) / 1000;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            temp = ((value / 3.785411784) / 1000) * 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = (value / 4.54609) / 1000;
        } else if([second isEqualToString:@"Fluid Oz"]){
            temp = ((value / 4.54609) / 1000) * 160;
        }
    }
    
    //cubic m
    if([first isEqualToString:@"Cubic Meter"]){
        if([second isEqualToString:@"Liter"]){
            temp = value * 1000;
        } else if([second isEqualToString:@"Cubic Cm"]){
            temp = value * 1000000;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = (value * 61.0237440947323) * 1000;
        } else if([second isEqualToString:@"Cubic Foot"]){
            temp = (value * 3.5314666721489) * 10;
        } else if([second isEqualToString:@"US Gallon"]){
            temp = (value / 3.785411784) * 1000;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            temp = ((value / 3.785411784) * 1000) * 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = (value / 4.54609) * 1000;
        } else if([second isEqualToString:@"Fluid Oz"]){
            temp = ((value / 4.54609) * 1000) * 160;
        }
    }
    
    //cubic inch
    if([first isEqualToString:@"Cubic Inch"]){
        if([second isEqualToString:@"Liter"]){
            temp = value / 61.0237440947323;
        } else if([second isEqualToString:@"Cubic Cm"]){
            temp = (value / 61.0237440947323) * 1000;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = (value / 61.0237440947323) / 1000;
        } else if([second isEqualToString:@"Cubic Foot"]){
            temp = value / 1728;
        } else if([second isEqualToString:@"US Gallon"]){
            temp = value / 231;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            temp = value / 231 * 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = value / 277.41954745524;
        } else if([second isEqualToString:@"Fluid Oz"]){
            temp = value / 277.41954745524 * 160;
        }
    }
    
    //cubic foot
    if([first isEqualToString:@"Cubic Foot"]){
        if([second isEqualToString:@"Liter"]){
            temp = value / 0.035314666721489;
        } else if([second isEqualToString:@"Cubic Cm"]){
            temp = (value / 61.0237440947323) * 1000 * 1728;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = ((value / 61.0237440947323) / 1000) * 1728;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = value * 1728;
        } else if([second isEqualToString:@"US Gallon"]){
            temp = value / 231 * 1728;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            temp = value / 231 * 1728 * 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = (value / 277.41954745524) * 1728;
        } else if([second isEqualToString:@"Fluid Oz"]){
            temp = value * 996.61361162673;
        }
    }
    
    //US gal
    if([first isEqualToString:@"US Gallon"]){
        if([second isEqualToString:@"Liter"]){
            temp = value * 3.785411784;
        } else if([second isEqualToString:@"Cubic Cm"]){
            temp = (value * 3.785411784) * 1000;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = (value * 3.785411784) / 1000;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = value * 231;
        } else if([second isEqualToString:@"Cubic Foot"]){
            temp = value * 231 / 1728;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            temp = value * 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = (value * 3.785411784) / 4.54609;
        } else if([second isEqualToString:@"Fluid Oz"]){
            temp = (value * 3.785411784) / 4.54609 * 160;
        }
    }
    
    //US fl oz
    if([first isEqualToString:@"US Fluid Oz"]){
        if([second isEqualToString:@"Liter"]){
            temp = (value * 3.785411784) / 128;
        } else if([second isEqualToString:@"Cubic Cm"]){
            //ni tocn
            temp = ((value * 3.785411784) * 1000) / 128;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = (value * 3.785411784) / 1000 / 128;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = (value * 231) / 128;
        } else if([second isEqualToString:@"Cubic Foot"]){
            temp = value * 231 / 128 / 1728;
        } else if([second isEqualToString:@"US Gallon"]){
            temp = value / 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = ((value * 3.785411784) / 4.54609) / 128;
            //ni tocno
        } else if([second isEqualToString:@"Fluid Oz"]){
            //ni tocno
            temp = ((value * 3.785411784) / 4.54609 * 160) / 128;
        }
    }
    
    //gallon
    if([first isEqualToString:@"Gallon"]){
        if([second isEqualToString:@"Liter"]){
            temp = value * 4.54609;
        } else if([second isEqualToString:@"Cubic Cm"]){
            temp = (value * 4.54609) * 1000;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = (value * 4.54609) / 1000;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = value * 277.41954745524;
        } else if([second isEqualToString:@"Cubic Foot"]){
            //ni tocn
            temp = (value * 277.41954745524) / 1728;
        } else if([second isEqualToString:@"US Gallon"]){
            //ni tocn
            temp = (value / 3.785411784) * 4.54609;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            //ni tocn
            temp = ((value / 3.785411784) * 4.54609) * 128;
        } else if([second isEqualToString:@"Fluid Oz"]){
            temp = value * 160;
        }
    }
    
    //fl oz
    if([first isEqualToString:@"Fluid Oz"]){
        if([second isEqualToString:@"Liter"]){
            temp = (value * 4.54609) / 160;
        } else if([second isEqualToString:@"Cubic Cm"]){
            temp = ((value * 4.54609) * 1000) / 160;
        } else if([second isEqualToString:@"Cubic Meter"]){
            temp = ((value * 4.54609) / 1000) / 160;
        } else if([second isEqualToString:@"Cubic Inch"]){
            temp = value * 277.41954745524 / 160;
        } else if([second isEqualToString:@"Cubic Foot"]){
            temp = value / 996.61361162673;
        } else if([second isEqualToString:@"US Gallon"]){
            //ni tocn
            temp = (value / 3.785411784) * 4.54609 / 160;
        } else if([second isEqualToString:@"US Fluid Oz"]){
            //ni tocn
            temp = ((value / 3.785411784) * 4.54609 / 160) * 128;
        } else if([second isEqualToString:@"Gallon"]){
            temp = value / 160;
        }
    }

    
     return temp;
}
-(double)areaCalculator:(NSString*)first second:(NSString*)second value:(double)value{
    double temp = 0;
    
    //sq inch
    if([first isEqualToString:@"Sq Inch"]) {
        if([second isEqualToString:@"Sq Foot"]){
            temp = value / 144;
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value/1296;
        } else if([second isEqualToString:@"Sq Mile"]){
            temp = value/pow(63360, 2);
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * pow(2.54, 2);
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = value * pow(0.0254, 2);
        } else if([second isEqualToString:@"Sq Km"]){
            temp = value * pow(0.0000254, 2);

        } else if([second isEqualToString:@"Acre"]){
            temp = value / 6272640;

        } else if([second isEqualToString:@"Are"]){
            temp = value / (pow((100/2.54), 2) * 100);
        }
    }
    
    //sq ft
    if([first isEqualToString:@"Sq Foot"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value * 144;
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value * 1/9;
        } else if([second isEqualToString:@"Sq Mile"]){
            temp = value/ pow(5280, 2);
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * pow(30.48, 2);
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = value * pow(0.3048, 2);
        } else if([second isEqualToString:@"Sq Km"]){
            temp = value * pow(0.0003048, 2);
        } else if([second isEqualToString:@"Acre"]){
            temp = value / 43560;
        } else if([second isEqualToString:@"Are"]){
            temp = value / (pow((100/30.48), 2) * 100);
        }
    }
    
    //sq yd
    if([first isEqualToString:@"Sq Yard"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value * 1296;
        } else if([second isEqualToString:@"Sq Foot"]){
            temp = value * 9;
        } else if([second isEqualToString:@"Sq Mile"]){
            temp = value * 1/pow(1760, 2);
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * 8361.2736;
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = (value * 8361.2736)/10000;
        } else if([second isEqualToString:@"Sq Km"]){
            temp = (value * pow(91.44, 2))/10000000000;
        } else if([second isEqualToString:@"Acre"]){
            temp = value / 4840;
        } else if([second isEqualToString:@"Are"]){
            temp = value / (pow((100/91.44), 2) * 100);
        }
    }
    
    //sq mi
    if([first isEqualToString:@"Sq Mile"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value * pow(63360, 2) ;
        } else if([second isEqualToString:@"Sq Foot"]){
            temp = value * pow(5280, 2);
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value * pow(1760, 2);
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * pow(160934.4, 2);
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = value * pow(1609.344, 2);
        } else if([second isEqualToString:@"Sq Km"]){
            temp = value * pow(1.609344, 2);
        } else if([second isEqualToString:@"Acre"]){
            temp = value * 640;
        } else if([second isEqualToString:@"Are"]){
            temp = value / (pow((100/160934.4), 2) * 100);
        }
    }
    
    //sq cm
    if([first isEqualToString:@"Sq Centimeter"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value / 6.4516 ;
        } else if([second isEqualToString:@"Sq Foot"]){
            temp = value / 929.0304;
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value / 8361.2736;
        } else if([second isEqualToString:@"Sq Mile"]){
            temp = value/ pow(160934.4, 2);
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = value / 10000;
        } else if([second isEqualToString:@"Sq Km"]){
            temp = value / 10000000000;
        } else if([second isEqualToString:@"Acre"]){
            temp = value / 40468564.224;
        } else if([second isEqualToString:@"Are"]){
            temp = value / 1000000;
        }
    }
    
    //sq meter
    if([first isEqualToString:@"Sq Meter"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value * pow((100/2.54), 2) ;
        } else if([second isEqualToString:@"Sq Foot"]){
            temp = value * pow((100/30.48), 2);
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value * pow((100/91.44), 2);
        } else if([second isEqualToString:@"Sq Mile"]){
            temp = value * pow((100/160934.4), 2);
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * 10000;
        } else if([second isEqualToString:@"Sq Km"]){
            temp = value / 1000000;
        } else if([second isEqualToString:@"Acre"]){
            temp = value / 4046.8564224;
        } else if([second isEqualToString:@"Are"]){
            temp = value / 100;
        }
    }
    
    //sq km
    if([first isEqualToString:@"Sq Km"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value * pow((100000/2.54), 2);
        } else if([second isEqualToString:@"Sq Foot"]){
            temp = value * pow((100000/30.48), 2);
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value * pow((100000/91.44), 2);
        } else if([second isEqualToString:@"Sq Mile"]){
            //temp = value * pow((100000/160934.4), 2);
            temp = value / pow(1.609344, 2);
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * 10000000000;
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = value * 1000000;
        } else if([second isEqualToString:@"Acre"]){
            temp = value * (1000000/4046.8564224);
        } else if([second isEqualToString:@"Are"]){
            temp = value * 1000;
        }
    }
    
    //acre
    if([first isEqualToString:@"Acre"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value * 6272640;
        } else if([second isEqualToString:@"Sq Foot"]){
            temp = value * 43560;
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value * 4840;
        } else if([second isEqualToString:@"Sq Mile"]){
            temp = value / 640;
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * 40468564.224;
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = value * 4046.8564224;
        } else if([second isEqualToString:@"Sq Km"]){
            temp = (value * 4046.8564224)/ 1000000;
        } else if([second isEqualToString:@"Are"]){
            temp = value * 40.468564224;
        }
    }
    
    //are
    if([first isEqualToString:@"Are"]) {
        if([second isEqualToString:@"Sq Inch"]){
            temp = value * pow((100/2.54), 2) * 100 ;
        } else if([second isEqualToString:@"Sq Foot"]){
            temp = value * pow((100/30.48), 2) * 100;
        } else if([second isEqualToString:@"Sq Yard"]){
            temp = value * pow((100/91.44), 2) * 100;
        } else if([second isEqualToString:@"Sq Mile"]){
            temp = value * pow((100/160934.4), 2) * 100;
        } else if([second isEqualToString:@"Sq Centimeter"]){
            temp = value * 1000000;
        } else if([second isEqualToString:@"Sq Meter"]){
            temp = value * 100;
        } else if([second isEqualToString:@"Sq Km"]){
            temp = value / 10000;
        } else if([second isEqualToString:@"Acre"]){
            temp = value / 40.468564224;
        }
    }

    return temp;
}
-(double)speedCalculator:(NSString*)first second:(NSString*)second value:(double)value{
    double temp = 0;
    
    //fps
    if([first isEqualToString:@"Feet/Sec"]) {
        if([second isEqualToString:@"Miles/Hour"]){
            temp = value * 0.681818;
        } else if([second isEqualToString:@"Meters/Sec"]){
            temp = value * 0.3048;
        } else if([second isEqualToString:@"Km/Hour"]){
            temp = value * 1.09728;
        } else if([second isEqualToString:@"Knots/Hour"]){
            temp = value * 0.592484;
        }
    }
    
    //mph
    if([first isEqualToString:@"Miles/Hour"]) {
        if([second isEqualToString:@"Feet/Sec"]){
            temp = value * 1.466667;
        } else if([second isEqualToString:@"Meters/Sec"]){
            temp = value * 0.44704;
        } else if([second isEqualToString:@"Km/Hour"]){
            temp = value * 1.609344;
        } else if([second isEqualToString:@"Knots/Hour"]){
            temp = value * 0.868976;
        }
    }
    
    //m/s
    if([first isEqualToString:@"Meters/Sec"]) {
        if([second isEqualToString:@"Feet/Sec"]){
            temp = value * 3.280840;
        } else if([second isEqualToString:@"Miles/Hour"]){
            temp = value * 2.236936;
        } else if([second isEqualToString:@"Km/Hour"]){
            temp = value * 3.6;
        } else if([second isEqualToString:@"Knots/Hour"]){
            temp = value * 1.943844;
        }
    }
    
    //km/h
    if([first isEqualToString:@"Km/Hour"]) {
        if([second isEqualToString:@"Feet/Sec"]){
            temp = value * 0.911344;
        } else if([second isEqualToString:@"Miles/Hour"]){
            temp = value * 0.621371;
        } else if([second isEqualToString:@"Meters/Sec"]){
            temp = value * 0.277778;
        } else if([second isEqualToString:@"Knots/Hour"]){
            temp = value * 0.539957;
        }
    }
    
    //kn
    if([first isEqualToString:@"Knots/Hour"]) {
        if([second isEqualToString:@"Feet/Sec"]){
            temp = value * 1.687810;
        } else if([second isEqualToString:@"Miles/Hour"]){
            temp = value * 1.150779;
        } else if([second isEqualToString:@"Meters/Sec"]){
            temp = value * 0.514444;
        } else if([second isEqualToString:@"Km/Hour"]){
            temp = value * 1.852;

        }
    }

    return temp;
}
-(double)temperatureCalculator:(NSString*)first second:(NSString*)second value:(double)value{

    double temp = 0;

    if ([first isEqualToString:@"Kelvin"]) {
        if ([second isEqualToString:@"Celsius"]) {
            temp = value - 273.15;
        } else if ([second isEqualToString:@"Fahrenheit"]){
            temp = (value - 273.15) * 1.8 + 32;
        }
    }
    
    //celsius
    if ([first isEqualToString:@"Celsius"]) {
        if ([second isEqualToString:@"Kelvin"]) {
            temp = value + 273.15;
        } else if ([second isEqualToString:@"Fahrenheit"]){
            temp = value * 9/5 + 32;
        }
    }
    
    //fahrenheit
    if ([first isEqualToString:@"Fahrenheit"]) {
        if ([second isEqualToString:@"Celsius"]) {
            temp = (value - 32) * 5/9;
        } else if ([second isEqualToString:@"Kelvin"]){
            temp = (value - 32) * 5/9 + 273.15;
        }
    }
    
    
     return temp;
}
    
-(double)timeCalculator:(NSString*)first second:(NSString*)second value:(double)value{
    double temp = 0;
    
    //Millisecond
    if([first isEqualToString:@"Millisecond"]) {
        if([second isEqualToString:@"Second"]){
            temp = value / 1000;
        } else if([second isEqualToString:@"Minute"]){
            temp = value / 1000 / 60;
        } else if([second isEqualToString:@"Hour"]){
            temp = value / 1000 / 60 / 60;
        } else if([second isEqualToString:@"Day"]){
            temp = value / 1000 / 60 / 60 / 24;
        } else if([second isEqualToString:@"Week"]){
            temp = value / 1000 / 60 / 60 / 24 / 7;
        } else if([second isEqualToString:@"Year"]){
            temp = value / 1000 / 60 / 60 / 24 / 365;
        }
    }
    
    //second
    if([first isEqualToString:@"Second"]) {
        if([second isEqualToString:@"Millisecond"]){
            temp = value * 1000;
        } else if([second isEqualToString:@"Minute"]){
            temp = value / 60;
        } else if([second isEqualToString:@"Hour"]){
            temp = value / 60 / 60;
        } else if([second isEqualToString:@"Day"]){
            temp = value / 60 / 60 / 24;
        } else if([second isEqualToString:@"Week"]){
            temp = value / 60 / 60 / 24 / 7;
        } else if([second isEqualToString:@"Year"]){
            temp = value / 60 / 60 / 24 / 365;
        }
    }
    
    //minute
    if([first isEqualToString:@"Minute"]) {
        if([second isEqualToString:@"Millisecond"]){
            temp = value * 1000 * 60;
        } else if([second isEqualToString:@"Second"]){
            temp = value * 60;
        } else if([second isEqualToString:@"Hour"]){
            temp = value / 60;
        } else if([second isEqualToString:@"Day"]){
            temp = value / 60 / 24;
        } else if([second isEqualToString:@"Week"]){
            temp = value / 60 / 24 / 7;
        } else if([second isEqualToString:@"Year"]){
            temp = value / 60 / 24 / 365;
        }
    }
    
    //hour
    if([first isEqualToString:@"Hour"]) {
        if([second isEqualToString:@"Millisecond"]){
            temp = value * 60 * 60 * 1000;
        } else if([second isEqualToString:@"Second"]){
            temp = value * 60 * 60;
        } else if([second isEqualToString:@"Minute"]){
            temp = value * 60;
        } else if([second isEqualToString:@"Day"]){
            temp = value / 24;
        } else if([second isEqualToString:@"Week"]){
            temp = value / 24 / 7;
        } else if([second isEqualToString:@"Year"]){
            temp = value / 24 / 365;
        }
    }
    
    //day
    if([first isEqualToString:@"Day"]) {
        if([second isEqualToString:@"Millisecond"]){
            temp = value * 60 * 60 * 1000 * 24;
        } else if([second isEqualToString:@"Second"]){
            temp = value * 24 * 60 * 60;
        } else if([second isEqualToString:@"Minute"]){
            temp = value * 24 * 60;
        } else if([second isEqualToString:@"Hour"]){
            temp = value * 24;
        } else if([second isEqualToString:@"Week"]){
            temp = value / 7;
        } else if([second isEqualToString:@"Year"]){
            temp = value / 365;
        }
    }
    
    
    //Week
    if([first isEqualToString:@"Week"]) {
        if([second isEqualToString:@"Millisecond"]){
            temp = value * 60 * 60 * 1000 * 24 * 7;
        } else if([second isEqualToString:@"Second"]){
            temp = value * 24 * 60 * 60 * 7;
        } else if([second isEqualToString:@"Minute"]){
            temp = value * 24 * 60 * 7;
        } else if([second isEqualToString:@"Hour"]){
            temp = value * 24 * 7;
        } else if([second isEqualToString:@"Day"]){
            temp = value * 7;
        } else if([second isEqualToString:@"Year"]){
            temp = value / 52.1775;
        }
    }
    
    
    //Year
    if([first isEqualToString:@"Year"]) {
        if([second isEqualToString:@"Millisecond"]){
            temp = value * 60 * 60 * 1000 * 24 * 7 * 365;
        } else if([second isEqualToString:@"Second"]){
            temp = value * 24 * 60 * 60 * 7 * 365;
        } else if([second isEqualToString:@"Minute"]){
            temp = value * 24 * 60 * 7 * 365;
        } else if([second isEqualToString:@"Hour"]){
            temp = value * 24 * 7 * 365;
        } else if([second isEqualToString:@"Day"]){
            temp = value * 365;
        } else if([second isEqualToString:@"Week"]){
            temp = value * 52.1775;
        }
    }

    return temp;
}
-(double)angleCalculator:(NSString*)first second:(NSString*)second value:(double)value{
    double temp = 0;
    
    //radian
    if([first isEqualToString:@"Radian"]) {
        if([second isEqualToString:@"Degree"]){
            temp = (value * 180)/ M_PI;
        } else if([second isEqualToString:@"Minute"]){
            temp = (value * 180)/ M_PI * 60;
        } else if([second isEqualToString:@"Second"]){
            temp = (value * 180)/ M_PI * 3600;
        }
    }
    
    //degree
    if([first isEqualToString:@"Degree"]) {
        if([second isEqualToString:@"Radian"]){
            temp = value * (M_PI/ 180);
        } else if([second isEqualToString:@"Minute"]){
            temp = value * 60;
        } else if([second isEqualToString:@"Second"]){
            temp = value * 3600;
        }
    }
    
    //minute
    if([first isEqualToString:@"Minute"]) {
        if([second isEqualToString:@"Radian"]){
            temp = value * (M_PI/ 180) / 60;
        } else if([second isEqualToString:@"Degree"]){
            temp = value / 60;
        } else if([second isEqualToString:@"Second"]){
            temp = value * 60;
        }
    }
    
    //second
    if([first isEqualToString:@"Second"]) {
        if([second isEqualToString:@"Radian"]){
            temp = value * (M_PI/ 180) / 3600;
        } else if([second isEqualToString:@"Degree"]){
            temp = value / 3600;
        } else if([second isEqualToString:@"Minute"]){
            temp = value / 60;
        }
    }
    
    return temp;
}


@end
