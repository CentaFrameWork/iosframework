//
//  UIDevice+CENTANETAdditions.h
//

#import <UIKit/UIKit.h>

@interface UIDevice (CENTANETAdditions)

+ (BOOL)isHighResolutionDevice;
+ (UIInterfaceOrientation)currentOrientation;
+ (NSString *)getBundleIdentifier;
- (NSString *)getMacAddress;

@end
