//
//  ZWStaticInputCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWStaticInputCell.h"
#import "ZWCommonTableData.h"
#import "ZWStaticInputModel.h"
@interface ZWStaticInputCell ()
/** cellModel*/
@property (nonatomic, strong) ZWStaticInputModel *cellModel;
@end
@implementation ZWStaticInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configListen];
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.cellModel = rowData.cellExtraInfo;
    [self refreshData];
}
#pragma mark - config
- (void)configListen{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionSelectText:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self.zw_inputTextField];
}
#pragma mark - lifeCycle
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - delegate
#pragma mark - actionFunction
- (void)actionSelectText:(NSNotification *)notice{
    UITextField *textField = notice.object;
    if (!textField) {
        return;
    }
    if (textField.text.length>self.cellModel.inputValueMaxLength) {
        textField.text = [textField.text substringToIndex:self.cellModel.inputValueMaxLength];
    }
    if (self.cellModel.blockText) {
        self.cellModel.blockText(textField.text);
    }
}
#pragma mark - function
- (void)refreshData{
    self.zw_inputTitleLab.text = self.cellModel.title;
    self.zw_inputTextField.placeholder = self.cellModel.textFieldPlaceHolder;
    self.zw_inputTextField.text = self.cellModel.inputValue;
    self.zw_inputTextField.keyboardType = self.cellModel.keyboardType;
}
#pragma mark - layzing
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
