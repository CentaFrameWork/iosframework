//
//  ViewController.m
//  iOSFrameWork
//
//  Created by 李慧娟 on 17/2/17.
//  Copyright © 2017年 中原集团. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 150)/2, 100, 150,50)];
    textLabel.backgroundColor = [UIColor orangeColor];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
    textLabel.text = NSLocalizedString(@"皮皮虾，我们走", @"");


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
