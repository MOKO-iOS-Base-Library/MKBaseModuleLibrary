//
//  MKTestBaseController.m
//  MKBaseModuleLibrary_Example
//
//  Created by aa on 2020/12/18.
//  Copyright © 2020 aadyx2007@163.com. All rights reserved.
//

#import "MKTestBaseController.h"

#import <CoreLocation/CoreLocation.h>

#import "NSString+MKAdd.h"

#import "MKMacroDefines.h"

#import "Masonry.h"

#import "MKPickView.h"

@interface MKTestBaseController ()<CLLocationManagerDelegate>

@property (nonatomic, strong)CLLocationManager *locationManager;

@property (nonatomic, strong)CLBeaconIdentityConstraint *region;

@property (nonatomic, strong)CLBeaconRegion *tempRegion;

@end

@implementation MKTestBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.defaultTitle = @"Come on";
    self.custom_naviBarColor = [UIColor redColor];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:topView];
    [topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.height.mas_equalTo(30.f);
    }];
        
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Hello" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:button];
    [button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(20);
        make.right.mas_equalTo(self.view).mas_offset(-20);
        make.top.mas_equalTo(topView.mas_bottom).mas_offset(15.f);
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    NSLog(@"%f",kNavigationBarHeight);
    NSLog(@"%f",kSafeAreaHeight);
}

- (void)leftButtonMethod {
    MKPickView *pickView = [[MKPickView alloc] init];
    [pickView showPickViewWithDataList:@[@"1",@"2",@"3"] selectedRow:1 block:^(NSInteger currentRow) {
            
    }];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
      didDetermineState:(CLRegionState)state
              forRegion:(CLRegion *)region {
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Start Region" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray<CLBeacon *> *)beacons
   satisfyingConstraint:(CLBeaconIdentityConstraint *)beaconConstraint  API_AVAILABLE(ios(13.0)){
    for (NSInteger i = 0; i < beacons.count; i ++) {
        CLBeacon *beacon = beacons[i];
        NSLog(@"%@-%@-%@-%ld",beacon.UUID.UUIDString,beacon.major,beacon.minor,(long)beacon.proximity);
    }
}

- (void)locationManager:(CLLocationManager *)manager
didFailRangingBeaconsForConstraint:(CLBeaconIdentityConstraint *)beaconConstraint
                  error:(NSError *)error  API_AVAILABLE(ios(13.0)){
    NSLog(@"%s",__func__);
}

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region {
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Enter Region" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region {
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Exit Region" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"%s",__func__);
}

- (void)locationManager:(CLLocationManager *)manager
    monitoringDidFailForRegion:(nullable CLRegion *)region
    withError:(NSError *)error {
    NSLog(@"%s",__func__);
}

- (void)locationManager:(CLLocationManager *)manager
    didStartMonitoringForRegion:(CLRegion *)region {
    NSLog(@"%s",__func__);
}

- (void)locationManager:(CLLocationManager *)manager
    didFinishDeferredUpdatesWithError:(nullable NSError *)error {
    NSLog(@"%s",__func__);
}

#pragma mark - getter
- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (CLBeaconIdentityConstraint *)region {
    if (!_region) {
        NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"11112222-3333-4444-5555-666677778888"];
        _region = [[CLBeaconIdentityConstraint alloc] initWithUUID:uuid];
    }
    return _region;
}

- (CLBeaconRegion *)tempRegion {
    if (!_tempRegion) {
        _tempRegion = [[CLBeaconRegion alloc] initWithUUID:[[NSUUID alloc] initWithUUIDString:@"11112222-3333-4444-5555-666677778888"] identifier:@""];
        _tempRegion.notifyEntryStateOnDisplay = YES;
    }
    return _tempRegion;
}

@end
