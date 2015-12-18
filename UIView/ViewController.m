//
//  ViewController.m
//  UIView
//
//  Created by zhangys on 15/12/12.
//  Copyright © 2015年 zhangys. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView * view1;
@property (nonatomic, strong) UIView * view2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basisConfig];
    [self geometryConfig];
    [self hierarchyConfig];
    [self renderingConfig];
    [self animationBlockConfig];
    [self gestureRecognizersConfig];
}

/**
 *  1：基础配置
 */
- (void)basisConfig
{
    //1：常用的两种实例化方式
    self.view1 = [[UIView alloc] init];
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
    //2：基础属性
    self.view1.userInteractionEnabled = YES;//用户交互，默认是打开的
    self.view2.userInteractionEnabled = NO;
    //3：tag值
    self.view1.tag = 1001;
    self.view2.tag = 1002;
    
}

/**
 *  2：几何学配置
 */
- (void)geometryConfig
{
    //1：frame
    self.view1.frame = CGRectMake(100, 100, 200, 100);
    //2：bounds
    self.view1.bounds = CGRectMake(0, 0, 200, 100);
    self.view2.bounds = CGRectMake(0, 0, 200, 100);
    //3：center
    self.view1.center = CGPointMake(self.view.center.x, self.view.center.y);
    self.view2.center = self.view.center;//和上面效果相同
    //4：transform
    self.view1.transform = CGAffineTransformMakeRotation(0.1);//旋转
    self.view2.transform = CGAffineTransformRotate(self.view2.transform, 0.7);//旋转
    self.view1.transform = CGAffineTransformMakeTranslation(50, 50);//平移
    self.view2.transform = CGAffineTransformTranslate(self.view2.transform, -100, 100);//平移
    self.view1.transform = CGAffineTransformMakeScale(0.5, 0.5);//比例缩放
    self.view2.transform = CGAffineTransformScale(self.view2.transform, 0.5, 0.5);//比例缩放    
}

/**
 *  3：层级关系
 */
- (void)hierarchyConfig
{
    //1：添加到父视图
    [self.view addSubview:self.view1];//视图来的时候父视图把你带来
    [self.view addSubview:self.view2];
    //父视图管理子视图的思想，其实父视图上面应该有个子视图数组，来管理在它上面所有的子视图
    UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    view3.backgroundColor = [UIColor orangeColor];
    //2：三种插入方式
    [self.view insertSubview:view3 aboveSubview:self.view1];
    [self.view insertSubview:view3 belowSubview:self.view2];
    [self.view insertSubview:view3 atIndex:0];
    //3：bring send
    [self.view bringSubviewToFront:self.view1];
    [self.view sendSubviewToBack:self.view2];//父视图来操作，把它放到兄弟视图的最下面
    //4：交换
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];//按顺序交换视图
    //5：移除
    [view3 removeFromSuperview];//走的时候自己走，来的时候父视图把你带来
    //6：两个属性
    NSLog(@"----%@----%@",self.view.subviews, self.view1.superview);
    
}

/**
 *  4：渲染
 */
- (void)renderingConfig
{
    //1：背景颜色
    self.view1.backgroundColor = [UIColor orangeColor];
    //2：切边界
    UIView * view4 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 50, 200)];
    view4.backgroundColor = [UIColor blueColor];
    [self.view1 addSubview:view4];
    self.view1.clipsToBounds = YES;//父视图做的事情，让子视图切到自己的边界
    //3：透明度
    view4.alpha = 0.3;//View自带，不用Image
    //4：显示隐藏
    view4.hidden = YES;//视图的隐藏属性

}


/**
 *  5：动画
 */
- (void)animationBlockConfig
{
    //第一种
    [UIView animateWithDuration:5 animations:^{
        self.view1.alpha = 0.1;
    }];
    //第二种
    [UIView animateWithDuration:5 animations:^{
        self.view2.alpha = 0.1;
    } completion:^(BOOL finished) {
        self.view2.alpha = 1.0;
    }];
    //第三种
    [UIView animateWithDuration:5 delay:6 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.view2.frame = CGRectMake(0, 0, 100, 100);
        
    } completion:nil];
  
}

/**
 *  6：手势
 */
- (void)gestureRecognizersConfig
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] init];
    //添加手势
    [self.view1 addGestureRecognizer:tap];
    //移除手势
    [self.view1 removeGestureRecognizer:tap];
    
}

/**
 *  7：约束
 */
- (void)constraintConfig
{
    NSLayoutConstraint * constraint = [[NSLayoutConstraint alloc] init];
    //添加约束
    [self.view1 addConstraint:constraint];
    //添加约束组
    [self.view1 addConstraints:@[constraint]];
    //删除约束
    [self.view1 removeConstraint:constraint];
    //删除约束组
    [self.view1 removeConstraints:@[constraint]];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
