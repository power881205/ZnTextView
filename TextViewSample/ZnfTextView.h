//
//  ZnfTextView.h
//  ZnfTextView
//
//  Created by bnp16 on 2017. 6. 30..
//  Copyright © 2017년 bnp16. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZnfTextView : UITextView

@property (nonatomic, strong) UILabel *placeHolderLabel;

@property (strong, nonatomic) UIToolbar *toolbar;


@property (strong, nonatomic) NSArray *barItemArray;
@property (assign, nonatomic) int barStyle;

@property (strong, nonatomic) NSString *leftBtnString;
@property (strong, nonatomic) NSString *rightBtnString;

- (void)initToolbar;

- (void)setBarStyle:(int)barStyle;
- (void)setBarItem:(NSArray *)barItemsArray;


@end
