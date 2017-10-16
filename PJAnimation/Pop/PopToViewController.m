//
//  PopToViewController.m
//  PJAnimation
//
//  Created by piaojin on 2017/10/16.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import "PopToViewController.h"
#import "UIView+FrameChange.h"
#import "PJInteractiveTransition.h"
#import "PJPresentInteractiveTransition.h"

@interface PopToViewController ()

@property (nonatomic, strong) PJInteractiveTransition *interactiveDismiss;

@end

@implementation PopToViewController

- (void)dismiss{
    if (_delegate && [_delegate respondsToSelector:@selector(presentedOneControllerPressedDissmiss)]) {
        [_delegate presentedOneControllerPressedDissmiss];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

- (void)initData {
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.interactiveDismiss = [PJInteractiveTransition interactiveTransitionWithTransitionType:PJInteractiveTransitionTypeDismiss GestureDirection:PJInteractiveTransitionGestureDirectionDown];
    [self.interactiveDismiss addPanGestureForViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - 动画代理

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [PJPresentInteractiveTransition transitionWithTransitionType:TransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [PJPresentInteractiveTransition transitionWithTransitionType:TransitionTypeDismiss];
}

/** 如果没有配合手势下面两个方法可以不用实现*/
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    //如果在执行手势才允许执行
    return _interactiveDismiss.interation ? _interactiveDismiss : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    //如果Presenting控制器在执行手势才允许执行
    PJInteractiveTransition *interactivePresent = [_delegate interactiveTransitionForPresent];
    return interactivePresent.interation ? interactivePresent : nil;
}

@end
