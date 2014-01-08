//
//  ViewController.m
//  AutoLayOut
//
//  Created by timkao on 14/1/3.
//  Copyright (c) 2014年 skl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize autoButton,AutoImage;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    /*
     AutoLayout
     
     傳統做法
     
     */
    
    //會跟autoresizing 衝突 所以先關閉
    [autoButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    
    //與superview的底部始終差距50個單位高度（不能小於）
    NSLayoutConstraint *myConstraint = Nil;
    myConstraint = [NSLayoutConstraint constraintWithItem:autoButton  attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:[autoButton superview] attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50.0f];
    
    [self.view addConstraint:myConstraint];
    
    //x軸對齊superview的x軸中心點
    myConstraint = [NSLayoutConstraint constraintWithItem:autoButton attribute:NSLayoutAttributeCenterX
                                                relatedBy:NSLayoutRelationEqual
                                                   toItem:[autoButton superview] attribute:NSLayoutAttributeCenterX
                                               multiplier:1.0f constant:-0.0f];
    [self.view addConstraint:myConstraint];
    
    
    //寬度限制
    myConstraint = [NSLayoutConstraint constraintWithItem:autoButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:Nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:210.0f];
    
    [self.view addConstraint:myConstraint];
    
    //高度限制
    myConstraint = [NSLayoutConstraint constraintWithItem:autoButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:Nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:20.f];
    
    [self.view addConstraint:myConstraint];
    
    
    
    
    
    /*
     [NSLayoutConstraint constraintsWithVisualFormat: options: metrics: views:]
     由於傳統的方式過於瑣碎，因此 NSLayoutConstraint 也提供另一種較為直覺的方式來設定這些限制
     */
    
    [AutoImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSMutableArray *myConstraints = [NSMutableArray array];
    
    //從水平方向佈局，由畫面左側開始，間距20個單位寬度，設定100單位寬度的AutoImage
    [myConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-270-[AutoImage(200)]"
                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(AutoImage)]];
    
    
    //從垂直方向佈局，設定
    [myConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-500-[AutoImage(200)]"
                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(AutoImage)]];
    
    [self.view addConstraints:myConstraints];
    
    /*
     
     所有限制分成從水平與垂直兩方面來看，它們可以分別設定物件的寬度與高度，以及他們在水平垂直面上的限制，下面是視覺化文字背後的語意。
     
     " V: " 和 " H: "
     分別代表由垂直或是水平方向來佈局。
     " | "
     代表 Superview 的邊界。
     " - "
     代表預設寬度或高度，如果在中間加上數字 " -20- "，則代表限制 20 個單位高度或寬度。
     " [ ] "
     代表物件本身，括號內包含物件的變數名稱與大小限制，可以使用關係運算子（<＝、>＝ 或 ＝＝ 等）。
     " @ "
     優先權，1 至 1000 的整數，優先權較大的條件會優先被滿足，例如 ，[ViewB(>=100@1000)]，物件 ViewB 不可以小於 100 個單位長度或寬度會最優先被考慮。
     
     - 以上來源為 See more at: http://furnacedigital.blogspot.tw/2013/10/auto-layout.html
     
     */
    
}

@end
