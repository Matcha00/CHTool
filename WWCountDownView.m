//
//  WWCountDownView.m
//  WanWu
//
//  Created by 陈欢 on 2018/10/26.
//  Copyright © 2018年 baozi. All rights reserved.
//

#import "WWCountDownView.h"
@interface WWCountDownView()

@property (nonatomic, strong) UILabel *copywritingLabel;

@property (nonatomic, strong) UILabel *showDayLabel;

@property (nonatomic, strong) UILabel *dayWordLabel;

@property (nonatomic, strong) UILabel *showHourLabel;

@property (nonatomic, strong) UILabel *hourWordLabel;

@property (nonatomic, strong) UILabel *showMinuteLabel;

@property (nonatomic, strong) UILabel *minuteWordLabel;

@property (nonatomic, strong) UILabel *showSecondLabel;

@property (nonatomic, strong) UILabel *secondWordLabel;

@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, strong) UIImageView *saleImageView;

@property (nonatomic, strong) NSTimer *countDownTimer;

@property (nonatomic, assign) NSInteger timestamp;

@property (nonatomic, assign) NSInteger startTime;

@property (nonatomic, assign) NSInteger endTime;

@property (nonatomic, strong) MASConstraint *copywritingLabelRight;

@property (nonatomic, strong) NSDate *enterBGDate;


@end

@implementation WWCountDownView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupUI];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
        [self setupNotification];
        
    }
    return self;
}


#pragma mark setupui

- (void)setupUI
{
    [self addSubview:self.bgView];
    [self addSubview:self.saleImageView];
    [self addSubview:self.copywritingLabel];
    [self addSubview:self.showDayLabel];
    [self addSubview:self.dayWordLabel];
    [self addSubview:self.showHourLabel];
    [self addSubview:self.hourWordLabel];
    [self addSubview:self.showMinuteLabel];
    [self addSubview:self.minuteWordLabel];
    [self addSubview:self.showSecondLabel];
    [self addSubview:self.secondWordLabel];
    
    
    WKC_WeakSelf(ws)
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws);
    }];
    
    [self.saleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.mas_centerY);
        make.left.equalTo(ws.mas_left).offset(20);
        make.height.equalTo(@(15));
        make.width.equalTo(@(63));
    }];
    
    [self.secondWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.mas_right).offset(-5);
        make.height.equalTo(@(11));
        make.width.equalTo(@(12));
    }];
    
    [self.showSecondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.secondWordLabel.mas_left).offset(-4);
        make.height.equalTo(@(14));
        make.width.equalTo(@(15));
        
    }];
    
    [self.minuteWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.showSecondLabel.mas_left).offset(-4);
        make.height.equalTo(@(11));
        make.width.equalTo(@(12));
        
    }];
    
    [self.showMinuteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.minuteWordLabel.mas_left).offset(-4);
        make.height.equalTo(@(14));
        make.width.equalTo(@(15));
        
    }];
    
    [self.hourWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.showMinuteLabel.mas_left).offset(-4);
        make.height.equalTo(@(11));
        make.width.equalTo(@(12));
        
    }];
    
    [self.showHourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.hourWordLabel.mas_left).offset(-4);
        make.height.equalTo(@(14));
        make.width.equalTo(@(15));
        
    }];
    
    [self.dayWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.showHourLabel.mas_left).offset(-4);
        make.height.equalTo(@(11));
        make.width.equalTo(@(12));
        
    }];
    
    [self.showDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        make.right.equalTo(ws.dayWordLabel.mas_left).offset(-4);
        make.height.equalTo(@(14));
        make.width.equalTo(@(15));
        
    }];
    
    [self.copywritingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(ws.mas_centerY);
        ws.copywritingLabelRight = make.right.equalTo(ws.showDayLabel.mas_left).offset(-9);
        make.height.equalTo(@(14));
        make.width.equalTo(@(73));
        
    }];
    
    
}

// 拿到外界传来的时间

- (void)setCountDownTime:(NSInteger)startime endtime:(NSInteger)endtime
{
    self.startTime = startime;
    self.endTime = endtime;
    [self handlerCountDownTime];
}

-(void)handlerCountDownTime{
    
    NSInteger correctTime = [NSDate wkc_nowTimeStamp];
    
    if (correctTime < self.startTime) {
        
        self.timestamp = self.startTime - correctTime;
        [self saleWarmupType];
        [self startTimer];
        
    }else if(self.startTime <= correctTime && correctTime < self.endTime){
        
        self.timestamp = self.endTime - correctTime;
        [self saleStartSellType];
        [self startTimer];
        
    }else{
       
        self.timestamp = 0;
        [self stopTimer];
        if(self.timerStopBlock) {
            self.timerStopBlock();
        }
        
    }
    [self getDetailTimeWithTimestamp:self.timestamp];
   
}


