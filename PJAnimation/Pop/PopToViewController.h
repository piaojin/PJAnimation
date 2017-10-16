//
//  PopToViewController.h
//  PJAnimation
//
//  Created by piaojin on 2017/10/16.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PJPresentedOneControllerDelegate <NSObject>

- (void)presentedOneControllerPressedDissmiss;
- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end

@interface PopToViewController : UIViewController<UIViewControllerTransitioningDelegate>

@property (nonatomic, weak) id<PJPresentedOneControllerDelegate> delegate;

@end
