//
//  UITestDemoUITests.m
//  UITestDemoUITests
//
//  Created by Masudur Rahman on 1/15/16.
//  Copyright © 2016 BS-23. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UITestDemoUITests : XCTestCase
{
    //NSString *name;
}

@end

@implementation UITestDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSArray *nameArray = [[NSArray alloc] initWithObjects:@"Raiyan", @"Anik", @"", @"Saif", @"Hasib", @"", @"Sadman", @"Mubassher", @"Ovi", @"Faisal", nil];
    
    for (NSString *personName in nameArray)
    {
        [self performTestWithName:personName];
    }
}

- (void) performTestWithName:(NSString *)name
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *textField = [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"View"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField].element;
    
    [textField tap];

    NSString *stringValue = (NSString *)textField.value;
    
    NSString *deleteString = @"";
    for (int i = 0; i < stringValue.length; i++ )
    {
        deleteString = [NSString stringWithFormat:@"%@%@", deleteString, @"\b"];
    }
    [textField typeText:deleteString];
    
    [textField typeText:name];
    
    [app.buttons[@"Submit"] tap];
    
    XCUIElement *alert = app.alerts[@"Empty field"];
    if (alert.collectionViews.count == 1)
    {
        [app.alerts[@"Empty field"].collectionViews.buttons[@"OK"] tap];
    }
    else
    {
        [[[[app.navigationBars[@"NameView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    }
}

@end
