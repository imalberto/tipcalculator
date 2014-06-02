//
//  TipViewController.m
//  tipcalculator
//
//  Created by albertoc on 6/1/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (strong, nonatomic) IBOutlet UITextField *billTextField;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tipSegmentedControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"Tip Calculater";
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
  [self.billTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
  [self.view endEditing:YES];
  [self updateValues];
}

- (void)updateValues {
  float billAmount = [self.billTextField.text floatValue];
  NSArray *tipValues = @[@(0.10), @(0.15), @(0.20)];
  
  float tipAmount = [tipValues[self.tipSegmentedControl.
                               selectedSegmentIndex] floatValue] * billAmount;
  float totalAmount = billAmount + tipAmount;
  
  self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
  self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
