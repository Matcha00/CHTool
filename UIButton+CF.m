//
//  UIButton+CF.m
//  RuntimeTset
//
//  Created by feirui on 2018/6/6.
//  Copyright © 2018年 Matcha00. All rights reserved.
//

#import "UIButton+CF.h"
#import <objc/runtime.h>
@implementation UIButton (CF)




+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSEL = @selector(sendAction:to:forEvent:);
        
        SEL newSEL = @selector(mySendAction:to:forEvent:);
        
        
        Method originaMethod = class_getInstanceMethod(self, originalSEL);
        
        Method newMethod= class_getInstanceMethod(self, newSEL);
        
        BOOL isAdd = class_addMethod(self, originalSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        
        if (isAdd) {
            class_replaceMethod(self, newSEL, method_getImplementation(originaMethod), method_getTypeEncoding(originaMethod));
        } else {
            method_exchangeImplementations(originaMethod, newMethod);
        }
        
        
        
    });
}


- (BOOL)isTouchInside
{
    return YES;
}

- (NSTimeInterval)timeInterval
{
    return [objc_getAssociatedObject(self, _cmd)doubleValue];
}
//OBJC_ASSOCIATION_RETAIN_NONATOMIC
- (void)setTimeInterval:(NSTimeInterval)timeInterval
{
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent
{
    return [objc_getAssociatedObject(self, _cmd)boolValue];
}

- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent
{
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event

{
    
    if([self isKindOfClass:[UIButton class]]) {
        
        self.timeInterval=self.timeInterval==0?0.5:self.timeInterval;
        
        if(self.isIgnoreEvent){
            
            return;
            
        }else if(self.timeInterval>0){
            
            [self performSelector:@selector(resetState)withObject:nil afterDelay:self.timeInterval];
            
        }
        
    }
    
    //此处methodA和methodB方法IMP互换了，实际上执行sendAction；所以不会死循环
    self.isIgnoreEvent=YES;
    
    [self mySendAction:action to:target forEvent:event];
    
}

- (void)resetState{
    
    [self setIsIgnoreEvent:NO];
    
}


@end
