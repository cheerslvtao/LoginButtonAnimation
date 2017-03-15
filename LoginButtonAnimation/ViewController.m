//
//  ViewController.m
//  LoginButtonAnimation
//
//  Created by SFC-a on 2017/3/10.
//  Copyright © 2017年 SFC-a. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnimationLoginButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomAnimationLoginButton * custombuttom = [[CustomAnimationLoginButton alloc]initWithFrame:CGRectMake(10, 200, CGRectGetWidth(self.view.bounds)-20, 40) title:@"登录" bgColor:[UIColor blueColor]];
    [custombuttom addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:custombuttom];
}

-(void)buttonClick:(CustomAnimationLoginButton *)button {
    
    button.selected = !button.selected;
    button.selected ? [button startlogin] : [button endlogin];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
