//
//  Test.m
//  MessageSend
//
//  Created by PlatoJobs  on 2020/3/28.
//  Copyright © 2020 PlatoJobs . All rights reserved.
//

#import "Test.h"
#import <objc/runtime.h>
#import "Test2.h"
@implementation Test


void instanceMethodAdd(id self,SEL  _cmd){
    
    NSLog(@"补加的方法实现");
}

//1.追加方法
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//
//    if (sel==@selector(instanceMethod)) {
//
//        class_addMethod(self, sel, (IMP)(instanceMethodAdd), "V@:");
//        return YES;
//
//
//    }
//
//    return [super resolveInstanceMethod:sel];
//}

// 2.转发另一对象处理
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//
//    if (aSelector==@selector(instanceMethod)) {
//        return [Test2 new];
//    }
//    return nil;
//}

//3.生成方法签名，转发给另一对象
-(NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{
    
    NSString*selName=NSStringFromSelector(aSelector);
    
    if ([selName isEqualToString:@"instanceMethod"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
    
}

//  转发给另一对象
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    
    SEL sel=[anInvocation selector];
    
    Test2*test2=[Test2 new];
    if ([test2 respondsToSelector:sel]) {
        
        [anInvocation invokeWithTarget:test2];
    }
    
    
}


@end
