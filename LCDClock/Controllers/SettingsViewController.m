//
//  SettingsViewController.m
//  LCDClock
//
//  Created by Eduard Lev on 2/23/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController ()

@property (nonatomic) NSString *timeZoneSelected;
@property (nonatomic) NSArray *timeZoneNames;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  [self updateUI];
  [self createTimeZoneArray];  // set the time zones for the wheel
  
}

- (void)updateUI {
  // Adjusts the corner radius of the background view on the color buttons
  self.colorView.layer.cornerRadius = 15;
}

- (void)viewWillAppear:(BOOL)animated {
  for (UIButton *color in self.colorButtons) {
    color.alpha = 1;
    if (![color.backgroundColor isEqual:self.clockLettersColor]) {
      color.alpha = 0.3;
    }
  }
  
  NSInteger row = [[NSUserDefaults standardUserDefaults] integerForKey:@"Time Zone"];
  [_timeZonePicker selectRow:row inComponent:0 animated:YES];
  self.timeZoneSelected = [self.timeZoneNames objectAtIndex:row];
  
  BOOL hour = [[NSUserDefaults standardUserDefaults] boolForKey:@"24 Switch"];
  [_twentyFourHourSwitch setOn:hour];
  
  int index = 1;
  for (UIButton *color in self.colorButtons) {
    if (index == [[NSUserDefaults standardUserDefaults] integerForKey:@"Color"]) {
      color.alpha = 1;
      [[NSUserDefaults standardUserDefaults] setColor:color.backgroundColor forKey:@"ColorObj"];
      [[NSUserDefaults standardUserDefaults] synchronize];
    }
    index++;
  }
}

- (void)createTimeZoneArray {
  self.timeZonePicker.dataSource = self;
  self.timeZonePicker.delegate = self;
  
  // May want to update implementation of how we set the time zone array in the future.
  // Right now just using all the available time zones in NSTimeZone
  self.timeZoneNames = [NSTimeZone knownTimeZoneNames];
}

- (IBAction)colorButtonDidTouch:(UIButton *)sender {
  // first lower opacity of all buttons
  for (UIButton *color in self.colorButtons) {
    color.alpha = 0.3;
    if ([sender.backgroundColor isEqual:color.backgroundColor]) {
      color.alpha = 1;
      [[NSUserDefaults standardUserDefaults] setColor:color.backgroundColor forKey:@"Color"];
      [[NSUserDefaults standardUserDefaults] synchronize];
    }
  }
  
  // finally set the 'clockLettersColor' property to this color
  self.clockLettersColor = sender.backgroundColor;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  ClockViewController *next = [segue destinationViewController];
  next.clockLettersColor = self.clockLettersColor;
  next.twentyFourHour = self.twentyFourHourSwitch.isOn;
  next.timeZoneSelected = self.timeZoneSelected;
  NSLog(@"time zone selected in settings is %@", self.timeZoneSelected);
  
  [[NSUserDefaults standardUserDefaults] setBool:self.twentyFourHourSwitch.isOn forKey:@"24 Switch"];
  [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// sets the number of wheels in the time zone picker
// since we are only choosing the time zone, there should only be one wheel
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
  return 1;
}

// sets the number of sides on the wheel of the time zone picker
// should be equal to the number of time zones you can change to
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.timeZoneNames.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  self.timeZoneSelected = self.timeZoneNames[row];
  NSLog(@"your selected time zone was %@", self.timeZoneSelected);
  
  [[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"Time Zone"];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

// creates a white string with the strings in the timeZoneNames array
// then returns colored string
- (NSAttributedString*)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
  NSAttributedString *coloredString = [[NSAttributedString alloc] initWithString:self.timeZoneNames[row] attributes:@{NSForegroundColorAttributeName:UIColor.whiteColor}];
  return coloredString;
}





@end
