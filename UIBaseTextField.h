//
//  UIBaseTextField.h
//  UIFormView
//
//  Created by Marc Giroux on 2016-04-21.
//  Copyright © 2016 Marc Giroux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBaseTextField : UITextField <UITextFieldDelegate>

/** Set the field to readonly */
@property (nonatomic) BOOL isReadOnly;

/** The name of the field that can be used later */
@property (nonatomic, readonly) NSString *name;

- (instancetype)initWithFrame:(CGRect)frame usingName:(NSString *)itemName;

/** Init with placeholder */
- (instancetype)initWithFrame:(CGRect)frame usingName:(NSString *)itemName placeholder:(NSString *)placeholder;

/** Get the regular height value of a textfield */
+ (CGFloat)regularHeight;

@end
