//
//  ZWStaticOptionCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWStaticOptionCell.h"
#import "ZWCommonTableData.h"
#import "ZWStaticOptionModel.h"
@interface ZWStaticOptionCell ()
/** cellModel*/
@property (nonatomic, strong) ZWStaticOptionModel *cellModel;
@end
@implementation ZWStaticOptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.cellModel = rowData.cellExtraInfo;
    [self refreshData];
}
#pragma mark - config
#pragma mark - lifeCycle
#pragma mark - delegate
#pragma mark - actionFunction
#pragma mark - function
- (void)refreshData{
    self.optionTitleLab.text = self.cellModel.optionTitle;
    if (self.cellModel.optionValue.length) {
        self.optionDetailLab.text = self.cellModel.optionValue;
        self.optionDetailLab.textColor = [UIColor blackColor];
    }else{
        self.optionDetailLab.text = self.cellModel.optionDefaultText;
        self.optionDetailLab.textColor = [UIColor lightGrayColor];
    }
}
#pragma mark - layzing
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
