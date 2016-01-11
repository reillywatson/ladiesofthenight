//
//  ViewController.h
//  LadiesOfTheNight
//
//  Created by Reilly Watson on 2016-01-10.
//  Copyright © 2016 Reilly Watson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromNowLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UISwitch *alarmToggle;
@property NSDate *date;
@end

