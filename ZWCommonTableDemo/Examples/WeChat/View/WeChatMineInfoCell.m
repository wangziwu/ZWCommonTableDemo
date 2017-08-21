//
//  WeChatMineInfoCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/4.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "WeChatMineInfoCell.h"
#import "ZWCommonTableData.h"
#import "WeChatInfoModel.h"
@implementation WeChatMineInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.mineHeaderImage.layer.cornerRadius = 5;
    self.mineHeaderImage.clipsToBounds = YES;
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    WeChatInfoModel *model = rowData.cellExtraInfo;
    self.mineHeaderImage.image = [UIImage imageNamed:model.headerImage];
    self.mineNickLabel.text = model.name;
    self.mineWeChatNumber.text = [NSString stringWithFormat:@"微信号：%@",model.weChatName];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
