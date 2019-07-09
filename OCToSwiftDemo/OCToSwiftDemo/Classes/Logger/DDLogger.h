
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDLogger : NSObject

@property (nonatomic, assign) BOOL debugLogEnable;

@property (nonatomic, readonly) NSArray<NSString *> *logFilePaths;

@end

NS_ASSUME_NONNULL_END
