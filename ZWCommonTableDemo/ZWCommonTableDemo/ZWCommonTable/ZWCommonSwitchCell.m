//
//  ZWCommonSwitchCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/7.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWCommonSwitchCell.h"
#import "ZWCommonTableData.h"
@implementation ZWCommonSwitchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.textLabel.text = rowData.cellTitle;
    self.textLabel.font = [UIFont systemFontOfSize:rowData.cellTitleFont];
    self.detailTextLabel.text = rowData.cellDetailTitle;
    self.detailTextLabel.font = [UIFont systemFontOfSize:rowData.cellDetailTitleFont];
    [self.mSwitch setOn:rowData.isCellSwitchOn animated:NO];
    UIViewController *superVc = [self getSuperViewController:tableView];
    SEL sel = NSSelectorFromString(rowData.cellActionSelName);
    BOOL goSel = sel&&[superVc respondsToSelector:sel];
    if (goSel) {
        [self.mSwitch addTarget:superVc action:sel forControlEvents:UIControlEventValueChanged];
        return;
    }
}
//util
-(UIViewController *)getSuperViewController:(UIView *)view{
    for (UIView* next = view; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
