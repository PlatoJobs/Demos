//
//  ViewController.m
//  MessageSend
//
//  Created by PlatoJobs  on 2020/3/28.
//  Copyright © 2020 PlatoJobs . All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
    Test*tse=[Test new];
    [tse instanceMethod];
    
    // Do any additional setup after loading the view.
}


@end
