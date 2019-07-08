//
//  SNOPLogger.h
//  SNOnePlayer
//
//  Created by rockyzhang on 2018/9/25.
//

#import <Foundation/Foundation.h>
#import <SNOPLogging/SNOPLogging.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PPLogger <SNOPLogging>

@property (nonatomic, strong) id<SNOPLogging> externalLogger;
@property (nonatomic, assign) BOOL debugLogEnable;

@property (nonatomic, readonly) NSArray<NSString *> *logFilePaths;

@end

NS_ASSUME_NONNULL_END
