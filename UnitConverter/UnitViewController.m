//
//  UnitViewController.m
//  UnitConverter
//
//  Created by Neja Dolinar on 27/05/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#import "UnitViewController.h"
#import "ConversionViewController.h"

@interface UnitViewController () {
    UISwipeGestureRecognizer *swipeRight;
}

@end

@implementation UnitViewController

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
    

    self.titleLabel.text = self.theTitle;
    
    self.unitButtons = @[self.btn1, self.btn2, self.btn3, self.btn4, self.btn5, self.btn6, self.btn7, self.btn8, self.btn9];
    self.unitLabels = @[self.lbl1, self.lbl2, self.lbl3, self.lbl4, self.lbl5, self.lbl6, self.lbl7, self.lbl8, self.lbl9];
    
    for(UILabel *l in self.unitLabels){
        [l setHidden:YES];
    }
    for (UIButton *b in self.unitButtons) {
        [b setHidden:YES];
        
    }
    
    for(int i = 0; i < self.titles.count; i++) {
        [self.unitButtons[i] setTitle:self.titles[i] forState:UIControlStateNormal];
        [self.unitButtons[i] setHidden:NO];

        
        [self.unitButtons[i] addTarget:self action:@selector(touchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.unitButtons[i] addTarget:self action:@selector(upInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [self.unitButtons[i] addTarget:self action:@selector(upOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [self.unitButtons[i] addTarget:self action:@selector(dragMoving:event:) forControlEvents:UIControlEventTouchDragInside | UIControlEventTouchDragOutside];
        [self.unitButtons[i] addTarget:self action:@selector(dragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        

        ((UILabel*)self.unitLabels[i]).text = self.labels[i];
        [self.unitLabels[i] setHidden:NO];
    }
    
    //gesture recognizer
    swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:swipeRight];

    
}

-(void)swipeRight:(UISwipeGestureRecognizer*)recognizer{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchDown:(UIButton*)sender event:(UIEvent*)event{
    
    for(UIButton* b in self.unitButtons){
        if([b isEqual:sender]){
            self.currentButton = sender;
        }
    }
    swipeRight.enabled = NO;
    
    [UIView animateWithDuration:0.09 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        sender.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6);
    } completion:^(BOOL finished){
        if(!finished){return;}
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            sender.layer.transform = CATransform3DMakeScale(1.1, 1.1, 1.1);
        } completion:^(BOOL finished){
            if(!finished){return;}
            [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                sender.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8);
            } completion:^(BOOL finished){
                if(!finished){return;}
                [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    sender.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7);
                } completion:^(BOOL finished){
                    if(!finished){return;}
                    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                        sender.layer.transform = CATransform3DMakeScale(0.75, 0.75, 0.75);
                    } completion:^(BOOL finished){
                        if(!finished){return;}
                        [UIView animateWithDuration:0.08 animations:^{
                            sender.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7);
                        } completion:^(BOOL finished){
                            if(!finished){return;}
                        }];
                    }];
                }];
            }];
        }];
    }];
}

-(void)upInside:(UIButton*)sender event:(UIEvent*)event{
    [self upOutside:sender event:event];
}

-(void)upOutside:(UIButton*)sender event:(UIEvent*)event{
    
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [UIView setAnimationBeginsFromCurrentState:NO];
        sender.layer.transform = CATransform3DMakeScale(1, 1, 1);
    } completion:^(BOOL finished){
    }];
    
    
    UITouch *theTouch = [[[event allTouches]allObjects]objectAtIndex:0];
    
    for(UIButton *b in self.unitButtons){

        if([b pointInside:[theTouch locationInView:b] withEvent:event] == YES && b != self.currentButton && ![b.titleLabel.text isEqualToString:@"x"]){

            int x = 0;
            int y = 0;
            for (int i = 0; i < self.titles.count; i++){
                if(self.unitButtons[i] == b){
                    x = i;
                }
                
                if(self.unitButtons[i] == self.currentButton) {
                    y = i;
                }
            }
            ConversionViewController *conversion = [self.storyboard instantiateViewControllerWithIdentifier:@"conversionController"];
            conversion.units = @[self.labels[y], self.labels[x]];
            conversion.shortNames = @[self.currentButton.titleLabel.text, b.titleLabel.text];
            conversion.quantity = self.theTitle;
            [self.navigationController pushViewController:conversion animated:YES];
        }
    }
    
    for(UIButton *b in self.unitButtons){
        [b setHighlighted:NO];
    }
    
    swipeRight.enabled = YES;
    self.currentButton = nil;
    
    
}

-(void)dragMoving:(UIButton*)sender event:(UIEvent*)event{
    [self touchesMoved:nil withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *theTouch = [[[event allTouches]allObjects]objectAtIndex:0];
    
    if(self.selectedButton == nil){
        for(UIButton *b in self.unitButtons){
            if([b pointInside:[theTouch locationInView:b] withEvent:event] == YES && self.currentButton != nil && !([b isEqual:self.currentButton]) && ![b.titleLabel.text isEqualToString:@"x"]){
                self.selectedButton = b;
                
                [self.selectedButton setHighlighted:YES];
                
                [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    ((UIButton*)b).layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2);
                } completion:^(BOOL finished){
                    [UIView animateWithDuration:0.2 animations:^{
                        
                        b.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
                    } completion:^(BOOL finished){
                    }];
                }];
            }
        }
    }
    else{
        if([self.selectedButton pointInside:[theTouch locationInView:self.selectedButton] withEvent:event] == NO){
            [self.selectedButton setHighlighted:NO];
            
            [UIView animateWithDuration:0.04 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.selectedButton = nil;
                
            } completion:^(BOOL finished){
            }];
        }
    }
    
    swipeRight.enabled = YES;

    
    
}

-(void)dragOutside:(UIButton*)sender event:(UIEvent*)event{
    [sender setHighlighted:YES];
    swipeRight.enabled = NO;
    
}


-(void)bannerViewDidLoadAd:(ADBannerView*)banner{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
}

-(void)bannerView:(ADBannerView*)banner didFailToReceiveAdWithError:(NSError *)error{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}
- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
