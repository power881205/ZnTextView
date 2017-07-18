//
//  ViewController.h
//  TextViewSample
//
//  Created by znfod on 2017. 7. 18..
//  Copyright © 2017년 Znf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZnfTextView.h"

@interface ViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet ZnfTextView *textView1;

@property (weak, nonatomic) IBOutlet ZnfTextView *textView2;

@end

