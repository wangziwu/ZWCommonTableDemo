//
//  ZWCommonButtonCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/7.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWCommonButtonCell.h"
#import "ZWCommonTableData.h"
@interface ZWCommonButtonCell ()
/** */
@property (nonatomic, strong) UIButton *bottomBtn;
@end

@implementation ZWCommonButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.bottomBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        self.bottomBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.bottomBtn.userInteractionEnabled = NO;
        [self.contentView addSubview:self.bottomBtn];
        self.separatorInset = UIEdgeInsetsMake(0, MAXFLOAT, 0, 0);
    }
    return self;
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    [self.bottomBtn setBackgroundColor:[UIColor whiteColor]];
    [self.bottomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.bottomBtn setTitle:rowData.cellTitle forState:UIControlStateNormal];
    self.bottomBtn.titleLabel.font = [UIFont systemFontOfSize:rowData.cellTitleFont];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.bottomBtn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
