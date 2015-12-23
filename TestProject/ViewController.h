//
//  ViewController.h
//  TestProject
//
//  Created by limx on 15/7/20.
//  Copyright (c) 2015年 limx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 飞行模式
- (BOOL)isAirplaneModeEnabled;
- (void)setAirplaneModeEnabled:(BOOL)enabled;

// Wi-Fi
- (BOOL)isWiFiEnabled;
- (void)setWiFiEnabled:(BOOL)enabled;

// 蓝牙
- (BOOL)isBluetoothEnabled;
- (void)setBluetoothEnabled:(BOOL)enabled;

// 自动锁定
- (BOOL)isAutoLockEnabled;
- (void)setAutoLockEnabled:(BOOL)enabled;

// 蜂窝移动数据
- (BOOL)is234GEnabled;
- (void)set234GEnabled:(BOOL)enabled;

// 定位服务
- (BOOL)isLocationServiceEnabled;
- (void)setLocationServiceEnabled:(BOOL)enabled;

// 主屏幕
- (void)goToHomeScreen;

// 横竖屏锁定
- (BOOL)isOrientationLockEnabled;
- (void)setOrientationLockEnabled:(BOOL)enabled;

// 手势辅助
- (BOOL)isAssistiveTouchEnabled;
- (void)setAssistiveTouchEnabled:(BOOL)enabled;

// 自动纠正输入
- (BOOL)isAutoCorrectEnabled;
- (void)setAutoCorrectEnabled:(BOOL)enabled;

// SSH
- (BOOL)isSSHEnabled;
- (void)setSSHEnabled:(BOOL)enabled;

// 均衡器
- (void)goToEqualizerMode;

// Siri
- (BOOL)isSiriEnabled;
- (void)setSiriEnabled:(BOOL)enabled;

// 振动
- (BOOL)isShakeModeEnabled;
- (void)setShakeModeEnabled:(BOOL)enabled;

// 音量增强
- (void)volumeUp;

// 音量减弱
- (void)volumeDown;

// 勿扰模式
- (BOOL)isDoNotDisturbModeEnabled;
- (void)setDoNotDisturbModeEnabled:(BOOL)enabled;

// 静音
- (BOOL)isSilentModeEnabled;
- (void)setSilentModeEnabled:(BOOL)enabled;

// 关机
- (void)powerOff;

// 注销
- (void)rebootSpringBoard;

// 重启
- (void)rebootDevice;

// 锁屏
- (void)lockScreen;

// 手电筒
- (BOOL)isFlashLightEnabled;
- (void)setFlashLightEnabled:(BOOL)enabled;

// VPN
- (BOOL)isVPNEnabled;
- (void)setVPNEnabled:(BOOL)enabled;

@end

