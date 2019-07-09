

#import "DDLogger.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "DDLogFormatter.h"
#import "DDLogFileManager.h"

@interface DDLogger ()

@property (nonatomic, strong, nonnull) DDLog *logger;

@end

@implementation DDLogger {
    DDTTYLogger *_ttyLogger;
    DDFileLogger *_fileLogger;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _logger = [[DDLog alloc] init];
        
        DDLogFileManager *logFileManager = [[DDLogFileManager alloc] initWithLogsDirectory:NSTemporaryDirectory()];
        logFileManager.maximumNumberOfLogFiles = 2;
        _fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
        _fileLogger.maximumFileSize = 2 * 1024 * 1024;
        _fileLogger.logFormatter = [[DDLogFormatter alloc] init];
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

#pragma mark 

- (void)log:(NSString *)module level:(DDLogLevel)level prefix:(NSString *)prefix format:(NSString * _Nonnull)format, ...
{
    va_list vl;
    va_start(vl, format);
    [self log:module level:level prefix:prefix format:format arguments:vl];
    va_end(vl);
}

- (void)log:(NSString *)module level:(DDLogLevel)level prefix:(NSString *)prefix format:(NSString * _Nonnull)format arguments:(va_list)argList
{
    
    DDLogFlag flag = DDLogFlagInfo;
    DDLogLevel ddLevel = DDLogLevelInfo;
    switch (level) {
        case DDLogLevelDebug:
            flag = DDLogFlagDebug;
            ddLevel = DDLogLevelDebug;
            break;
            
        case DDLogLevelInfo:
            flag = DDLogFlagInfo;
            ddLevel = DDLogLevelInfo;

            break;
            
        case DDLogLevelWarning:
            flag = DDLogFlagWarning;
            ddLevel = DDLogLevelWarning;
            break;
            
        case DDLogLevelError:
            flag = DDLogFlagError;
            ddLevel = DDLogLevelError;
            break;
            
        default:
            break;
    }
    
    if (!_debugLogEnable && level == DDLogLevelDebug) {
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
