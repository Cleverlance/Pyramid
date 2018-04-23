//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

#import "UIViewController+PresenterSupport.h"
#import <Pyramid/Pyramid-Swift.h>
#import <objc/runtime.h>

@implementation UIViewController (PresenterSupport)

#pragma mark - Swizzling

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleOriginalSelector:@selector(viewWillAppear:)
                     swizzledSelector:@selector(customViewWillAppear:)
                              onClass:[self class]];

        [self swizzleOriginalSelector:@selector(viewDidDisappear:)
                     swizzledSelector:@selector(customViewDidDisappear:)
                              onClass:[self class]];
    });
}


+ (void)swizzleOriginalSelector:(SEL)originalSelector
               swizzledSelector:(SEL)swizzledSelector
                        onClass:(Class)class
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
