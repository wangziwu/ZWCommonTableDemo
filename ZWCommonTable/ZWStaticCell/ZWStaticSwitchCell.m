//
//  ZWStaticSwitchCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWStaticSwitchCell.h"
#import "ZWCommonTableData.h"
#import "ZWStaticSwitchModel.h"
@interface ZWStaticSwitchCell ()
/** cellModel*/
@property (nonatomic, strong) ZWStaticSwitchModel *cellModel;
@end
@implementation ZWStaticSwitchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.zw_mSwitch addTarget:self
                        action:@selector(actionSwitch:)
              forControlEvents:UIControlEventValueChanged];
}
#pragma mark - config
#pragma mark - lifeCycle
- (void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.cellModel = rowData.cellExtraInfo;
    [self matchCellData];
}
#pragma mark - delegate
#pragma mark - actionFunction
- (void)actionSwitch:(UISwitch *)mSwitch{
    UIViewController *superVc = [self getSuperViewController:self];
    SEL sel = NSSelectorFromString(self.cellModel.actionSwitchName);
    BOOL goSel = sel&&[superVc respondsToSelector:sel];
    if (goSel) {
        [superVc performSelectorOnMainThread:sel withObject:mSwitch waitUntilDone:YES];
    }
}
#pragma mark - function
- (void)matchCellData{
    
}
-(UIViewController *)getSuperViewController:(UIView *)view{
    for (UIView* next = view; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
#pragma mark - layzing
-(void)setCellModel:(ZWStaticSwitchModel *)cellModel{
    _cellModel = cellModel;
    self.zw_switchTextLab.text = cellModel.title;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
