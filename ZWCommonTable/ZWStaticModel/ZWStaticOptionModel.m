//
//  ZWStaticOptionModel.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWStaticOptionModel.h"
@implementation ZWStaticOptionModel

ZWConfigCellModel(@"ZWStaticOptionCell");



-(NSString *)optionDefaultText{
    if (!_optionDefaultText) {
        _optionDefaultText = @"请选择";
    }
    return _optionDefaultText;
}
@end
