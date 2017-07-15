//
//  ViewController.m
//  咻一咻
//
//  Created by 苗建浩 on 2017/7/13.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *clickBtn;
@property (nonatomic, strong) UIView *changeView;
@property (nonatomic, strong) UIView *clickChangeView;
@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic) BOOL clickBOOL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"咻一咻";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _clickBOOL = YES;
    
    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake((screenWidth - 60) / 2, (screenHight - NAVGATION_ADD_STATUS_HEIGHT ) / 2, 60, 60);
    clickBtn.backgroundColor = RGB_COLOR(26, 57, 222);
    [clickBtn setTitle:@"点我" forState:0];
    clickBtn.layer.cornerRadius = 30;
    [clickBtn addTarget:self action:@selector(clickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.clickBtn = clickBtn;
    [self.view addSubview:clickBtn];
    
    
    UIView *changeView = [[UIView alloc] initWithFrame:CGRectMake((screenWidth - 100) /2, NAVGATION_ADD_STATUS_HEIGHT + 10, 100, 100)];
    changeView.backgroundColor = RGB_COLOR(138, 184, 244);
    changeView.alpha = 1;
    changeView.center = clickBtn.center;
    changeView.layer.cornerRadius = 50;
    self.changeView = changeView;
    [self.view addSubview:changeView];
    [self.view insertSubview:clickBtn aboveSubview:changeView];
    
    
    NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    self.myTimer = myTimer;
    [myTimer setFireDate:[NSDate distantPast]];
}


- (void)clickBtnClick:(UIButton *)sender{
    
    UIView *clickChangeView = [[UIView alloc] initWithFrame:CGRectMake((screenWidth - 100) /2, NAVGATION_ADD_STATUS_HEIGHT + 10, 100, 100)];
    clickChangeView.backgroundColor = RGB_COLOR(138, 184, 244);
    clickChangeView.alpha = 1;
    clickChangeView.center = _clickBtn.center;
    clickChangeView.layer.cornerRadius = 50;
    self.clickChangeView = clickChangeView;
    [self.view addSubview:clickChangeView];
    [self.view insertSubview:_clickBtn aboveSubview:clickChangeView];
    
    
    [_myTimer setFireDate:[NSDate distantFuture]];
    _changeView.alpha = 0;
    
    
    [UIView animateWithDuration:1 animations:^{
        clickChangeView.transform = CGAffineTransformMakeScale(5, 5);
        clickChangeView.alpha = 0;
    } completion:^(BOOL finished) {
        clickChangeView.transform = CGAffineTransformMakeScale(1, 1);
        _changeView.alpha = 1;
        [_myTimer setFireDate:[NSDate distantPast]];
    }];
}


- (void)scrollTimer{
    _clickChangeView.alpha = 0;
    if (_clickBOOL) {
        [UIView animateWithDuration:0.8 animations:^{
            _changeView.transform = CGAffineTransformMakeScale(0.85, 0.85);
            _changeView.alpha = 0.8;
        }];
    }else{
        [UIView animateWithDuration:0.8 animations:^{
            _changeView.transform = CGAffineTransformMakeScale(1, 1);
            _changeView.alpha = 1;
        }];
    }
    _clickBOOL = !_clickBOOL;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
