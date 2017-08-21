//
//  ZWStaticInputModel.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWStaticInputModel.h"
@implementation ZWStaticInputModel

ZWConfigCellModel(@"ZWStaticInputCell");

-(NSInteger)inputValueMaxLength{
    if (!_inputValueMaxLength) {
        _inputValueMaxLength = 25;
    }
    return _inputValueMaxLength;
}
@end
