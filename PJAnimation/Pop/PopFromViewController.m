//
//  PopFromViewController.m
//  PJAnimation
//
//  Created by piaojin on 2017/10/16.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import "PopFromViewController.h"
#import "PopToViewController.h"
#import "PJInteractiveTransition.h"

@interface PopFromViewController ()<PJPresentedOneControllerDelegate>

@property (nonatomic, strong) PJInteractiveTransition *interactivePresent;

@end

@implementation PopFromViewController
- (IBAction)startAnimation:(id)sender {
    [self present];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

- (void)initData {
    _interactivePresent = [PJInteractiveTransition interactiveTransitionWithTransitionType:PJInteractiveTransitionTypePresent GestureDirection:PJInteractiveTransitionGestureDirectionUp];
    __weak typeof(self)weakSelf = self;
    _interactivePresent.presentConifg = ^(){
        [weakSelf present];
    };
    [_interactivePresent addPanGestureForViewController:self.navigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)present{
    PopToViewController *popToViewController = [[PopToViewController alloc] init];
    popToViewController.delegate = self;
    [self presentViewController:popToViewController animated:YES completion:nil];
}

- (void)presentedOneControllerPressedDissmiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent{
    return _interactivePresent;
}

@end
