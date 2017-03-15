//
//  CustomAnimationLoginButton.h
//  LoginButtonAnimation
//
//  Created by SFC-a on 2017/3/10.
//  Copyright © 2017年 SFC-a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAnimationLoginButton : UIButton

/** 仿分期乐登录按钮 */

/** 初始化 */
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)buttonTitle bgColor:(UIColor *)bgColor;

/** 登录点击 开始动画 */
-(void)startlogin;

/** 登录过程结束 结束动画 */
-(void)endlogin;


@end
