//
//  SNOPLogger.m
//  SNOnePlayer
//
//  Created by rockyzhang on 2018/9/25.
//

#import "PPDDLogger.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "PPDDLogFormatter.h"
#import "PPDDLogFileManager.h"

@interface PPDDLogger ()

@property (nonatomic, strong, nonnull) DDLog *logger;

@end

@implementation PPDDLogger {
    DDTTYLogger *_ttyLogger;
    DDFileLogger *_fileLogger;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _logger = [[DDLog alloc] init];
        
        PPDDLogFileManager *logFileManager = [[PPDDLogFileManager alloc] initWithLogsDirectory:NSTemporaryDirectory()];
        logFileManager.maximumNumberOfLogFiles = 2;
        _fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
        _fileLogger.maximumFileSize = 2 * 1024 * 1024;
        _fileLogger.logFormatter = [[PPDDLogFormatter alloc] init];
        [_logger addLogger:_fileLogger];
    }
    
    return self;
}

- (void)setDebugLogEnable:(BOOL)debugLogEnable
{
    _debugLogEnable = debugLogEnable;
    if (_debugLogEnable && !_ttyLogger) {
        _ttyLogger = [DDTTYLogger sharedInstance];
        [self.logger addLogger:_ttyLogger];
    } else {
        [self.logger removeLogger:_ttyLogger];
        _ttyLogger = nil;
    }
}

- (NSArray<NSString *> *)logFilePaths
{
    return _fileLogger.logFileManager.sortedLogFilePaths;
}

#pragma mark - SNOPLogging

- (void)log:(NSString *)module level:(SNOPLogLevel)level prefix:(NSString *)prefix format:(NSString * _Nonnull)format, ...
{
    va_list vl;
    va_start(vl, format);
    [self log:module level:level prefix:prefix format:format arguments:vl];
    va_end(vl);
}

- (void)log:(NSString *)module level:(SNOPLogLevel)level prefix:(NSString *)prefix format:(NSString * _Nonnull)format arguments:(va_list)argList
{
    [self.externalLogger log:module level:level prefix:prefix format:format arguments:argList];
    
    DDLogFlag flag = DDLogFlagInfo;
    DDLogLevel ddLevel = DDLogLevelInfo;
    switch (level) {
        case SNOPLogLevelDebug:
            flag = DDLogFlagDebug;
            ddLevel = DDLogLevelDebug;
            break;
            
        case SNOPLogLevelInfo:
            flag = DDLogFlagInfo;
            ddLevel = DDLogLevelInfo;

            break;
            
        case SNOPLogLevelWarning:
            flag = DDLogFlagWarning;
            ddLevel = DDLogLevelWarning;
            break;
            
        case SNOPLogLevelError:
            flag = DDLogFlagError;
            ddLevel = DDLogLevelError;
            break;
            
        default:
            break;
    }
    
    if (!_debugLogEnable && level == SNOPLogLevelDebug) {
        // 未开启debug日志输出，不记录debug日志
    } else {
        [self.logger log:YES
                   level:ddLevel
                    flag:flag
                 context:0
                    file:module.UTF8String
                function:prefix.UTF8String
                    line:0
                     tag:nil
                  format:format
                    args:argList];
    }
}

@end
