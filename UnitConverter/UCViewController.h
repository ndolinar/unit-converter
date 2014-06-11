//
//  UCViewController.h
//  UnitConverter
//
//  Created by Neja Dolinar on 27/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UCViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *lengthButton;
@property (strong, nonatomic) IBOutlet UIButton *weightButton;
@property (strong, nonatomic) IBOutlet UIButton *volumeButton;
@property (strong, nonatomic) IBOutlet UIButton *areaButton;
@property (strong, nonatomic) IBOutlet UIButton *speedButton;
@property (strong, nonatomic) IBOutlet UIButton *tempButton;
@property (strong, nonatomic) IBOutlet UIButton *timeButton;
@property (strong, nonatomic) IBOutlet UIButton *angleButton;


@property (strong,nonatomic) NSArray *UCButtons;

@end
