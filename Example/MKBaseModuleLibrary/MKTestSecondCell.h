//
//  MKTestSecondCell.h
//  MKBaseModuleLibrary_Example
//
//  Created by aa on 2026/4/17.
//  Copyright © 2026 aadyx2007@163.com. All rights reserved.
//

#import <MKBaseModuleLibrary/MKBaseCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKTestSecondCellModel : NSObject

@property (nonatomic, copy)NSString *msg;

@end

@interface MKTestSecondCell : UITableViewCell

@property (nonatomic, strong)MKTestSecondCellModel *dataModel;

+ (MKTestSecondCell *)initCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
