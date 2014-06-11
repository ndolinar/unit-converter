//
//  ConversionViewController.h
//  UnitConverter
//
//  Created by Neja Dolinar on 27/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@class Calculator;

@interface ConversionViewController : UIViewController <ADBannerViewDelegate, UITextFieldDelegate>

@property (strong,nonatomic) NSString *quantity;

@property (strong, nonatomic) IBOutlet UILabel *firstUnit;
@property (strong, nonatomic) IBOutlet UILabel *secondUnit;
@property (strong,nonatomic) NSArray *units;
@property (strong,nonatomic) NSArray *shortNames;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UILabel *conversionLabel;

@property (strong,nonatomic) NSString *textForLabel;

@property (strong,nonatomic) Calculator *calc;
@property (weak, nonatomic) IBOutlet UIButton *convertBtn;

- (IBAction)reverseUnits:(id)sender;

- (IBAction)buttonTouchDown:(UIButton *)sender;
- (IBAction)convertButton:(id)sender;

@end
