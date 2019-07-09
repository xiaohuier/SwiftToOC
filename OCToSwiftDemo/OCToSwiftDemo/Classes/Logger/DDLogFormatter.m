

#import "DDLogFormatter.h"

@implementation DDLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel = nil;
    switch (logMessage.level) {
        case DDLogLevelError: logLevel = @"E"; break;
        case DDLogLevelWarning: logLevel = @"W"; break;
        case DDLogLevelInfo: logLevel = @"I"; break;
        case DDLogLevelDebug: logLevel = @"D"; break;
        default: logLevel = @"O"; break;
    }

    return [NSString stringWithFormat:@"[%@][%@][%@]%@ - %@", logLevel, [self stringFromDate:logMessage.timestamp], logMessage.file, logMessage.function, logMessage.message];
}

- (NSString *)stringFromDate:(NSDate *)date
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    });
    return [dateFormatter stringFromDate:date];
}

@end
