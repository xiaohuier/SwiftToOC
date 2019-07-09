//
//  OWLogger.h
//  AFNetworking
//
//  Created by eastzhou on 2019/7/9.
//

#import <Foundation/Foundation.h>
#ifndef OWLoggingUtils_h
#define OWLoggingUtils_h

extern id sharedLogger;

#define OWLogDebug(frmt, ...)         SNOPLogDebug(sharedLogger, @"PPPlayerSDK", frmt, ##__VA_ARGS__)
#define OWLogInfo(frmt, ...)          SNOPLogInfo(sharedLogger, @"PPPlayerSDK", frmt, ##__VA_ARGS__)
#define OWLogWarning(frmt, ...)       SNOPLogWarning(sharedLogger, @"PPPlayerSDK", frmt, ##__VA_ARGS__)
#define OWLogError(frmt, ...)         SNOPLogError(sharedLogger, @"PPPlayerSDK", frmt, ##__VA_ARGS__)
#endif

@interface OWLogger : NSObject

@end

