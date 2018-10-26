//
//  WWCountDownView.h
//  WanWu
//
//  Created by 陈欢 on 2018/10/25.
//  Copyright © 2018年 baozi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TimerStopBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface WWCountDownView : UIView

@property (nonatomic,copy)TimerStopBlock timerStopBlock;

- (void)setCountDownTime:(NSInteger)startime endtime:(NSInteger)endtime;
@end

NS_ASSUME_NONNULL_END
