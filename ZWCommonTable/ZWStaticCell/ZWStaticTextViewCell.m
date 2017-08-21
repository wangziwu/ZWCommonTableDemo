//
//  ZWStaticTextViewCell.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWStaticTextViewCell.h"
#import "ZWStaticTextViewModel.h"
#import "ZWCommonTableData.h"
#import "ZWCommonConfig.h"
@interface ZWStaticTextViewCell ()
@property (weak, nonatomic) IBOutlet UITextView *staticTextView;
/** cellModel*/
@property (nonatomic, strong) ZWStaticTextViewModel *cellModel;
@end
@implementation ZWStaticTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configMargin];
    [self configListen];
}
-(void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.cellModel = rowData.cellExtraInfo;
    [self refreshData];
}
#pragma mark - config
- (void)configMargin{
    self.staticTextView.textContainerInset = ZWCommonShareConfig.textContainerInset;
}
- (void)configListen{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionTextViewChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self.staticTextView];
}
#pragma mark - lifeCycle
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - delegate
- (void)actionTextViewChange:(NSNotification *)notice{
    UITextView *textView = notice.object;
    if (!textView) {
        return;
    }
    if (self.cellModel.blockTextChange) {
        self.cellModel.blockTextChange(textView.text);
    }
}
#pragma mark - actionFunction
#pragma mark - function
- (void)refreshData{
    self.staticTextView.text = self.cellModel.contentValue;
}
#pragma mark - layzing
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
