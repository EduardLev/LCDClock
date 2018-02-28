//
//  ViewController.m
//  LCDClock
//
//  Created by Eduard Lev on 2/23/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController ()
  
@property (nonatomic) int count; // the count of swipes

@end

@implementation ClockViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.count = 1; // background images count
  
  NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
  
  self.timeZoneNames = [NSTimeZone knownTimeZoneNames];
  NSInteger row = [[NSUserDefaults standardUserDefaults] integerForKey:@"Time Zone"];
  self.timeZoneSelected = _timeZoneNames[row];
  self.background.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] objectForKey:@"Background"]];
  self.twentyFourHour = [[NSUserDefaults standardUserDefaults] boolForKey:@"24 Switch"];
  self.clockLettersColor = [[NSUserDefaults standardUserDefaults] colorForKey:@"Color"];
}

- (NSString*)lastTimeStringDate {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:self.timeZoneSelected]];
  [dateFormatter setDateFormat:@"EEEE MMMM dd"];
  return [dateFormatter stringFromDate:self.lastTime];
}

- (NSString*)lastTimeString {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  if (_twentyFourHour) {
      [dateFormatter setDateFormat:@"HH:mm:ss"];
    } else {
      [dateFormatter setDateFormat:@"hh:mm:ss a"];
    }
  NSLog(@"%@",self.timeZoneSelected);
  [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:self.timeZoneSelected]];
  return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer*)t {
  // start of old code
  NSDate *now = [[NSDate alloc] init];
  [self setLastTime:now];
  NSLog(@"%@", self.lastTimeString);

  NSString *numbers = [self.lastTimeString stringByReplacingOccurrencesOfString:@":" withString:@""];
  int hour1 = [numbers characterAtIndex:0] - 48;
  int hour2 = [numbers characterAtIndex:1] - 48;
  int min1 = [numbers characterAtIndex:2] - 48;
  int min2 = [numbers characterAtIndex:3] - 48;
  int sec1 = [numbers characterAtIndex:4] - 48;
  int sec2 = [numbers characterAtIndex:5] - 48;
  
  [self.hourDigitOne setNumber:hour1];
  [self.hourDigitTwo setNumber:hour2];
  [self.minuteDigitOne setNumber:min1];
  [self.minuteDigitTwo setNumber:min2];
  [self.secondDigitOne setNumber:sec1];
  [self.secondDigitTwo setNumber:sec2];
  self.timeLabel.text = [self lastTimeStringDate];
  
  if (_twentyFourHour) {
    self.AM.alpha = 0.3;
    self.PM.alpha = 0.3;
  } else {
    if ([numbers characterAtIndex:7] == 80) {
      self.PM.alpha = 1;
      self.AM.alpha = 0.3;
    } else {
      self.AM.alpha = 1;
      self.PM.alpha = 0.3;
    }
  }
  
}

- (void)viewDidAppear:(BOOL)animated {
}

// Swipe right to decrease count of image
- (IBAction)swipeGestureDidSwipeBack:(UISwipeGestureRecognizer *)sender {
  if (--self.count < 1) {
    self.count = 10;
  }
  NSString *imgString = [NSString stringWithFormat:@"img-clock-background-%d", self.count];
  self.background.image = [UIImage imageNamed:imgString];
  self.background.alpha = 0.3;
  
  [[NSUserDefaults standardUserDefaults] setObject:imgString forKey:@"Background"];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

// Swipe left to increase count of image
- (IBAction)swipeGestureDidSwipe:(UISwipeGestureRecognizer *)sender {
  if (++self.count > 10) {
    self.count = 1;
  }
  NSString *imgString = [NSString stringWithFormat:@"img-clock-background-%d", self.count];
  self.background.image = [UIImage imageNamed:imgString];
  
  [[NSUserDefaults standardUserDefaults] setObject:imgString forKey:@"Background"];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  
  // set fill colors of all the clock digits
  [self.hourDigitOne setFillColor: self.clockLettersColor];
  [self.hourDigitTwo setFillColor: self.clockLettersColor];
  [self.minuteDigitOne setFillColor: self.clockLettersColor];
  [self.minuteDigitTwo setFillColor: self.clockLettersColor];
  [self.secondDigitOne setFillColor: self.clockLettersColor];
  [self.secondDigitTwo setFillColor: self.clockLettersColor];
  self.upperDot.backgroundColor = self.clockLettersColor;
  self.lowerDot.backgroundColor = self.clockLettersColor;
  self.timeLabel.textColor = self.clockLettersColor;
  self.AM.textColor = self.clockLettersColor;
  self.PM.textColor = self.clockLettersColor;
}

- (IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC {
  
}

- (IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  SettingsViewController *next = segue.destinationViewController;
  next.clockLettersColor = self.clockLettersColor;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
