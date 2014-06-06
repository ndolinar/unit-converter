//
//  UnitViewController.h
//  UnitConverter
//
//  Created by Neja Dolinar on 27/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface UnitViewController : UIViewController <ADBannerViewDelegate>


//buttons
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn4;
@property (strong, nonatomic) IBOutlet UIButton *btn5;
@property (strong, nonatomic) IBOutlet UIButton *btn6;
@property (strong, nonatomic) IBOutlet UIButton *btn7;
@property (strong, nonatomic) IBOutlet UIButton *btn8;
@property (strong, nonatomic) IBOutlet UIButton *btn9;

//labels
@property (strong, nonatomic) IBOutlet UILabel *lbl1;
@property (strong, nonatomic) IBOutlet UILabel *lbl2;
@property (strong, nonatomic) IBOutlet UILabel *lbl3;
@property (strong, nonatomic) IBOutlet UILabel *lbl4;
@property (strong, nonatomic) IBOutlet UILabel *lbl5;
@property (strong, nonatomic) IBOutlet UILabel *lbl6;
@property (strong, nonatomic) IBOutlet UILabel *lbl7;
@property (strong, nonatomic) IBOutlet UILabel *lbl8;
@property (strong, nonatomic) IBOutlet UILabel *lbl9;


@property (strong,nonatomic) UIButton *currentButton;
@property (strong,nonatomic) UIButton *selectedButton;

@property (strong,nonatomic) NSArray *unitButtons;
@property (strong,nonatomic) NSArray *unitLabels;
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray *labels;
@property (strong,nonatomic) NSString *theTitle;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;



@end
