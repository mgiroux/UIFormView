# UIFormView
A View that collects input fields and manages the keyboard (kinda like a web form does)

current version : __Alpha (0.1)__

---

##Install
```objective-c
UIBaseTextField *field1 = [[UIBaseTextField alloc] initWithFrame:CGRectMake(20, 50, 150, 25) usingName:@"name" placeholder:@"Name"];
formView                = [[UIFormView alloc] initWithElements:@[field1] withFrame:self.view.bounds withKeyboardStyle:UIKeyboardAppearanceDark];
            
[self.view addSubview:formView];
```

For now you can only add UIBaseTextField elements (They are subclasses of UITextField).

##Features

- Manage keyboard dissmissal
- Manage keyboard style
- Easily add custom buttons to keyboard
- Easily set type of keyboard to use with each field
- Add input fields (textfield, switch, etc.) (Only UIBaseTextField for now)
- Easily get all values
- Get value of specific field by it's name
- Apply validation for each fields in form (TODO)