//
//  ADShowcaseViewController.h
//  ADShowcase
//
//  Created by Aditya Deshmane on 17/03/15.
//  Copyright (c) 2015 Aditya Deshmane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADShowcaseViewController : UIViewController

//Customization parameters
@property (readwrite) UIColor *colorTheme;
@property (readwrite) NSString *strTitle;
@property (readwrite) NSString *strMessage;
@property (readwrite) NSString *strRemoveViewButtonTitle;
@property (readwrite) CGPoint pointToHightlight;
@property (readwrite) float fHighlightCircleRadius;

@end
