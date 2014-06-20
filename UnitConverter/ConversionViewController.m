//
//  ConversionViewController.m
//  UnitConverter
//
//  Created by Neja Dolinar on 27/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ConversionViewController.h"
#import "Calculator.h"
#import <QuartzCore/QuartzCore.h>


@interface ConversionViewController () {

    UISwipeGestureRecognizer *swipeRight;
    NSString *unit1;
    NSString *unit2;
    NSString *shortUnit1;
    NSString *shortUnit2;
}

@end

@implementation ConversionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    unit1 = self.units[0];
    unit2 = self.units[1];
    
    shortUnit1 = self.shortNames[0];
    shortUnit2 = self.shortNames[1];
    
    self.title = @"Converting";
    self.firstUnit.text = unit1;
    self.secondUnit.text = unit2;
    
    UIView *padding = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 40)];
    self.textField.leftView = padding;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.delegate = self;
    self.textField.layer.cornerRadius = 5.0f;
    self.textField.layer.masksToBounds = YES;
    self.textField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.textField.layer.borderWidth = 1.0f;
    
    self.convertBtn.layer.cornerRadius = 5.0f;
    self.textField.layer.masksToBounds = YES;

    
    
    
    self.calc = [[Calculator alloc]init];
    double result = [self.calc router:self.quantity firstUnit:self.units[0] secondUnit:self.units[1] value:1];
    
    double result0 = [self.calc router:self.quantity firstUnit:self.units[0] secondUnit:self.units[1] value:0];
    

    self.resultLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.resultLabel.numberOfLines = 0;
    
    self.conversionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.conversionLabel.numberOfLines = 0;
    self.conversionLabel.text = [NSString stringWithFormat:@"1 %@ equals %g %@", self.shortNames[0], result, self.shortNames[1]];
    
    self.resultLabel.text = [NSString stringWithFormat:@"0 %@ equals %g %@",shortUnit1, result0, shortUnit2];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
    
    swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:swipeRight];
    
}

-(void)swipeRight:(UISwipeGestureRecognizer*)recognizer{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dismissKeyboard{
    [self textFieldShouldReturn:self.textField];
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];


    double result = [self.calc router:self.quantity firstUnit:unit1 secondUnit:unit2 value:[self.textField.text floatValue]];

    self.resultLabel.text = [NSString stringWithFormat:@"%g %@ equals %g %@", [self.textField.text doubleValue], shortUnit1, result, shortUnit2];
    return YES;
}

- (IBAction)reverseUnits:(id)sender {
    NSString *tempString = unit1;
    NSString *tempShortString = shortUnit1;
    
    unit1 = unit2;
    shortUnit1 = shortUnit2;
    
    unit2 = tempString;
    shortUnit2 = tempShortString;
 
    [UIView animateWithDuration:0.09 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.firstUnit setAlpha:0];
        [self.secondUnit setAlpha:0];
    } completion:^(BOOL finished){
        self.firstUnit.text = unit1;
        self.secondUnit.text = unit2;
        [UIView animateWithDuration:0.3 animations:^{
            [self.firstUnit setAlpha:1];
            [self.secondUnit setAlpha:1];
        } completion:^(BOOL finished){
            
        }];
    }];
    
    double result = [self.calc router:self.quantity firstUnit:unit1 secondUnit:unit2 value:1];
    self.conversionLabel.text = [NSString stringWithFormat:@"1 %@ equals %g %@", shortUnit1, result, shortUnit2];
    
    [self textFieldShouldReturn:self.textField];

}

- (IBAction)buttonTouchDown:(UIButton *)sender {
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        sender.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.2 animations:^{
            sender.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
        } completion:^(BOOL finished){
        }];
    }];

}

- (IBAction)convertButton:(id)sender {
    [self textFieldShouldReturn:self.textField];
}


@end
