#import <dlfcn.h>
#import <UIKit/UIKit.h>

@interface GKLocalPlayer : NSObject
- (void)cancelAuthentication;
@end

%hook GKLocalPlayer
- (void)setAuthStartTimeStamp:(CGFloat)timestamp {
    [self cancelAuthentication];
    %orig(timestamp);
}
%end
