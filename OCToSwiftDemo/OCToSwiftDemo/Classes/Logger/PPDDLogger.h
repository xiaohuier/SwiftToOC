//
//  SNOPLogger.h
//  SNOnePlayer
//
//  Created by rockyzhang on 2018/9/25.
//

#import <Foundation/Foundation.h>
#import "PPLogger.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPDDLogger : NSObject <PPLogger>

@property (nonatomic, strong) id<SNOPLogging> externalLogger;
@property (nonatomic, assign) BOOL debugLogEnable;

@property (nonatomic, readonly) NSArray<NSString *> *logFilePaths;

@end

NS_ASSUME_NONNULL_END