-(void)countDownTimer:(NSTimer*)timerr{
    self.timestamp--;
    
    if (self.timestamp == 0) {
        
        [self handlerCountDownTime];
    }
    
    [self getDetailTimeWithTimestamp:self.timestamp];
    
}
- (void)getDetailTimeWithTimestamp:(NSInteger)timestamp {
    
    
    NSInteger ms = timestamp;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;
    
    // 剩余的
    NSInteger day = ms / dd;// 天
    NSInteger hour = (ms - day * dd) / hh;// 时
    NSInteger minute = (ms - day * dd - hour * hh) / mi;// 分
    NSInteger second = (ms - day * dd - hour * hh - minute * mi) / ss;// 秒
    
    WKC_WeakSelf(ws)
    
    if (day > 0) {
        self.showDayLabel.hidden = NO;
        self.dayWordLabel.hidden = NO;
        self.showDayLabel.text = [NSString stringWithFormat:@"%02ld",(long)day];
        [self.copywritingLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            [ws.copywritingLabelRight uninstall];
            ws.copywritingLabelRight = make.right.equalTo(ws.showDayLabel.mas_left).offset(-9);
        }];
    } else {
        self.showDayLabel.hidden = YES;
        self.dayWordLabel.hidden = YES;
        [self.copywritingLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            [ws.copywritingLabelRight uninstall];
            ws.copywritingLabelRight = make.right.equalTo(ws.showHourLabel.mas_left).offset(-9);
        }];
    }
    
    
    self.showHourLabel.text = [NSString stringWithFormat:@"%02ld",(long)hour];
    self.showMinuteLabel.text = [NSString stringWithFormat:@"%02ld",(long)minute];
    self.showSecondLabel.text = [NSString stringWithFormat:@"%02ld",(long)second];
    
    
    NSLog(@"--------%ld%ld%ld%ld",(long)day,(long)hour,(long)minute,(long)second);
    
}

- (void)saleWarmupType
{
    self.copywritingLabel.text = @"距离结束仅剩";
    //self.showDayLabel.textColor = WKC_HEXRGBCOLOR(0xFFFFFFFF);
    //self.showDayLabel.layer.backgroundColor = WKC_HEXRGBCOLOR(0xFF000000).CGColor;
    
    [self setLabelBGColor:WKC_HEXRGBCOLOR(0xFF000000) textColor:WKC_HEXRGBCOLOR(0xFFFFFFFF)];
    
}

- (void)saleStartSellType
{
    self.copywritingLabel.text = @"距离开始仅剩";
//    self.showDayLabel.textColor = WKC_HEXRGBCOLOR(0xFF000000);
//    self.showDayLabel.layer.backgroundColor = WKC_HEXRGBCOLOR(0xFFFFFFFF).CGColor;
    
    [self setLabelBGColor:WKC_HEXRGBCOLOR(0xFFFFFFFF) textColor:WKC_HEXRGBCOLOR(0xFF000000)];
}

- (void)setLabelBGColor:(UIColor *)bgColor textColor:(UIColor *)textColor
{
    self.showDayLabel.textColor = textColor;
    self.showDayLabel.layer.backgroundColor = bgColor.CGColor;
    
    self.showHourLabel.textColor = textColor;
    self.showHourLabel.layer.backgroundColor = bgColor.CGColor;
   
    self.showMinuteLabel.textColor = textColor;
     self.showMinuteLabel.layer.backgroundColor = bgColor.CGColor;
    
    self.showSecondLabel.textColor = textColor;
    self.showSecondLabel.layer.backgroundColor = bgColor.CGColor;
    
}

-(void)stopTimer {
    if (self.countDownTimer) {
        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
    }
}
-(void)startTimer{
    
    [self stopTimer];
    
    self.countDownTimer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownTimer:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.countDownTimer forMode:NSRunLoopCommonModes];
    
   
}

#pragma mark - setupNotification

-(void)setupNotification {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterBG) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterFG) name:UIApplicationWillEnterForegroundNotification object:nil];
}

-(void)enterBG {
    NSLog(@"应用进入后台啦");
    self.enterBGDate = [NSDate date];
}


-(void)enterFG {
    NSLog(@"应用将要进入到前台");
    NSDate * nowFGDate = [NSDate date];
    NSInteger interval = [nowFGDate timeIntervalSinceDate:self.enterBGDate];
    NSInteger val = self.timestamp - interval;
    if(val > 1){
        self.timestamp -= interval;
    }else{
        self.timestamp = 1;
    }
}



-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    [self stopTimer];
}

#pragma mark lazy

