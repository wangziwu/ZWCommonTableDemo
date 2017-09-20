//
//  ZWCommonConfig.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWCommonConfig.h"

@implementation ZWCommonConfig
+ (instancetype)sharedConfig{
    static ZWCommonConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZWCommonConfig alloc] init];
    });
    return instance;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.commonCellHeight       = 50.f;
        self.titleFontSize          = 15.f;
        self.detailTitleFontSize    = 15.f;
        self.textContainerInset = UIEdgeInsetsMake(8, 20, 8, 20);
    }
    return self;
}
@end
