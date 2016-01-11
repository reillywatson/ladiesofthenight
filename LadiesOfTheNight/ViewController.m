//
//  ViewController.m
//  LadiesOfTheNight
//
//  Created by Reilly Watson on 2016-01-10.
//  Copyright © 2016 Reilly Watson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateWithValue:self.slider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)sliderChanged:(id)sender {
    [self updateWithValue:self.slider.value];
}
- (IBAction)stepperChanged:(id)sender {
    [self updateWithValue:self.stepper.value];
}

-(void)updateWithValue:(int)value {
    self.stepper.value = value;
    self.slider.value = value;
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)value * 60];
    self.timeLabel.text = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
    self.fromNowLabel.text = [NSString stringWithFormat:@"In %d hr %d min", value / 60, value % 60];
    self.date = date;
}
- (IBAction)alarmToggled:(id)sender {
    if (self.alarmToggle.on) {
        [self addLocalNotificationWithDate:self.date];
    }
}

-(void)addLocalNotificationWithDate:(NSDate*)date {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = date;
    noti.timeZone = [NSTimeZone localTimeZone];
    noti.alertBody = @"Wake up!";
    //noti.soundName = [NSString stringWithFormat:@"%@.caf", ma.soundName];
    noti.alertAction = @"OK";
    /*noti.userInfo = [[[NSDictionary alloc] initWithObjectsAndKeys:
                      ma.mid, @"mid",
                      [NSString stringWithFormat:@"%d", mweekday], @"day",
                      ma.soundName, @"sound",
                      [NSString stringWithFormat:@"%d", ma.snooze], @"snooze",
                      ma.title, @"title",
                      @"Close", @"action",
                      @"real", @"more",
                      nil] autorelease];
    */
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
}

@end
