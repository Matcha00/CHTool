//
//  UIButton+CF.h
//  RuntimeTset
//
//  Created by feirui on 2018/6/6.
//  Copyright © 2018年 Matcha00. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CF)
@property (nonatomic, assign) NSTimeInterval timeInterval; //重复点击间隔时间

@property (nonatomic, assign) BOOL isIgnoreEvent; //yes不允许no允许
@end
