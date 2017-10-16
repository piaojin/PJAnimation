//
//  PJInteractiveTransition.h
//  PJAnimation
//
//  Created by piaojin on 2017/10/16.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)(void);

typedef NS_ENUM(NSUInteger, PJInteractiveTransitionGestureDirection) {//手势的方向
    PJInteractiveTransitionGestureDirectionLeft = 0,
    PJInteractiveTransitionGestureDirectionRight,
    PJInteractiveTransitionGestureDirectionUp,
    PJInteractiveTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, PJInteractiveTransitionType) {//手势控制哪种转场
    PJInteractiveTransitionTypePresent = 0,
    PJInteractiveTransitionTypeDismiss,
    PJInteractiveTransitionTypePush,
    PJInteractiveTransitionTypePop,
};

@interface PJInteractiveTransition : UIPercentDrivenInteractiveTransition
/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;

//初始化方法

+ (instancetype)interactiveTransitionWithTransitionType:(PJInteractiveTransitionType)type GestureDirection:(PJInteractiveTransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(PJInteractiveTransitionType)type GestureDirection:(PJInteractiveTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;
@end

