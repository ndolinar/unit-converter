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

@end
