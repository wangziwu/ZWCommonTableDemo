//
//  InputSubmitViewModel.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "InputSubmitViewModel.h"
#import "ZWCommonTable.h"
#import "ZWStaticInputModel.h"
#import "ZWStaticOptionModel.h"
@implementation InputSubmitViewModel

-(NSArray *)staticDataArray{
    ZWStaticInputModel *nameItem = [[ZWStaticInputModel alloc] init];
    nameItem.title = @"设计师姓名";
    nameItem.textFieldPlaceHolder = @"请输入";
    nameItem.inputValue = self.dynamicData.uname;
    nameItem.blockText = ^(NSString *text) {
        self.dynamicData.uname = text;
    };
    
    ZWStaticInputModel *phoneItem = [[ZWStaticInputModel alloc] init];
    phoneItem.title = @"联系方式";
    phoneItem.textFieldPlaceHolder = @"请输入";
    phoneItem.inputValueMaxLength = 11;
    phoneItem.keyboardType = UIKeyboardTypeNumberPad;
    phoneItem.inputValue = self.dynamicData.uphone;
    phoneItem.blockText = ^(NSString *text) {
        self.dynamicData.uphone = text;
    };
    
    ZWStaticOptionModel *sexOption = [[ZWStaticOptionModel alloc] init];
    sexOption.optionTitle = @"性别";
    sexOption.optionValue = self.dynamicData.usex;
    
    ZWStaticTextViewModel *addressItem = [[ZWStaticTextViewModel alloc] init];
    addressItem.contentValue = self.dynamicData.uAddress;
    addressItem.blockTextChange = ^(NSString *text) {
        self.dynamicData.uAddress = text;
    };
    
    NSArray *array = @[
                       @{
                           SectionHeaderHeight :@"10",
                           SectionRows        :@[
                                   @{
                                       CellExtraInfo    :nameItem,
                                       IsForbidSelect   :@(YES)
                                       },
                                   @{
                                       CellExtraInfo    :phoneItem,
                                       IsForbidSelect   :@(YES)
                                       },
                                   @{
                                       CellActionSelName:@"actionSelectSex",
                                       CellExtraInfo    :sexOption
                                       }
                                   ]
                           },
                       @{
                           SectionHeaderTitle  :@"地址",
                           SectionRows         :@[
                                   @{
                                       CellRowHeight    :@"80",
                                       CellExtraInfo    :addressItem,
                                       IsForbidSelect   :@(YES)
                                       }
                                   ]
                           }
                       ];
    return [ZWCommonTableSection sectionsWithData:array];
}
#pragma mark - config
#pragma mark - lifeCycle
#pragma mark - delegate
#pragma mark - actionFunction
#pragma mark - function
#pragma mark - layzing
-(UserInfoModel *)dynamicData{
    if (!_dynamicData) {
        _dynamicData = [[UserInfoModel alloc] init];
    }
    return _dynamicData;
}
@end
