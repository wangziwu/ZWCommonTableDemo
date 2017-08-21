//
//  ZWStaticOptionModel.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWStaticModelProtocol.h"
@interface ZWStaticOptionModel : NSObject<ZWStaticModelProtocol>
/** title*/
@property (nonatomic, copy) NSString *optionTitle;
/** 默认：请选择*/
@property (nonatomic, copy) NSString *optionDefaultText;
/** cell value*/
@property (nonatomic, copy) NSString *optionValue;
@end
