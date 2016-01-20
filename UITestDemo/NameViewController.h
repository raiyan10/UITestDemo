//
//  NameViewController.h
//  UITestDemo
//
//  Created by Masudur Rahman on 1/15/16.
//  Copyright © 2016 BS-23. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) NSString *name;

@end
