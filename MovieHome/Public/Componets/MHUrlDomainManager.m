//
//  MHUrlDomainManager.m
//  ManureHeapFM
//
//  Created by 邹壮 on 2018/5/8.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import "MHUrlDomainManager.h"
@interface MHUrlDomainManager ()
@property (nonatomic, strong) NSMutableArray *arrayRead;
@property (nonatomic, strong) NSMutableDictionary *urlDict;
@end

@implementation MHUrlDomainManager
+ (void)load{
    [MHUrlDomainManager sharedInstance];
}
+ (MHUrlDomainManager *)sharedInstance
{
    static MHUrlDomainManager *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MHUrlDomainManager alloc] init];
    });
    
    return _sharedInstance;
}
- (id)init{
    self = [super init];
    if (self) {
        _arrayRead = [NSMutableArray arrayWithCapacity:10];
        _urlDict = [NSMutableDictionary dictionaryWithCapacity:100];
        NSString *urlPath = [[NSBundle mainBundle] pathForResource:@"kHttpAddressDefine" ofType:@"plist"];
        [self readPlistFile:urlPath];
        
        
    }
    return self;
}
- (void)readPlistFile:(NSString *)filePath{
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]&&[[filePath pathExtension] isEqualToString:@"plist"]) {
        if (![_arrayRead containsObject:filePath]) {
            NSArray *urlArray = [NSArray arrayWithContentsOfFile:filePath];
            if (!IsArrEmpty(urlArray)) {
                for (NSDictionary *dict in urlArray) {
                    for (NSString *key in dict.allKeys) {
                        NSString *value = EncodeStringFromDic(dict, key);
                        [_urlDict setSafeString:value forKey:key];
                    }
                }
            }
            [_arrayRead addObject:filePath];
        }
    }
}
- (NSString *)getDomainForKey:(NSString *)key{
    if (IsStrEmpty(key)) {
        return nil;
    }
    return EncodeStringFromDic(_urlDict, key);
}
@end
