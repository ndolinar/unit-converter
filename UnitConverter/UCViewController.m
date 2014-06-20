//
//  UCViewController.m
//  UnitConverter
//
//  Created by Neja Dolinar on 27/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#import "UCViewController.h"
#import "UnitViewController.h"

@interface UCViewController ()

@end

@implementation UCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
    self.UCButtons = @[self.lengthButton, self.weightButton, self.volumeButton, self.areaButton, self.speedButton, self.tempButton, self.tempButton, self.timeButton, self.angleButton];
    
    for(UIButton *b in self.UCButtons){
        [b addTarget:self action:@selector(buttonTouchDown:event:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *super2 = @"\u00B2";
    NSString *super3 = @"\u00B3";
    
    UnitViewController *unit = [segue destinationViewController];
    if([segue.identifier isEqualToString:@"lengthSegue"]) {
        unit.titles = @[@"in", @"ft", @"yd", @"mi", @"cm", @"m", @"km"];
        unit.labels = @[@"Inch", @"Foot", @"Yard", @"Mile", @"Centimeter", @"Meter", @"Kilometer"];
        unit.theTitle = @"Length";
    }
    
    else if([segue.identifier isEqualToString:@"weightSegue"]){
        unit.titles = @[@"oz", @"lb", @"st", @"t [UK]", @"t [US]", @"g", @"kg", @"t"];
        unit.labels = @[@"Ounce", @"Pound", @"Stone", @"Long Ton", @"Short Ton", @"Gram", @"Kilogram", @"Metric Ton"];
        unit.theTitle = @"Weight";
    }
    
    else if([segue.identifier isEqualToString:@"volumeSegue"]){
        unit.titles = @[@"L",
                        [NSString stringWithFormat:@"cm%@", super3],
                        [NSString stringWithFormat:@"m%@", super3],
                        [NSString stringWithFormat:@"in%@", super3],
                        [NSString stringWithFormat:@"ft%@", super3],
                        @"US gal",
                        @"US fl oz",
                        @"gal",
                        @"fl oz"];
        unit.labels = @[@"Liter", @"Cubic Cm", @"Cubic Meter", @"Cubic Inch", @"Cubic Foot", @"US Gallon", @"US Fluid Oz", @"Gallon", @"Fluid Oz"];
        unit.theTitle = @"Volume";
    }
    
    else if([segue.identifier isEqualToString:@"areaSegue"]){
        unit.titles = @[[NSString stringWithFormat:@"in%@", super2],
                        [NSString stringWithFormat:@"ft%@", super2],
                        [NSString stringWithFormat:@"yd%@", super2],
                        [NSString stringWithFormat:@"mi%@", super2],
                        [NSString stringWithFormat:@"cm%@", super2],
                        [NSString stringWithFormat:@"m%@", super2],
                        [NSString stringWithFormat:@"km%@", super2],
                        @"ac",
                        @"a"];
        unit.labels = @[@"Sq Inch", @"Sq Foot", @"Sq Yard", @"Sq Mile", @"Sq Centimeter", @"Sq Meter", @"Sq Km", @"Acre", @"Are"];
        unit.theTitle = @"Area";
    }
    
    else if([segue.identifier isEqualToString:@"speedSegue"]){
        unit.titles = @[@"fps", @"mph", @"m/s", @"km/h", @"kn"];
        unit.labels = @[@"Feet/Sec", @"Miles/Hour", @"Meters/Sec", @"Km/Hour", @"Knots/Hour"];
        unit.theTitle = @"Speed";
    }
    
    else if([segue.identifier isEqualToString:@"tempSegue"]){
        unit.titles = @[@"K", @"˚C", @"˚F"];
        unit.labels = @[@"Kelvin", @"Celsius", @"Fahrenheit"];
        unit.theTitle = @"Temperature";
    }
    
    else if([segue.identifier isEqualToString:@"timeSegue"]){
        unit.titles = @[@"ms", @"s", @"min", @"h", @"d", @"w", @"y"];
        unit.labels = @[@"Millisecond", @"Second", @"Minute", @"Hour", @"Day", @"Week", @"Year"];
        unit.theTitle = @"Time";
    }
    
    else if([segue.identifier isEqualToString:@"angleSegue"]){
        unit.titles = @[@"rad", @"˚", @"'", @"''"];
        unit.labels = @[@"Radian", @"Degree", @"Minute", @"Second"];
        unit.theTitle = @"Angle";
    }
}


-(void)buttonTouchDown:(UIButton*)sender event:(UIEvent*)event{
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        sender.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.2 animations:^{
            sender.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
        } completion:^(BOOL finished){
        }];
    }];
    
}
- (IBAction)visitPage:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.nejoapps.eu/"]];
}

@end
