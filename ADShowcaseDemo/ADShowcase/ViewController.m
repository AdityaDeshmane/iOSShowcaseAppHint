//
//  ViewController.m
//  ADShowcase
//
//  Created by Aditya Deshmane on 16/03/15.
//  Copyright (c) 2015 Aditya Deshmane. All rights reserved.
//

#import "ViewController.h"
#import "ADShowcaseViewController.h"

@interface ViewController ()
{
    ADShowcaseViewController *_vcADShowcase;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _vcADShowcase = [ADShowcaseViewController new];
    _vcADShowcase.pointToHightlight = CGPointMake(150, 250);
    _vcADShowcase.strTitle = @"New!!!";
    _vcADShowcase.strMessage = @"Hey, check out this new cool feature..";
    _vcADShowcase.strRemoveViewButtonTitle = @"Got it";
    [self.view addSubview:_vcADShowcase.view];
}


@end
