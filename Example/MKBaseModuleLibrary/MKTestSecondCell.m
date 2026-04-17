//
//  MKTestSecondCell.m
//  MKBaseModuleLibrary_Example
//
//  Created by aa on 2026/4/17.
//  Copyright © 2026 aadyx2007@163.com. All rights reserved.
//

#import "MKTestSecondCell.h"

#import "Masonry.h"

#import "MKMacroDefines.h"
#import "UIView+MKAdd.h"
#import "NSString+MKAdd.h"

static CGFloat const iconWidth = 30.f;
static CGFloat const iconHeight = 30.f;

@implementation MKTestSecondCellModel
@end

@interface MKTestSecondCell ()

@property (nonatomic, strong)UIView *backView;

@property (nonatomic, strong)UILabel *msgLabel;

@end

@implementation MKTestSecondCell

+ (MKTestSecondCell *)initCellWithTableView:(UITableView *)tableView {
    MKTestSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MKTestSecondCellIdenty"];
    if (!cell) {
        cell = [[MKTestSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MKTestSecondCellIdenty"];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = COLOR_WHITE_MACROS;
        
        [self.contentView addSubview:self.backView];
        [self.backView addSubview:self.msgLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.backView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15.f);
        make.right.mas_equalTo(-15.f);
        make.top.mas_equalTo(7.f);
        make.bottom.mas_equalTo(-7.f);
    }];
    [self.msgLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5.f);
        make.right.mas_equalTo(-5.f);
        make.centerY.mas_equalTo(self.backView.mas_centerY);
        make.height.mas_equalTo(MKFont(15.f).lineHeight);
    }];
}

#pragma mark - setter
- (void)setDataModel:(MKTestSecondCellModel *)dataModel {
    _dataModel = nil;
    _dataModel = dataModel;
    if (!_dataModel || ![_dataModel isKindOfClass:MKTestSecondCellModel.class]) {
        return;
    }
    self.msgLabel.text = SafeStr(_dataModel.msg);
}

#pragma mark - getter
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = COLOR_WHITE_MACROS;
        
        _backView.layer.masksToBounds = YES;
        _backView.layer.borderColor = CUTTING_LINE_COLOR.CGColor;
        _backView.layer.borderWidth = 0.5f;
        _backView.layer.cornerRadius = 4.f;
    }
    return _backView;
}

- (UILabel *)msgLabel {
    if (!_msgLabel) {
        _msgLabel = [[UILabel alloc] init];
        _msgLabel.textColor = DEFAULT_TEXT_COLOR;
        _msgLabel.textAlignment = NSTextAlignmentLeft;
        _msgLabel.font = MKFont(13.f);
    }
    return _msgLabel;
}

@end
