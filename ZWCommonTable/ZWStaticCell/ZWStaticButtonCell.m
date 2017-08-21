//
//  ZWStaticButtonCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWStaticButtonCell.h"
#import "ZWCommonTableData.h"

@implementation ZWStaticButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.zw_buttonTextLab.text = rowData.cellTitle;
}
#pragma mark - config
#pragma mark - lifeCycle
#pragma mark - delegate
#pragma mark - actionFunction
#pragma mark - function
- (void)matchData{
    
}
#pragma mark - layzing
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
