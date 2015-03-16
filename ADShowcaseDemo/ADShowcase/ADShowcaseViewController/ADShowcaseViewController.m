//
//  ADShowcaseViewController.m
//  ADShowcase
//
//  Created by Aditya Deshmane on 17/03/15.
//  Copyright (c) 2015 Aditya Deshmane. All rights reserved.
//

#define DEFAULT_COLOR_THEME [UIColor redColor]
#define DEFAULT_TITLE @"Info"
#define DEFAULT_MESSAGE @"New Feature"
#define DEFAULT_REMOVE_BUTTON_TITLE @"OK"
#define DEFAULT_HIGHLIGHT_POINT CGPointMake(-200,-200)
#define DEFAULT_HIGHLIGHT_CIRCLE_RADIUS 50.0

#import "ADShowcaseViewController.h"


@interface ADShowcaseViewController()

//Outlets
@property (weak, nonatomic) IBOutlet UIView *viewForAddingGraphicImage;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelMessage;
@property (weak, nonatomic) IBOutlet UIButton *buttonRemoveView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintMessageViewTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintMessageViewBottomSpace;

//Actions
- (IBAction)buttonRemoveViewPressed:(id)sender;

//Private Methods
-(void)validateData;
-(void)setupUI;

@end


@implementation ADShowcaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self validateData];
    [self setupUI];
}


-(void)validateData
{
    if(!_colorTheme)
        _colorTheme = DEFAULT_COLOR_THEME;
    
    if(!_strTitle)
        _strTitle = DEFAULT_TITLE;
    
    if(!_strMessage)
        _strMessage = DEFAULT_MESSAGE;
    
    if(!_strRemoveViewButtonTitle)
        _strRemoveViewButtonTitle = DEFAULT_REMOVE_BUTTON_TITLE;
    
    if(CGPointEqualToPoint(_pointToHightlight, CGPointZero))
        _pointToHightlight = DEFAULT_HIGHLIGHT_POINT;
    
    if(_fHighlightCircleRadius <= 0)
        _fHighlightCircleRadius = DEFAULT_HIGHLIGHT_CIRCLE_RADIUS;
}


-(void)setupUI
{
    // Text setup
    _labelTitle.text = _strTitle;
    _labelMessage.text = _strMessage;
    [_buttonRemoveView setTitle:_strRemoveViewButtonTitle forState:UIControlStateNormal];
    
    // Set theme colors
    _labelMessage.textColor = _colorTheme;
    _buttonRemoveView.backgroundColor = _colorTheme;
    
    // Set View Frame
    self.view.frame = [[UIScreen mainScreen] bounds];
    
    // Black Background
    UIColor *backgroundColor = [UIColor blackColor];
    UIGraphicsBeginImageContextWithOptions([[UIScreen mainScreen] bounds].size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [backgroundColor CGColor]);
    CGContextFillRect(context, [[UIScreen mainScreen] bounds]);
    
    // Draw Highlight ( area outside circle )
    CGPoint center = _pointToHightlight;
    
    CGContextSetLineWidth(context, 2.54f);
    CGContextSetShadowWithColor(context, CGSizeZero, 30.0f, _colorTheme.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextSetStrokeColorWithColor(context, _colorTheme.CGColor);
    CGContextAddArc(context, center.x, center.y, _fHighlightCircleRadius * 2.0f, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextAddArc(context, center.x, center.y, _fHighlightCircleRadius, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // Clear Circle
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextAddArc(context, center.x, center.y, _fHighlightCircleRadius - 0.54, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    UIImageView *graphicallyCreatedImageView = [[UIImageView alloc] initWithImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    [graphicallyCreatedImageView setAlpha:0.8f];
    
    // Add graphical imageview to background view
    [_viewForAddingGraphicImage addSubview:graphicallyCreatedImageView];
    
    // Adjust message view position
    float distanceBetweenInsideAndOutsideCircle = 70;
    
    if(_pointToHightlight.y < [[UIScreen mainScreen] bounds].size.height / 2)
        _constraintMessageViewTopSpace.constant  = _pointToHightlight.y + _fHighlightCircleRadius + distanceBetweenInsideAndOutsideCircle;
    else
        _constraintMessageViewBottomSpace.constant  = [[UIScreen mainScreen] bounds].size.height - (_pointToHightlight.y - _fHighlightCircleRadius - distanceBetweenInsideAndOutsideCircle);
}


- (IBAction)buttonRemoveViewPressed:(id)sender
{
    [self.view removeFromSuperview];
}

@end
