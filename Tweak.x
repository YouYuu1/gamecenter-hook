#import <dlfcn.h>
#import <UIKit/UIKit.h>

@interface GKLocalPlayer : NSObject
- (void)cancelAuthentication;
@end

%hook GKLocalPlayer
- (void)setAuthStartTimeStamp:(double)timestamp {
    if ([self respondsToSelector:@selector(cancelAuthentication)]) {
        [self cancelAuthentication];
    }
    %orig(timestamp);
}
%end

%ctor {
    @autoreleasepool {
        // Wymuszenie załadowania GameKit wewnątrz środowiska IPA
        dlopen("/System/Library/Frameworks/GameKit.framework/GameKit", RTLD_NOW);
        %init;
    }
}
