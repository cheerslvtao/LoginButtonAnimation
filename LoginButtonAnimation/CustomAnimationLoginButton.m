//
//  CustomAnimationLoginButton.m
//  LoginButtonAnimation
//
//  Created by SFC-a on 2017/3/10.
//  Copyright © 2017年 SFC-a. All rights reserved.
//

#import "CustomAnimationLoginButton.h"

@interface CustomAnimationLoginButton()
{
    /** button 原始rect */
    CGRect _buttonOriginalFrame;
    /** shapeLayer*/
    CAShapeLayer * _shapeCircle;
}
@end

@implementation CustomAnimationLoginButton

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)buttonTitle bgColor:(UIColor *)bgColor{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        _buttonOriginalFrame = frame;
        self.layer.cornerRadius = 10;
        [self setTitle:buttonTitle forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setBackgroundColor:bgColor];
    }
    return self;
}


-(void)startlogin{
    [self setTitle:@"" forState:UIControlStateNormal];
    [UIView animateWithDuration:0.4 animations:^{
        CGPoint center = self.center;
        //获取button高度 设置button为正方形
        CGFloat side = CGRectGetHeight(self.frame);
        self.frame = CGRectMake(0, 0, side, side);
        self.center = center;
        //削圆
        self.layer.cornerRadius = side/2;
    } completion:^(BOOL finished) {
        [self startAnimation];
    }];
}


-(void)endlogin{

    [self endAnimation];

    [UIView animateWithDuration:0.3 animations:^{
        self.frame = _buttonOriginalFrame;
        self.layer.cornerRadius = 10;
    } completion:^(BOOL finished) {
        [self setTitle:@"登录" forState:UIControlStateNormal];
    }];

}

/** 开始动画 */
-(void)startAnimation {
    
    CGFloat buttonwidth = CGRectGetHeight(_buttonOriginalFrame);

    _shapeCircle = [CAShapeLayer layer];
    _shapeCircle.frame = CGRectMake(0, 0, buttonwidth, buttonwidth);
    
    //绘制 多半圆路劲  参数分别是： 圆心、半径、开始角度、结束角度、是否顺时针(1为顺时针)
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(buttonwidth/2, buttonwidth/2) radius:buttonwidth/2-8 startAngle:0 endAngle:1.8*M_PI clockwise:1];
    _shapeCircle.path = path.CGPath;
    
    _shapeCircle.strokeColor = [UIColor whiteColor].CGColor;
    _shapeCircle.lineWidth = 5;
    _shapeCircle.fillColor = [UIColor clearColor].CGColor;
    _shapeCircle.strokeStart=0;
    _shapeCircle.strokeEnd = 1;
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"]; //transform.rotation.z 以z轴旋转  transform.rotation.x 以x轴旋转  transform.rotation.y 以y轴旋转
    animation.beginTime = 0; //马上开始
    animation.toValue = @(M_PI_2*80); //结束时的角度  2π * 80 角度
    animation.duration = 0.15*80; //持续时间  0.15 * 80 秒完成
    animation.repeatCount = 10000; //重复次数
    [_shapeCircle addAnimation:animation forKey:@"circle"];
    
    [self.layer addSublayer:_shapeCircle];
    
}

/** 结束动画 */
-(void)endAnimation {
    [_shapeCircle removeFromSuperlayer];
}

@end