- (UIImageView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIImageView alloc]init];
        _bgView.image = [UIImage imageNamed:@"limited_time_sale_bg"];
    }
    return _bgView;
}

- (UIImageView *)saleImageView {
    
    if (!_saleImageView) {
        _saleImageView = [[UIImageView alloc]init];
        _saleImageView.image = [UIImage imageNamed:@"limited_time_sale"];
    }
    
    return _saleImageView;
}

- (UILabel *)copywritingLabel
{
    if (!_copywritingLabel) {
        _copywritingLabel = [[UILabel alloc]init];
        _copywritingLabel.text = @"距离开始仅剩";
        _copywritingLabel.font = BBTFont_Light(12);
        _copywritingLabel.textColor = WKC_HEXRGBCOLOR(0xFF000000);
    }
    return _copywritingLabel;
}

- (UILabel *)showDayLabel {
    
    if (!_showDayLabel) {
        _showDayLabel = [[UILabel alloc]init];
        _showDayLabel.layer.backgroundColor = WKC_HEXRGBCOLOR(0xFFFFFFFF).CGColor;
        _showDayLabel.layer.cornerRadius = 2;
        _showDayLabel.font = BBTFont_Medium(10);
        _showDayLabel.textAlignment = NSTextAlignmentCenter;
        _showDayLabel.textColor = WKC_HEXRGBCOLOR(0xFF000000);
        [_showDayLabel adjustsFontSizeToFitWidth];
    }
    
    return _showDayLabel;
}

- (UILabel *)dayWordLabel {
    
    if (!_dayWordLabel) {
        _dayWordLabel = [[UILabel alloc]init];
        _dayWordLabel.font = BBTFont_Light(12);
        _dayWordLabel.textColor = WKC_HEXRGBCOLOR(0xFF000000);
        _dayWordLabel.text = @"天";
    }
    
    return _dayWordLabel;
}

- (UILabel *)showHourLabel {
    
    if (!_showHourLabel) {
        _showHourLabel = [[UILabel alloc]init];
        _showHourLabel.layer.backgroundColor = self.showDayLabel.layer.backgroundColor;
        _showHourLabel.layer.cornerRadius = 2;
        _showHourLabel.font = BBTFont_Medium(10);
        _showHourLabel.textAlignment = NSTextAlignmentCenter;
        _showHourLabel.textColor = self.showDayLabel.textColor;
    }
    
    return _showHourLabel;
}

- (UILabel *)hourWordLabel {
    
    if (!_hourWordLabel) {
        _hourWordLabel = [[UILabel alloc]init];
        _hourWordLabel.font = BBTFont_Light(12);
        _hourWordLabel.textColor = WKC_HEXRGBCOLOR(0xFF000000);
        _hourWordLabel.text = @"时";
    }
    
    return _hourWordLabel;
}

- (UILabel *)showMinuteLabel {
    
    if (!_showMinuteLabel) {
        _showMinuteLabel = [[UILabel alloc]init];
        _showMinuteLabel.layer.backgroundColor = self.showDayLabel.layer.backgroundColor;
        _showMinuteLabel.layer.cornerRadius = 2;
        _showMinuteLabel.font = BBTFont_Medium(10);
        _showMinuteLabel.textAlignment = NSTextAlignmentCenter;
        _showMinuteLabel.textColor = self.showDayLabel.textColor;
    }
    
    return _showMinuteLabel;
}

- (UILabel *)minuteWordLabel {
    
    if (!_minuteWordLabel) {
        _minuteWordLabel = [[UILabel alloc]init];
        _minuteWordLabel.font = BBTFont_Light(12);
        _minuteWordLabel.textColor = WKC_HEXRGBCOLOR(0xFF000000);
        _minuteWordLabel.text = @"分";
    }
    
    return _minuteWordLabel;
}

- (UILabel *)showSecondLabel {
    
    if (!_showSecondLabel) {
        _showSecondLabel = [[UILabel alloc]init];
        _showSecondLabel.layer.backgroundColor = self.showDayLabel.layer.backgroundColor;
        _showSecondLabel.layer.cornerRadius = 2;
        _showSecondLabel.font = BBTFont_Medium(10);
        _showSecondLabel.textAlignment = NSTextAlignmentCenter;
        _showSecondLabel.textColor = self.showDayLabel.textColor;
    }
    
    return _showSecondLabel;
}

- (UILabel *)secondWordLabel {
    
    if (!_secondWordLabel) {
        _secondWordLabel = [[UILabel alloc]init];
        _secondWordLabel.font = BBTFont_Light(12);
        _secondWordLabel.textColor = WKC_HEXRGBCOLOR(0xFF000000);
        _secondWordLabel.text = @"秒";
    }
    
    return _secondWordLabel;
}


@end
