//
//  MKSecondViewController.m
//  MKBaseModuleLibrary_Example
//
//  Created by aa on 2026/3/31.
//  Copyright © 2026 aadyx2007@163.com. All rights reserved.
//

#import "MKSecondViewController.h"

#import "Masonry.h"

#import "MKMacroDefines.h"
#import "MKBaseTableView.h"
#import "UIView+MKAdd.h"

#import "MKTestSecondCell.h"

@interface MKSecondViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)MKBaseTableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataList;

@end

@implementation MKSecondViewController

- (void)dealloc {
    NSLog(@"MKSecondViewController销毁");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
    [self loadSectionDatas];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.rightButton setImage:nil forState:UIControlStateNormal];
    [self.rightButton setTitle:@"Read all" forState:UIControlStateNormal];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MKTestSecondCell *cell = [MKTestSecondCell initCellWithTableView:tableView];
    cell.dataModel = self.dataList[indexPath.row];
    return cell;
}

#pragma mark - loadSectionDatas
- (void)loadSectionDatas {
    MKTestSecondCellModel *cellModel1 = [[MKTestSecondCellModel alloc] init];
    cellModel1.msg = @"Device name";
    [self.dataList addObject:cellModel1];
    
    MKTestSecondCellModel *cellModel2 = [[MKTestSecondCellModel alloc] init];
    cellModel2.msg = @"Product model";
    [self.dataList addObject:cellModel2];
    
    MKTestSecondCellModel *cellModel3 = [[MKTestSecondCellModel alloc] init];
    cellModel3.msg = @"Manufacturer";
    [self.dataList addObject:cellModel3];
    
    MKTestSecondCellModel *cellModel4 = [[MKTestSecondCellModel alloc] init];
    cellModel4.msg = @"Hardware version";
    [self.dataList addObject:cellModel4];
    
    MKTestSecondCellModel *cellModel5 = [[MKTestSecondCellModel alloc] init];
    cellModel5.msg = @"Software version";
    [self.dataList addObject:cellModel5];
    
    MKTestSecondCellModel *cellModel6 = [[MKTestSecondCellModel alloc] init];
    cellModel6.msg = @"WIFI Firmware Version";
    [self.dataList addObject:cellModel6];
    
    MKTestSecondCellModel *cellModel7 = [[MKTestSecondCellModel alloc] init];
    cellModel7.msg = @"WIFI MAC";
    [self.dataList addObject:cellModel7];
    
    MKTestSecondCellModel *cellModel8 = [[MKTestSecondCellModel alloc] init];
    cellModel8.msg = @"BT MAC";
    [self.dataList addObject:cellModel8];
    
    [self.tableView reloadData];
}

#pragma mark - UI
- (void)loadSubViews {
    self.defaultTitle = @"Device Information";
    [self.rightButton setImage:[UIImage imageNamed:@"idm_saveIcon.png"] forState:UIControlStateNormal];
    self.navBarBackgroundColor = [UIColor redColor];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.equalTo(self.view).offset(kTopBarHeight);
        make.bottom.equalTo(self.view).offset(-kSafeAreaHeight);
    }];
}

#pragma mark - getter
- (MKBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MKBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = RGBCOLOR(242, 242, 242);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

@end
