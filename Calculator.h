//
//  Calculator.h
//  UnitConverter
//
//  Created by Neja Dolinar on 28/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property (strong,nonatomic) NSString *quantity;
@property (strong,nonatomic) NSString *firstUnit;
@property (strong,nonatomic) NSString *secondUnit;

-(double)router:(NSString*)quantity firstUnit:(NSString*)firstUnit secondUnit:(NSString*)secondUnit value:(double)value;
-(double)lengthCalculator:(NSString*)first second:(NSString*)second value:(double)value;
-(double)weightCalculator:(NSString*)first second:(NSString*)second value:(double)value;
-(double)volumeCalculator:(NSString*)first second:(NSString*)second value:(double)value;
-(double)areaCalculator:(NSString*)first second:(NSString*)second value:(double)value;
-(double)speedCalculator:(NSString*)first second:(NSString*)second value:(double)value;
-(double)temperatureCalculator:(NSString*)first second:(NSString*)second value:(double)value;
-(double)timeCalculator:(NSString*)first second:(NSString*)second value:(double)value;
-(double)angleCalculator:(NSString*)first second:(NSString*)second value:(double)value;




@end
