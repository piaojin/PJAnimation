//
//  PJPopInteractiveTransition.h
//  PJAnimation
//
//  Created by piaojin on 2017/10/16.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TransitionType) {
    TransitionTypePresent,
    TransitionTypeDismiss
};

@interface PJPresentInteractiveTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(TransitionType)transitionType;

- (instancetype)initWithTransitionType:(TransitionType)transitionType;

@end
