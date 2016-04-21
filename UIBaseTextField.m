//
//  UIBaseTextField.m
//  UIFormView
//
//  Created by Marc Giroux on 2016-04-21.
//  Copyright © 2016 Marc Giroux. All rights reserved.
//

#import "UIBaseTextField.h"

@implementation UIBaseTextField
@synthesize isReadOnly, name;

- (instancetype)initWithFrame:(CGRect)frame usingName:(NSString *)itemName
{
    self       = [super initWithFrame:frame];
    isReadOnly = NO;
    name       = itemName;

    [self setupWithPlaceholder:@"" withReturnKey:UIReturnKeyDone];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame usingName:(NSString *)itemName placeholder:(NSString *)placeholder
{
    self       = [super initWithFrame:frame];
    isReadOnly = NO;
    name       = itemName;
    
    [self setupWithPlaceholder:placeholder withReturnKey:UIReturnKeyDone];
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return (isReadOnly) ? NO : YES;
}

+ (CGFloat)regularHeight
{
    return 25.0;
}

#pragma mark - Private methods

- (void)setupWithPlaceholder:(NSString *)string withReturnKey:(UIReturnKeyType)keyType;
{
    self.borderStyle              = UITextBorderStyleRoundedRect;
    self.font                     = [UIFont systemFontOfSize:15];
    self.placeholder              = string;
    self.autocorrectionType       = UITextAutocorrectionTypeNo;
    self.keyboardType             = UIKeyboardTypeDefault;
    self.returnKeyType            = keyType;
    self.clearButtonMode          = UITextFieldViewModeWhileEditing;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.delegate                 = self;
    [self setUserInteractionEnabled:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self resignFirstResponder];
    return NO;
}

@end
