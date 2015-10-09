//
//  ViewController.m
//  WSY_CoreText
//
//  Created by Wilson-Yuan on 15/7/15.
//  Copyright (c) 2015年 wilson-yuan. All rights reserved.
//

#import "ViewController.h"
#import "WSCoreText.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet WSCoreText *contenxtView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotate
{
    [self.contenxtView setNeedsDisplay];
    return YES;
}

@end
