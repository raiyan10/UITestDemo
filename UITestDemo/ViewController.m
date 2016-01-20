//
//  ViewController.m
//  UITestDemo
//
//  Created by Masudur Rahman on 1/15/16.
//  Copyright © 2016 BS-23. All rights reserved.
//

#import "ViewController.h"
#import "NameViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)submitName:(id)sender
{
    [self.nameTextField resignFirstResponder];
    [self verifyEmptyTextField];
}

- (void) verifyEmptyTextField
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *nameText = [self.nameTextField.text stringByTrimmingCharactersInSet:set];
    
    if (nameText.length > 0)
    {
        [self proceedToNextPage];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Empty field" message:@"Enter your name" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void) proceedToNextPage
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NameViewController *nameViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NameViewController"];
    nameViewController.name = self.nameTextField.text;
    
    [self.navigationController pushViewController:nameViewController animated:YES];
}

@end
