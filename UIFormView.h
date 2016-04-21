//
//  UIFormView.h
//  UIFormView
//
//  Created by Marc Giroux on 2016-04-21.
//  Copyright © 2016 Marc Giroux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBaseTextField.h"

@interface UIFormView : UIView
{
    UIToolbar *toolbar;
    UIBarButtonItem *prev;
    UIBarButtonItem *next;
    
    NSMutableArray *tItems;
    
    int currentIndex;
}

/** List of elements in the form */
@property (nonatomic, weak) NSArray *elements;

/** List of buttons in the toolbar */
@property (nonatomic, weak, readonly) NSArray *toolbarButtonItems;

/** Show the toolbar */
@property (nonatomic) BOOL showToolbar;

/** Init with a list of elements to put in the form */
- (instancetype)initWithElements:(NSArray *)formElements withFrame:(CGRect)rect withKeyboardStyle:(UIKeyboardAppearance)appearance;

/** Add item to the toolbar on top of the keyboard */
- (void)addToolbarItem:(UIBarButtonItem *)item;

/** Add items to the toolbar on top of the keyboard */
- (void)addToolbarItems:(NSArray *)items;

/** Get a textfield by it's name */
- (UIBaseTextField *)getBaseTextFieldByName:(NSString *)aName;

/** Get all values */
- (NSDictionary *)getFormValues;

@end
