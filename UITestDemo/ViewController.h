//
//  ViewController.h
//  UITestDemo
//
//  Created by Masudur Rahman on 1/15/16.
//  Copyright © 2016 BS-23. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)submitName:(id)sender;

@end

