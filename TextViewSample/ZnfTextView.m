//
//  ZnfTextView.m
//  ZnfTextView
//
//  Created by bnp16 on 2017. 6. 30..
//  Copyright © 2017년 bnp16. All rights reserved.
//

#import "ZnfTextView.h"

@implementation ZnfTextView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addPlaceHolderLabel];
        [self setupView];
        [self initToolbar];
        self.delegate = self;
    }
    return self;
}

- (void)addPlaceHolderLabel {
    self.placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5.0, CGRectGetWidth(self.frame)-20.0, 20.0)];
    self.placeHolderLabel.text = @"Add comment here";
    self.placeHolderLabel.textColor = [UIColor lightGrayColor];
    self.placeHolderLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
    self.placeHolderLabel.textAlignment = NSTextAlignmentLeft;
    self.placeHolderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.placeHolderLabel];
    
    // setup constraints
    // left constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeHolderLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0 constant:10.0]];
    // right constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeHolderLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeRight
                                                    multiplier:1.0 constant:10.0]];
    // top constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeHolderLabel
                                                     attribute:NSLayoutAttributeTopMargin
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeTopMargin
                                                    multiplier:1.0 constant:5.0]];
    // height constraint
    [self.placeHolderLabel addConstraint:[NSLayoutConstraint constraintWithItem:self.placeHolderLabel
                                                                      attribute:NSLayoutAttributeHeight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1.0 constant:20.0]];
}

- (void)setupView {
    self.tintColor = [UIColor lightGrayColor];
    self.textColor = [UIColor blackColor];
}

- (void)setPlaceHolderLabelVisible:(BOOL)visible {
    // if the placeholder needs to be displayed, but it is already visible
    // OR the label is hidden, and needs to be hidden, just ignore this method
    if ((visible == [self isPlaceHolderLabelVisible]) || self.text.length > 0) {
        return;
    }
    
    // animate the label upwards
    [self animatePlaceHolderLabelUpwards:visible];
    
    // animate the alpha value of the label
    //    [UIView animateWithDuration:0.3 animations:^{
    //        self.placeHolderLabel.alpha = visible ? 1.0 : 0.0;
    //    }];
}

- (BOOL)isPlaceHolderLabelVisible {
    return self.placeHolderLabel.alpha == 1;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    if (self.text.length > 0) {
        self.placeHolderLabel.alpha = 0.0;
    } else {
        self.placeHolderLabel.alpha = 1.0;
    }
}

- (void)animatePlaceHolderLabelUpwards:(BOOL)visible {
    [UIView animateWithDuration:0.3 animations:^{
        if (visible) {
            self.placeHolderLabel.alpha = 1.0;
            self.placeHolderLabel.transform = CGAffineTransformIdentity;
        } else {
            self.placeHolderLabel.alpha = 0.0;
            self.placeHolderLabel.transform = CGAffineTransformMakeTranslation(0.0, -10.0);
        }
    }];
}

- (void)initToolbar {
    
    if(self.rightBtnString == nil){
        self.rightBtnString = NSLocalizedString(@"확인", nil);
    }
    self.rightBtnString = self.rightBtnString;
    
    self.toolbar = [[UIToolbar alloc]init];
    self.toolbar.frame = CGRectMake(0, 0, 320, 50);
    self.toolbar.barStyle = self.barStyle;
    if(self.barItemArray == nil) {
        self.barItemArray = [NSArray arrayWithObjects:
                             [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                             [[UIBarButtonItem alloc]initWithTitle:self.rightBtnString style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard)],
                             nil];
    }
    self.toolbar.items = self.barItemArray;
    
    [self.toolbar sizeToFit];
    self.inputAccessoryView = self.toolbar;
}

- (void)setBarStyle:(int)barStyle {
    switch (barStyle) {
        case UIBarStyleDefault:
            self.barStyle = UIBarStyleDefault;
            break;
        case UIBarStyleBlack:
            self.barStyle = UIBarStyleBlack;
            break;
        case UIBarStyleBlackTranslucent:
            self.barStyle = UIBarStyleBlackTranslucent;
            break;
        default:
            self.barStyle = UIBarStyleDefault;
            break;
    }
}

- (void)setBarItem:(NSArray *)barItemsArray {
    self.toolbar.items = barItemsArray;
}

- (void)dismissKeyboard {
    [self resignFirstResponder];//Assuming that UITextField Object is textField
}

- (void)textViewDidChange:(UITextView *)textView {
    
}

- (void)textViewDidBeginEditing:(ZnfTextView *)textView {
    self.placeHolderLabel.hidden = true;
}

- (void)textViewDidEndEditing:(ZnfTextView *)textView {
    if([textView.text isEqualToString:@""]) {
        self.placeHolderLabel.hidden = false;
    }
}



@end
