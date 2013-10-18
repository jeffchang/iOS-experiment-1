//
//  JCZViewController.m
//  MobileCity2
//
//  Created by Jeff Chang on 10/18/13.
//  Copyright (c) 2013 JC. All rights reserved.
//

#import "JCZViewController.h"

@interface JCZViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextView *viewField;
@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation JCZViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self addItem:self.inputField.text];
    [self displayItems];
    [self clearTextField];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.inputField becomeFirstResponder];
    self.items = [[NSMutableArray alloc] initWithCapacity:5];
}

- (void)clearTextField {
    self.inputField.text = @"";
}

- (void)addItem:(NSString *)item {
    [self.items addObject:item];
}

- (void)displayItems {

    NSMutableString *itemList = [[NSMutableString alloc]initWithCapacity:200];
    [self.items enumerateObjectsUsingBlock:^(NSString *item, NSUInteger index, BOOL *stop) {
        [itemList appendFormat:@"(%d) %@ \n", index + 1, item];
    }];
    self.viewField.text = itemList;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
