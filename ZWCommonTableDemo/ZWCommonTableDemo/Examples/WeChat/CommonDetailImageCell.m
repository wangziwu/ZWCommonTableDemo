//
//  CommonDetailImageCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/4.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "CommonDetailImageCell.h"
#import "ZWCommonTableData.h"
@implementation CommonDetailImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.detailImage.image = [UIImage imageNamed:@"ProfileLockOn_17x17_"];
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.titleLabel.text = rowData.cellTitle;
    self.detailLabel.text = rowData.cellDetailTitle;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
