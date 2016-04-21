//
//  UIFormView.m
//  UIFormView
//
//  Created by Marc Giroux on 2016-04-21.
//  Copyright © 2016 Marc Giroux. All rights reserved.
//

#import "UIFormView.h"

@implementation UIFormView
@synthesize toolbarButtonItems, showToolbar;

- (instancetype)initWithElements:(NSArray *)formElements withFrame:(CGRect)rect withKeyboardStyle:(UIKeyboardAppearance)appearance
{
    self = [super initWithFrame:rect];
    
    tItems      = formElements.mutableCopy;
    toolbar      = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    currentIndex = 0;
    
    if (appearance == UIKeyboardAppearanceDark) {
        toolbar.barStyle = UIBarStyleBlack;
    } else {
        toolbar.barStyle = UIBarStyleDefault;
    }
    
    prev = [[UIBarButtonItem alloc] initWithTitle:@"Previous" style:UIBarButtonItemStylePlain target:self action:@selector(previousTextField)];
    next = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextTextField)];
    
    if (appearance == UIKeyboardAppearanceDark) {
        [prev setTintColor:[UIColor whiteColor]];
        [next setTintColor:[UIColor whiteColor]];
    }
    
    if (formElements.count > 1) {
        [toolbar setItems:@[prev, next]];
    }
    
    for (int i = 0; i < formElements.count; i++) {
        if ([formElements[i] isKindOfClass:[UITextField class]]) {
            UITextField *tf       = (UITextField *)formElements[i];
            
            if (formElements.count > 1) {
                tf.inputAccessoryView = toolbar;
            }
            
            if (appearance == UIKeyboardAppearanceDark) {
                tf.keyboardAppearance = UIKeyboardAppearanceDark;
            } else {
                tf.keyboardAppearance = UIKeyboardAppearanceLight;
            }
        }
        
        [self addSubview:formElements[i]];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignKeyboard)];
    
    [self addGestureRecognizer: tap];
    [self setUserInteractionEnabled:YES];
    
    return self;
}

- (void)addToolbarItem:(UIBarButtonItem *)item
{
    if (toolbar.barStyle == UIBarStyleBlack) {
        [item setTintColor:[UIColor whiteColor]];
    }
    
    [tItems addObject:item];
    
    if (tItems.count > 1) {
        [toolbar setItems:tItems];
        
        for (int i = 0; i < tItems.count; i++) {
            if ([tItems[i] isKindOfClass:[UITextField class]]) {
                UITextField *tf       = (UITextField *)tItems[i];
                tf.inputAccessoryView = toolbar;
            }
        }
    }
}

- (void)addToolbarItems:(NSArray *)items
{
    for (int i = 0; i < items.count; i++) {
        if (toolbar.barStyle == UIBarStyleBlack) {
            [items[i] setTintColor:[UIColor whiteColor]];
        }
        
        [tItems addObject:items[i]];
    }
    
    if (tItems.count > 1) {
        [toolbar setItems:tItems];
        
        for (int i = 0; i < tItems.count; i++) {
            if ([tItems[i] isKindOfClass:[UITextField class]]) {
                UITextField *tf       = (UITextField *)tItems[i];
                tf.inputAccessoryView = toolbar;
            }
        }
    }
}

- (UIBaseTextField *)getBaseTextFieldByName:(NSString *)aName
{
    for (int i = 0; i < tItems.count; i++) {
        if ([tItems[i] isKindOfClass:[UIBaseTextField class]]) {
            UIBaseTextField *tf = (UIBaseTextField *)tItems[i];
            
            if ([tf.name isEqualToString:aName]) {
                return tf;
            }
        }
    }
    
    return nil;
}

- (NSDictionary *)getFormValues
{
    NSMutableDictionary *dict = @{}.mutableCopy;
    
    for (int i = 0; i < tItems.count; i++) {
        UIBaseTextField *tf = (UIBaseTextField *)tItems[i];
        dict[tf.name]       = tf.text;
    }
    
    return dict;
}

#pragma mark - Toolbar Buttons

- (void)previousTextField
{
    if (currentIndex > 0) {
        currentIndex--;
    }
}

- (void)nextTextField
{
    if (currentIndex + 1 <= tItems.count) {
        currentIndex++;
    }
}

- (void)resignKeyboard
{
    [self endEditing:YES];
}


@end
