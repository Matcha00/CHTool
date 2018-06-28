#import <UIKit/UIKit.h>

@interface UITableView (factory)

//工厂方法
+ (instancetype)tableView;
+ (instancetype)groupTableView;

//工具方法
- (void)scrollToBottom;

@end

#import "SNUITableView.h"

@implementation UITableView (factory)

+ (instancetype)tableView
{
    UITableView *_tableView = [[self alloc] initWithFrame:CGRectZero
                                                      style:UITableViewStylePlain];
    [_tableView setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
    _tableView.scrollEnabled = YES;
    _tableView.userInteractionEnabled = YES;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = view;
    
    _tableView.sectionHeaderHeight = 0.f;
    _tableView.sectionFooterHeight = 0.f;
    
#ifdef __IPHONE_7_0
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
#else
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
#endif
    return _tableView;
}

+ (instancetype)groupTableView
{
    UITableView *_tableView = [[self alloc] initWithFrame:CGRectZero
                                                    style:UITableViewStyleGrouped];
    
    [_tableView setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
    _tableView.scrollEnabled = YES;
    _tableView.userInteractionEnabled = YES;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    
    _tableView.sectionHeaderHeight = 0.f;
    _tableView.sectionFooterHeight = 0.f;
    
#ifdef __IPHONE_7_0
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
#else
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
#endif
    return _tableView;
}

- (void)scrollToBottom
{
    NSInteger sectionCount = [self.dataSource numberOfSectionsInTableView:self];
    NSInteger lastSectionRowCount = [self.dataSource tableView:self numberOfRowsInSection:sectionCount-1];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastSectionRowCount-1 inSection:sectionCount-1];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewRowAnimationTop animated:YES];
}


@end


//配置
//
//  Config.m
//  
//
//  Created by     on 2010-4-18
//  Email:   --- at--- gmail.com
//  MSN:     --- at--- tom.com
//  Web Home:       
//  Copyright 2010   .All rights reserved.
//

#import <Foundation/Foundation.h>

#define  dFontSize       NSStringFromSelector(@selector(fontSize))
#define  dFontColor      NSStringFromSelector(@selector(fontColor))
#define  dAutoUpdate     NSStringFromSelector(@selector(autoUpdate))
#define  dLogined        NSStringFromSelector(@selector(logined))
#define  dUsername       NSStringFromSelector(@selector(username))
#define  dEmail          NSStringFromSelector(@selector(email))

#define  dUID            NSStringFromSelector(@selector(uid))
#define  dUserId            NSStringFromSelector(@selector(userId))
#define  dShoppingCartUserId            NSStringFromSelector(@selector(shoppingCartUserId))

#define  dPassword       NSStringFromSelector(@selector(password))
#define  dSavePassword   NSStringFromSelector(@selector(savePassword))
#define  dSoundOn        NSStringFromSelector(@selector(isSoundOn))
#define  dIsEfubaoActivate NSStringFromSelector(@selector(isEfubaoActivate))
#define  dIsBindMobile     NSStringFromSelector(@selector(isBindMobile))
#define  dIsEmailActivated      NSStringFromSelector(@selector(isEmailActivated))


#define  dShackOn        NSStringFromSelector(@selector(isShackOn))
#define  dNoticeOn        NSStringFromSelector(@selector(isNoticeOn))
#define  dIsAutoLoginOn        NSStringFromSelector(@selector(isAutoLoginOn))
#define  dPromptTimes        NSStringFromSelector(@selector(promptTimes))

#define  dLatitude      NSStringFromSelector(@selector(latitude))
#define  dLongitude     NSStringFromSelector(@selector(longitude))

#define  dTrafficMode       NSStringFromSelector(@selector(trafficMode))

#define  dLastLoginTabIndex         NSStringFromSelector(@selector(lastLoginTabIndex))

#define  dIpAddress            NSStringFromSelector(@selector(ipAddress))


#define  dIsAMPM              NSStringFromSelector(@selector(isAMPM))

#define  dServerURL           NSStringFromSelector(@selector(serverURL))

#define  dTopBannerList       NSStringFromSelector(@selector(topBannerList))

#define  dTopAdList          NSStringFromSelector(@selector(topAdList))

#define  dTopBookAdList      NSStringFromSelector(@selector(topBookAdList))

#define  dTopSearchAdList          NSStringFromSelector(@selector(topSearchAdList)) // add by wangjiaxing
#define  dSpecialSubjectList          NSStringFromSelector(@selector(specialSubjectList)) // add by wangjiaxing
#define  dm2DaJuHuiList          NSStringFromSelector(@selector(m2DaJuHuiList)) 
#define  dActList                    NSStringFromSelector(@selector(actList))

#define  dIsTopBannerImageLoaded    NSStringFromSelector(@selector(isTopBannerImageLoaded))

#define  dIsTopAdListImageLoaded    NSStringFromSelector(@selector(isTopAdListImageLoaded))


#define  dCenterBannerList     NSStringFromSelector(@selector(centerBannerList))    

#define  dDefaultProvince      NSStringFromSelector(@selector(defaultProvince))

#define  dDefaultCity          NSStringFromSelector(@selector(defaultCity))
#define  dDefaultSection          NSStringFromSelector(@selector(defaultSection))


#define  dDeliveryCity          NSStringFromSelector(@selector(deliveryCity))

#define  dDefaultAddressId          NSStringFromSelector(@selector(defaultAddressId))


#define  dLoginShoppingCartArr          NSStringFromSelector(@selector(loginShoppingCartArr))
#define  dUnloginShoppingCartArr          NSStringFromSelector(@selector(unloginShoppingCartArr))

#define  dEfubaoInfoList            NSStringFromSelector(@selector(efubaoInfoList))

#define  dMd5Timestring          NSStringFromSelector(@selector(md5Timestring))
#define  dPageKey       NSStringFromSelector(@selector(pageKey))
#define  dStartTime        NSStringFromSelector(@selector(startTime))
#define  dStopTime      NSStringFromSelector(@selector(stopTime))

#define dTodayDate      NSStringFromSelector(@selector(todayDate))

#define dSendCount      NSStringFromSelector(@selector(sendCount))
#define dCheckUserLoginOrNot    NSStringFromSelector(@selector(checkUserLoginOrNot))

#define dGetCodeList            NSStringFromSelector(@selector(getCodeList))
#define dPayServiceList         NSStringFromSelector(@selector(payServiceList))

#define dPayWaterList         NSStringFromSelector(@selector(payWaterList))
#define dPayElectricList         NSStringFromSelector(@selector(payElectricList))
#define dpayGasList         NSStringFromSelector(@selector(payGasList))

#define dProductTotalPrice         NSStringFromSelector(@selector(productTotalPrice))

#define dHelperVersion          NSStringFromSelector(@selector(helperVersion))

#define dAddressUpdateDttm     NSStringFromSelector(@selector(addressUpdateDttm))
#define dAddressUpdateProvinceLast     NSStringFromSelector(@selector(addressUpdateProvinceLast))
#define dAddressUpdateProvinceCodeLast     NSStringFromSelector(@selector(addressUpdateProvinceCodeLast))

#define dCityUpdateInfo           NSStringFromSelector(@selector(cityUpdateInfo))

#define dpayMobileNum           NSStringFromSelector(@selector(payMobileNum))

#define dStoreInfo          NSStringFromSelector(@selector(storeInfo))

#define dHaveHandCheckVersion   NSStringFromSelector(@selector(haveHandCheckVersion))

#define dLotteryCatArray           NSStringFromSelector(@selector(lotteryCatArray))

#define dAllLotteryArray           NSStringFromSelector(@selector(allLotteryArray))

#define dPhoneNumData           NSStringFromSelector(@selector(phoneNumData))

#define dPushMessageId          NSStringFromSelector(@selector(pushMessageId))

#define dGbHistoryArray           NSStringFromSelector(@selector(gbHistoryArray))

#define dGbDefaultCityId          NSStringFromSelector(@selector(gbDefaultCityId))

#define dGbDefaultCityName          NSStringFromSelector(@selector(gbDefaultCityName))

#define dGbCityList         NSStringFromSelector(@selector(gbCityList))

#define dbusinessFromCity          NSStringFromSelector(@selector(businessFromCity))

#define dbusinessToCity          NSStringFromSelector(@selector(businessToCity))

#define dIsFirstUseAddress       NSStringFromSelector(@selector(isFirstUseAddress)) 

#define dImageQuailty            NSStringFromSelector(@selector(imageQuailty))

#define dMessageFilter            NSStringFromSelector(@selector(messageFilter))

#define dUserContractMethod         NSStringFromSelector(@selector(userContractMethod))
#define dUserContractPhoneMethod         NSStringFromSelector(@selector(userContractPhoneMethod))
#define dUserContractType         NSStringFromSelector(@selector(userContractType))

#define dLocationCity         NSStringFromSelector(@selector(locationCity))

#define  dIsRegist      NSStringFromSelector(@selector(isRegist))

#define dAdvInfoList           NSStringFromSelector(@selector(advInfoList))

#define dNearByCityName         NSStringFromSelector(@selector(nearByCityName))

#define dNearByCityId           NSStringFromSelector(@selector(nearByCityId))

#define dLoginHistoryList         NSStringFromSelector(@selector(loginHistoryList))

#define dTravelCityList         NSStringFromSelector(@selector(travelCityList))

#define dNearByUnLocate         NSStringFromSelector(@selector(nearByUnLocate))

#define dPhoneCategory         NSStringFromSelector(@selector(phoneCategory))

#define dDmIdHistoryDic        NSStringFromSelector(@selector(dmIdHistoryDic))

#define dSearchType           NSStringFromSelector(@selector(searchType))

#define dWegType              NSStringFromSelector(@selector(wegType))

#define dWaterAccounts        NSStringFromSelector(@selector(waterAccounts))
#define dElectricityAccounts  NSStringFromSelector(@selector(electricityAccounts))
#define dGasAccounts          NSStringFromSelector(@selector(gasAccounts))

#define dlaunchDms            NSStringFromSelector(@selector(launchDms))


@interface Config : NSObject {
    
	NSUserDefaults                                      *defaults;
    
}

+(Config *)            currentConfig;



@property (readwrite, retain) NSUserDefaults             *defaults;

@property (nonatomic, readwrite, retain) NSNumber    *fontSize;
@property (nonatomic, readwrite, retain) NSString    *fontColor;
@property (nonatomic, readwrite, retain) NSNumber    *autoUpdate;
@property (nonatomic, readwrite, retain) NSNumber    *logined;
@property (nonatomic, readwrite, retain) NSString    *username;
@property (nonatomic, readwrite, retain) NSString    *password;
@property (nonatomic, readwrite, retain) NSString    *email;
@property (nonatomic, readwrite, retain) NSNumber    *uid;
@property (nonatomic, readwrite, retain) NSString    *userId;
//上次登陆帐号，用于购物车模块
@property (nonatomic, readwrite, retain) NSString    *shoppingCartUserId;
@property (nonatomic, readwrite, retain) NSNumber    *savePassword;
@property (nonatomic, readwrite, retain) NSNumber    *isEfubaoActivate;
@property (nonatomic, readwrite, retain) NSNumber    *isBindMobile;
@property (nonatomic, readwrite, retain) NSNumber    *isEmailActivated;
@property (nonatomic, readwrite, retain) NSNumber    *isSoundOn;
@property (nonatomic, readwrite, retain) NSNumber    *isShackOn;
@property (nonatomic, readwrite, retain) NSNumber    *isNoticeOn;
@property (nonatomic, readwrite, retain) NSNumber    *isAutoLoginOn;
@property (nonatomic, readwrite, retain) NSNumber    *promptTimes;

//省流量模式  0,自动 1，高清，2低清
@property (nonatomic, readwrite, retain)   NSNumber       *imageQuailty;

@property (nonatomic, readwrite, retain)   NSNumber       *messageFilter;


@property (nonatomic, readwrite, retain) NSNumber    *latitude;
@property (nonatomic, readwrite, retain) NSNumber    *longitude;


@property (nonatomic, readwrite, retain) NSString    *trafficMode;

@property (nonatomic, readwrite, retain) NSNumber    *lastLoginTabIndex;

@property (nonatomic, readwrite, retain) NSString    *ipAddress;

@property (nonatomic, readwrite, retain) NSNumber    *isAMPM;

@property (nonatomic, readwrite, retain) NSString    *serverURL;

@property (nonatomic, readwrite, retain) NSArray     *topBannerList;
@property (nonatomic, readwrite, retain) NSArray     *topAdList;
@property (nonatomic, readwrite, retain) NSArray     *topBookAdList;
@property (nonatomic, readwrite, retain) NSArray     *topSearchAdList; // add by wangjiaxing
@property (nonatomic, readwrite, retain) NSArray     *specialSubjectList; // add by wangjiaxing
@property (nonatomic, readwrite, retain) NSArray     *m2DaJuHuiList; // m2区域大聚会list
@property (nonatomic, readwrite, retain) NSArray     *actList;

@property (nonatomic, readwrite, retain) NSArray     *hotSaleList;

@property (nonatomic, readwrite, retain) NSArray     *centerBannerList;

@property (nonatomic, readwrite, retain) NSString    *defaultProvince;

@property (nonatomic, readwrite, retain) NSString    *defaultCity;

@property (nonatomic, readwrite, retain) NSString    *defaultSection;

@property (nonatomic, readwrite, retain) NSString    *deliveryCity;

@property (nonatomic, readwrite, retain) NSString    *defaultAddressId;

@property (nonatomic, readwrite, retain) NSNumber    *isTopBannerImageLoaded;
@property (nonatomic, readwrite, retain) NSNumber    *isTopAdListImageLoaded;

@property (nonatomic, readwrite, retain) NSMutableArray     *loginShoppingCartArr;
@property (nonatomic, readwrite, retain) NSMutableArray     *unloginShoppingCartArr;

@property (nonatomic, readwrite, retain) NSArray     *efubaoInfoList;
@property (nonatomic, readwrite, retain) NSMutableArray     *getCodeList;
@property (nonatomic, readwrite, retain) NSMutableArray     *payServiceList;

@property (nonatomic, readwrite, retain) NSMutableArray     *payWaterList;
@property (nonatomic, readwrite, retain) NSMutableArray     *payElectricList;
@property (nonatomic, readwrite, retain) NSMutableArray     *payGasList;

@property (nonatomic, readwrite, retain) NSMutableArray     *phoneNumData;


@property (nonatomic, readwrite, retain) NSString    *md5Timestring;

@property (nonatomic, readwrite, retain) NSNumber    *pageKey;

@property (nonatomic, readwrite, retain) NSString    *startTime;
@property (nonatomic, readwrite, retain) NSString    *stopTime;


//[BoundPhoneViewController]用于统计一天中的短信发送数量。
@property (nonatomic, readwrite, retain) NSString    *todayDate;

@property (nonatomic, readwrite, retain) NSNumber    *sendCount;

@property (nonatomic, readwrite, retain) NSNumber    *checkUserLoginOrNot;

@property (nonatomic, readwrite, retain) NSString    *productTotalPrice;

//指引页对应的版本号。
@property (nonatomic, readwrite, retain) NSString    *helperVersion;

@property (nonatomic, readwrite, retain) NSNumber    *addressUpdateDttm;

//距离上次发送地址更新时间
@property (nonatomic, readwrite, retain) NSNumber    *addressUpdateProvinceLast;
@property (nonatomic, readwrite, retain) NSNumber    *addressUpdateProvinceCodeLast;


@property (nonatomic, readwrite, retain) NSDictionary *cityUpdateInfo;

@property (nonatomic, readwrite,retain)NSString *payMobileNum;

@property (nonatomic, readwrite, retain) NSData *storeInfo; 

@property (nonatomic, readwrite,retain)NSMutableArray   *lotteryCatArray;
@property (nonatomic, readwrite,retain)NSMutableArray   *allLotteryArray;

//是否手动检查过版本更新
@property (nonatomic, readwrite, retain) NSString  *haveHandCheckVersion;
//最新的已经展示过的消息推送id
@property (nonatomic, readwrite, retain) NSString  *pushMessageId;

//新团购搜索历史纪录
@property (nonatomic, readwrite,retain)NSMutableArray   *gbHistoryArray;
//新团购列表默认城市
@property (nonatomic, readwrite,retain)NSString          *gbDefaultCityId;
@property (nonatomic, readwrite,retain)NSString          *gbDefaultCityName;

@property (nonatomic, readwrite,retain)NSString          *businessFromCity;
@property (nonatomic, readwrite,retain)NSString          *businessToCity;

@property (nonatomic, readwrite, retain) NSString        *isFirstUseAddress;

//用户反馈 add by xiewei 
@property (nonatomic, readwrite, retain) NSString        *userContractMethod; //邮箱
@property (nonatomic, readwrite, retain) NSString        *userContractPhoneMethod; //手机
@property (nonatomic, readwrite, retain) NSString        *userContractType;


@property (nonatomic, readwrite,retain)  NSMutableDictionary    *gbCityList;

//定位城市
@property (nonatomic, readwrite, retain) NSString        *locationCity;

//签到状态
@property (nonatomic, readwrite, retain) NSString       *isRegist;

//八连版内页信息
@property (nonatomic, readwrite,retain) NSMutableArray   *advInfoList;

//附近苏宁城市
@property (nonatomic, readwrite,retain) NSString         *nearByCityName;

//附近苏宁城市id
@property (nonatomic, readwrite, retain) NSString        *nearByCityId;

//用户名历史
@property (nonatomic, readwrite,retain) NSMutableArray   *loginHistoryList;

//DMid及当前时间
@property (nonatomic, readwrite,retain) NSMutableDictionary   *dmIdHistoryDic;

//附近苏宁  我的足迹
@property (nonatomic, readwrite,retain) NSMutableArray   *travelCityList;

@property (nonatomic, readwrite, retain) NSNumber        *isFirstLocateCity;
@property (nonatomic, readwrite, retain) NSNumber        *nearByUnLocate;


@property (nonatomic, readwrite, retain) NSNumber        *isGPSCitySaved;
@property (nonatomic, readwrite, retain) NSString        *gpsCityCode;

//分类开关（发生变话更新）
@property (nonatomic, readwrite, retain) NSString        *phoneCategory;

//保存当前搜索类型 0 - 商品， 1 － 店铺
@property (nonatomic, strong) NSNumber *searchType;

//保存上一次提交的付款类型 水电煤
@property (nonatomic, strong) NSNumber   *wegType;

//用户输入完成的 水电煤 账号,每种类型保存最新的5个账户

@property (nonatomic, strong) NSMutableArray *waterAccounts;
@property (nonatomic, strong) NSMutableArray *electricityAccounts;
@property (nonatomic, strong) NSMutableArray *gasAccounts;

//启动页dm信息
@property (nonatomic, strong) NSMutableArray *launchDms;


@end


//
//  Config.m
//  
//
//  Created by     on 2010-4-18
//  Email:   --- at--- gmail.com
//  MSN:     --- at--- tom.com
//  Web Home:       
//  Copyright 2010   .All rights reserved.
//


#import "NSString+SEL.h"

@implementation Config

@synthesize defaults;

@dynamic fontSize;
@dynamic fontColor;
@dynamic autoUpdate;
@dynamic logined;
@dynamic username;
@dynamic email;
@dynamic uid;
@dynamic userId;
@dynamic shoppingCartUserId;
@dynamic password;
@dynamic savePassword;
@dynamic isEfubaoActivate;
@dynamic isBindMobile;
@dynamic isEmailActivated;
@dynamic isSoundOn;
@dynamic isShackOn;
@dynamic isNoticeOn;
@dynamic isAutoLoginOn;
@dynamic promptTimes;

@dynamic latitude;
@dynamic longitude;

@dynamic phoneNumData;

@dynamic trafficMode;


@dynamic lastLoginTabIndex;

@dynamic ipAddress;

@dynamic isAMPM;

@dynamic serverURL;

@dynamic topBannerList;
@dynamic topAdList;
@dynamic topBookAdList;

@dynamic topSearchAdList; //add by wangjiaxing
@dynamic specialSubjectList; //add by wangjiaxing
@dynamic actList;

@dynamic centerBannerList;

@dynamic defaultProvince;

@dynamic defaultCity;

@dynamic defaultSection;

@dynamic deliveryCity;

@dynamic defaultAddressId;

@dynamic isTopBannerImageLoaded;
@dynamic isTopAdListImageLoaded;

@dynamic loginShoppingCartArr;
@dynamic unloginShoppingCartArr;
@dynamic efubaoInfoList;

@dynamic md5Timestring;
@dynamic pageKey;
@dynamic startTime;
@dynamic stopTime;

@dynamic todayDate;
@dynamic sendCount;

@dynamic checkUserLoginOrNot;

@dynamic getCodeList;

@dynamic payServiceList;

@dynamic payWaterList;

@dynamic payElectricList;

@dynamic payGasList;

@dynamic productTotalPrice;

@dynamic helperVersion;



@dynamic addressUpdateDttm;

@dynamic addressUpdateProvinceCodeLast;

@dynamic addressUpdateProvinceLast;

@dynamic cityUpdateInfo;

@dynamic payMobileNum;

@dynamic storeInfo;

@dynamic haveHandCheckVersion;
@dynamic pushMessageId;

@dynamic lotteryCatArray;
@dynamic allLotteryArray;

@dynamic gbHistoryArray;
@dynamic gbDefaultCityId;
@dynamic gbDefaultCityName;
@dynamic gbCityList;

@dynamic businessFromCity;
@dynamic businessToCity;
@dynamic isFirstUseAddress;
@dynamic imageQuailty;

@dynamic userContractMethod;
@dynamic userContractPhoneMethod;
@dynamic userContractType;

@dynamic locationCity;

@dynamic isRegist;
@dynamic advInfoList;
@dynamic nearByCityName;
@dynamic nearByCityId;
@dynamic loginHistoryList;
@dynamic dmIdHistoryDic;
@dynamic travelCityList;

@dynamic isFirstLocateCity;
@dynamic nearByUnLocate;

@dynamic isGPSCitySaved;
@dynamic gpsCityCode;

@dynamic phoneCategory;

@dynamic messageFilter;

@dynamic wegType;

@dynamic launchDms;



-(id) init {
	
    if(!(self = [super init]))
        return self;
	
    self.defaults = [NSUserDefaults standardUserDefaults];
	
    [self.defaults registerDefaults:[NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     
                                     [NSNumber numberWithLong:16],          dFontSize,
                                     @"",                                   dFontColor,
                                     [NSNumber numberWithBool:       YES],  dAutoUpdate,
                                     [NSNumber numberWithBool:       NO],   dLogined,
                                     @"",                                   dUsername,
                                     @"",                                   dEmail,						  
                                     
                                     [NSNumber numberWithInt:-1],            dUID,
                                     @"",                                    dUserId,
                                     @"",                                    dShoppingCartUserId,
                                     @"",                                    dPassword,
                                     
                                     [NSNumber numberWithBool:       YES],   dSavePassword,
                                     [NSNumber numberWithBool:       YES],   dSoundOn,
                                     [NSNumber numberWithBool:       NO], dIsEfubaoActivate  ,
                                     [NSNumber numberWithBool:       NO], dIsBindMobile  ,
                                     [NSNumber numberWithBool:       NO], dIsEmailActivated  ,
                                     [NSNumber numberWithBool:       NO],   dShackOn,
                                     [NSNumber numberWithBool:       YES],   dNoticeOn,
                                     [NSNumber numberWithBool:       NO],    dIsAutoLoginOn,
                                     [NSNumber numberWithInt:0],             dPromptTimes,
                                     [NSNumber numberWithFloat:0],           dLatitude,
                                     [NSNumber numberWithFloat:0],           dLongitude,						  
                                     [NSNumber numberWithFloat:0],           dIsTopBannerImageLoaded,	
                                     [NSNumber numberWithFloat:0],           dIsTopAdListImageLoaded,
                                     
                                     
                                     @"",                                    dTrafficMode,		
                                     
                                     
                                     [NSNumber numberWithInt:   0],          dLastLoginTabIndex,
                                     
                                     @"",                                    dIpAddress,	
                                     
                                     
                                     [NSNumber numberWithBool:        NO],   dIsAMPM,	
                                     
                                     @"",                                    dServerURL,
                                     [NSArray arrayWithArray:nil],           dTopBannerList,
                                     [NSArray arrayWithArray:nil],           dTopAdList,
                                     [NSArray arrayWithArray:nil],           dTopBookAdList,
                                     [NSArray arrayWithArray:nil],           dTopSearchAdList,
                                     [NSArray arrayWithArray:nil],           dSpecialSubjectList,
                                     [NSArray arrayWithArray:nil],           dm2DaJuHuiList,
                                     [NSArray arrayWithArray:nil],           dActList,
                                     [NSArray arrayWithArray:nil],           dCenterBannerList,
                                     
                                     @"100",                                  dDefaultProvince,
                                     @"9173",                                 dDefaultCity,
//                                     @"10",                                  dDefaultProvince,
//                                     @"9017",                                 dDefaultCity,

                                     @"11365",                                 dDefaultSection,
                                     
                                     @"",                                      dDeliveryCity,
                                     
                                     @"",                                     dDefaultAddressId,
                                     [NSMutableArray arrayWithArray:nil],            dLoginShoppingCartArr,
                                     [NSMutableArray arrayWithArray:nil],            dUnloginShoppingCartArr,
                                     [NSArray arrayWithArray:nil],            dEfubaoInfoList,
                                     
                                     @"",                                     dMd5Timestring,
                                     [NSNumber numberWithInt:0],              dPageKey,
                                     
                                     @"",                                     dStartTime,
                                     @"",                                     dStopTime,
                                     
                                     @"",                                     dTodayDate,
                                     [NSNumber numberWithInt:0],              dSendCount,
                                     [NSNumber numberWithBool:        NO],    dCheckUserLoginOrNot,
                                     [NSMutableArray arrayWithArray:nil],     dGetCodeList,
                                     [NSMutableArray arrayWithArray:nil],     dPayServiceList,
                                     [NSMutableArray arrayWithArray:nil],     dPayWaterList,
                                     [NSMutableArray arrayWithArray:nil],     dPayElectricList,
                                     [NSMutableArray arrayWithArray:nil],     dpayGasList,
                                     [NSMutableArray arrayWithArray:nil],     dPhoneNumData,
                                     @"",                                     dProductTotalPrice,
                                     @"",
                                         dHelperVersion,
                                     [NSNumber numberWithDouble:0],           dAddressUpdateDttm,
                                     [NSNumber numberWithDouble:0],           dAddressUpdateProvinceLast,
                                     [NSNumber numberWithDouble:0],           dAddressUpdateProvinceCodeLast,

                                     
                                     [NSDictionary dictionary],               dCityUpdateInfo,
                                     @"",                                      dpayMobileNum,
                                     [NSData data],                           dStoreInfo,
                                     @"noCheck",                                      dHaveHandCheckVersion,
                                     @"",
                                     dPushMessageId,
                                     [NSMutableArray arrayWithArray:nil],     dLotteryCatArray,
                                     [NSMutableArray arrayWithArray:nil],     dAllLotteryArray,
                                     [NSMutableArray arrayWithArray:nil],     dGbHistoryArray,
                                     @"",
                                     dGbDefaultCityId,
                                     @"",
                                     dGbDefaultCityName,
                                     [NSMutableDictionary dictionaryWithCapacity:2],               dGbCityList,
                                     @"北京",dbusinessFromCity,@"上海",dbusinessToCity,
                                     @"0",                           dIsFirstUseAddress,
                                     [NSNumber numberWithInt:0],             dImageQuailty,
                                     [NSNumber numberWithInt:0],             dMessageFilter,
                                     
                                     @"",                             dUserContractMethod,
                                     @"",                             dUserContractPhoneMethod,
                                     @"",                             dUserContractType,
                                     @"南京市",                             dLocationCity,
                                     @"0",    dIsRegist,
                                     [NSMutableArray arrayWithArray:nil],     dAdvInfoList,
                                     @"南京市",                                dNearByCityName,
                                     @"9173",                                 dNearByCityId,
                                     [NSMutableArray arrayWithCapacity:5],      dLoginHistoryList,
                                     [NSMutableArray arrayWithCapacity:3],     dTravelCityList,
                                     @YES,                  @"isFirstLocateCity",
                                     @YES,                  dNearByUnLocate,
                                     
                                     @NO,                   @"isGPSCitySaved",
                                     @"",                   @"gpsCityCode",
                                     
                                     @"",                    dPhoneCategory,
                                     [NSMutableDictionary dictionary],     dDmIdHistoryDic,
                                     [NSNumber numberWithInt:0],
                                      dSearchType,
                                     
                                     [NSNumber numberWithInt:0],
                                     dWegType,
                                     
                                     [NSMutableArray array],dWaterAccounts,
                                     [NSMutableArray array],dElectricityAccounts,
                                     [NSMutableArray array],dGasAccounts,
                                     
                                     [NSMutableArray array],dlaunchDms,
                                     nil]];
    
    
	return self;
}

-(void) dealloc {
    self.nearByUnLocate = nil;
    self.travelCityList = nil;
    self.nearByCityName = nil;
    self.nearByCityId = nil;
	self.fontSize = nil;
	self.fontColor = nil;
	self.autoUpdate = nil;
    self.defaults = nil;
    self.logined = nil;
	self.username = nil;
	self.email   = nil;
	self.uid = nil;
	self.userId = nil;
    self.shoppingCartUserId = nil;
	self.password = nil;
	self.savePassword = nil;
    self.isEfubaoActivate = nil;
    self.isBindMobile = nil;
    self.isEmailActivated = nil;
	self.isSoundOn = nil;
    self.isShackOn = nil;
    self.isNoticeOn = nil;  
	self.isAutoLoginOn = nil; 
    self.promptTimes = nil;
	
	self.latitude = nil; 
	self.longitude = nil; 
    
	self.phoneNumData = nil;
    
	self.trafficMode = nil;
    
	self.lastLoginTabIndex = nil;
    
	self.ipAddress = nil;    
	
	self.isAMPM = nil;
	
	self.serverURL = nil;
    
    self.topBannerList = nil;
    
    self.topAdList = nil;
    
    self.topBookAdList = nil;
	
    self.topSearchAdList = nil; //add by wangjiaxing
    
    self.specialSubjectList = nil; //add by wangjiaxing
    
    self.m2DaJuHuiList = nil;
    
    self.actList = nil;
    
    self.centerBannerList = nil;
    
    self.isTopBannerImageLoaded = nil;
    
    self.isTopAdListImageLoaded = nil;
    
    self.defaultProvince = nil;
    
    self.defaultCity = nil;
    
    self.defaultSection = nil;
    
    self.deliveryCity = nil;
    
    self.defaultAddressId = nil;
    
    self.loginShoppingCartArr = nil;
    self.unloginShoppingCartArr = nil;
    self.efubaoInfoList  = nil;
    
    self.pageKey=nil;
    self.md5Timestring=nil;
    self.startTime=nil;
    self.stopTime = nil;
    
    self.todayDate = nil;
    self.sendCount = nil;
	
    self.checkUserLoginOrNot = nil;
    
    self.getCodeList = nil;
    self.payServiceList = nil;
    
    self.payWaterList = nil;
    self.payElectricList = nil;
    self.payGasList = nil;
    
    self.productTotalPrice = nil;
    
    
    self.helperVersion = nil;
    self.pushMessageId = nil;
    
    self.addressUpdateDttm = nil;
    self.addressUpdateProvinceLast = nil;
    self.addressUpdateProvinceCodeLast = nil;
    self.cityUpdateInfo = nil;
    self.payMobileNum = nil;
    self.storeInfo = nil;
    
    self.lotteryCatArray = nil;
    self.allLotteryArray = nil;
    
    self.gbHistoryArray = nil;
    
    self.gbDefaultCityId = nil;
    self.gbDefaultCityName = nil;
    self.gbCityList = nil;
    self.isFirstUseAddress = nil;
    
    self.imageQuailty = nil;
    
    self.messageFilter = nil;
    
    self.userContractMethod = nil;
    self.userContractPhoneMethod = nil;
    self.userContractType = nil;
    
    self.locationCity = nil;
    
    self.isRegist = nil;
    
    self.advInfoList = nil;
    self.loginHistoryList = nil;
    self.isFirstLocateCity = nil;
    
    self.phoneCategory = nil;
    
    self.dmIdHistoryDic = nil;
    
    self.wegType  = nil;
    self.waterAccounts = nil;
    self.electricityAccounts = nil;
    self.gasAccounts = nil;
    
    self.launchDms = nil;
}



+(Config *) currentConfig {
    
    static Config *instance;
	
    if(!instance)
		
        instance = [[Config alloc] init];
    
    return instance;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
	
    
    
    if ([NSStringFromSelector(aSelector) hasPrefix:@"set"]){
		
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
	}
    //DLog(@"methodSignatureForSelector 2\n");
    return [NSMethodSignature signatureWithObjCTypes:"@@:"];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    NSString *selector = NSStringFromSelector(anInvocation.selector);
    if ([selector hasPrefix:@"set"]) {
        NSRange firstChar, rest;
        firstChar.location  = 3;
        firstChar.length    = 1;
        rest.location       = 4;
        rest.length         = selector.length - 5;
        
        selector = [NSString stringWithFormat:@"%@%@",
                    [[selector substringWithRange:firstChar] lowercaseString],
                    [selector substringWithRange:rest]];
        
        __unsafe_unretained id value;
        [anInvocation getArgument:&value atIndex:2];
		
		//DLog(@"forwardInvocation 1\n");
        
        if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]])
        {
            [self.defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:value] forKey:selector];
        }
        else
        {
            [self.defaults setObject:value forKey:selector];
        }
        
    }
    
    else {
		//DLog(@"forwardInvocation 2\n");
        id value = [self.defaults objectForKey:selector];
        
        if ([value isKindOfClass:[NSData class]]) 
        {
            void *cfValue = (__bridge void *)[NSKeyedUnarchiver unarchiveObjectWithData:value];
            [anInvocation setReturnValue:&cfValue];
        }
        else
        {
            [anInvocation setReturnValue:&value];
        }
                
    }
}



@end

// log 配置
#import <Foundation/Foundation.h>

typedef NS_ENUM(UInt8, SNLogLevel) {
    SNLogLevelDEBUG         = 1,
    SNLogLevelINFO          = 2,
    SNLogLevelWARN          = 3,
    SNLogLevelERROR         = 4,
    SNLogLevelOFF           = 5,
};

#define SN_LOG_MACRO(level, fmt, ...)     [[SNLogger sharedInstance] logLevel:level format:(fmt), ##__VA_ARGS__]
#define SN_LOG_PRETTY(level, fmt, ...)    \
do {SN_LOG_MACRO(level, @"%s #%d " fmt, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);} while(0)

#define SNLogError(frmt, ...)   SN_LOG_PRETTY(SNLogLevelERROR, frmt, ##__VA_ARGS__)
#define SNLogWarn(frmt, ...)    SN_LOG_PRETTY(SNLogLevelWARN,  frmt, ##__VA_ARGS__)
#define SNLogInfo(frmt, ...)    SN_LOG_PRETTY(SNLogLevelINFO,  frmt, ##__VA_ARGS__)
#define SNLogDebug(frmt, ...)   SN_LOG_PRETTY(SNLogLevelDEBUG, frmt, ##__VA_ARGS__)
#define DLog(frmt, ...) SN_LOG_PRETTY(SNLogLevelDEBUG, frmt, ##__VA_ARGS__)

@interface SNLogger : NSObject

@property (nonatomic, assign) SNLogLevel logLevel;

+ (instancetype)sharedInstance;
+ (void)startWithLogLevel:(SNLogLevel)logLevel;

- (void)logLevel:(SNLogLevel)level format:(NSString *)format, ...;
- (void)logLevel:(SNLogLevel)level message:(NSString *)message;

@end


//
//  SNLogger.m
//  SuningEBuy
//
//  Created by liukun on 14-8-1.
//  Copyright (c) 2014年 Suning. All rights reserved.
//

#import "SNLogger.h"
#import <CocoaLumberjack/DDLog.h>
#import <CocoaLumberjack/DDTTYLogger.h>
#import <CocoaLumberjack/DDFileLogger.h>
#import <CocoaLumberjack/DDASLLogger.h>

static int ddLogLevel;

@interface SNLogger() <DDLogFormatter>


@end

#pragma mark - implement

@implementation SNLogger

+ (void)load
{
#ifdef DEBUG
    fprintf( stderr, "****************************************************************************************\n" );
	fprintf( stderr, "    											   \n" );
	fprintf( stderr, "    	copyright (c) 2014, {suning}               \n" );
    fprintf( stderr, "    	https://git.sn.com                         \n" );
	fprintf( stderr, "    										       \n" );
	
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	
	fprintf( stderr, "    	%s %s	\n", [SystemInfo platformString].UTF8String, [SystemInfo osVersion].UTF8String );
    fprintf( stderr, "    	ip: %s	\n", [SystemInfo localIPAddress].UTF8String );
	fprintf( stderr, "    	Home: %s	\n", [NSBundle mainBundle].bundlePath.UTF8String );
	fprintf( stderr, "    												\n" );
    fprintf( stderr, "****************************************************************************************\n" );
#endif
    
#endif
}

+ (instancetype)sharedInstance
{
    static SNLogger *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[SNLogger alloc] init];
    });
    return _instance;
}

+ (void)startWithLogLevel:(SNLogLevel)logLevel
{
    [self sharedInstance];
    [[self sharedInstance] setLogLevel:logLevel];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // sends log statements to Xcode console - if available
        [[DDTTYLogger sharedInstance] setLogFormatter:self];
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        
        // sends log statements to Apple System Logger, so they show up on Console.app
        [[DDASLLogger sharedInstance] setLogFormatter:self];
        [DDLog addLogger:[DDASLLogger sharedInstance]];
        
        //文件输出
//        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
//        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
//        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//        [fileLogger setLogFormatter:self];
//        [DDLog addLogger:fileLogger];
        
        // And then enable colors
        char *xcode_colors = getenv("XcodeColors");
        if (xcode_colors && (strcmp(xcode_colors, "YES") == 0))
        {
            [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
            [[DDTTYLogger sharedInstance] setForegroundColor:RGBCOLOR(0, 0, 255)
                                             backgroundColor:nil
                                                     forFlag:LOG_FLAG_INFO];
            [[DDTTYLogger sharedInstance] setForegroundColor:RGBCOLOR(0, 0, 0)
                                             backgroundColor:nil
                                                     forFlag:LOG_FLAG_DEBUG];
        }
    }
    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel = nil;
    switch (logMessage->logFlag)
    {
        case LOG_FLAG_ERROR:
            logLevel = @"[ERROR] > ";
            break;
        case LOG_FLAG_WARN:
            logLevel = @"[WARN]  > ";
            break;
        case LOG_FLAG_INFO:
            logLevel = @"[INFO]  > ";
            break;
        case LOG_FLAG_DEBUG:
            logLevel = @"[DEBUG] > ";
            break;
        default:
            logLevel = @"[VBOSE] > ";
            break;
    }
    
    NSString *formatStr = [NSString stringWithFormat:@"%@%@",
                           logLevel, logMessage->logMsg];
    return formatStr;
}

- (void)setLogLevel:(SNLogLevel)logLevel
{
    _logLevel = logLevel;
    switch (_logLevel) {
        case SNLogLevelDEBUG:
            ddLogLevel = LOG_LEVEL_DEBUG;
            break;
        case SNLogLevelINFO:
            ddLogLevel = LOG_LEVEL_INFO;
            break;
        case SNLogLevelWARN:
            ddLogLevel = LOG_LEVEL_WARN;
            break;
        case SNLogLevelERROR:
            ddLogLevel = LOG_LEVEL_ERROR;
            break;
        case SNLogLevelOFF:
            ddLogLevel = LOG_LEVEL_OFF;
            break;
        default:
            break;
    }
}

//! 记录日志(有格式)
- (void)logLevel:(SNLogLevel)level format:(NSString *)format, ...
{
    if (format)
    {
        va_list args;
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        [self logLevel:level message:message];
    }
}

//! 记录日志(无格式)
- (void)logLevel:(SNLogLevel)level message:(NSString *)message
{
    if (message.length > 0)
    {
        switch (level)
        {
            case SNLogLevelERROR:
                DDLogError(@"%@", message);
                break;
                
            case SNLogLevelWARN:
                DDLogWarn(@"%@", message);
                break;
                
            case SNLogLevelINFO:
                DDLogInfo(@"%@", message);
                break;
                
            case SNLogLevelDEBUG:
                DDLogDebug(@"%@", message);
                break;
                
            default:
                DDLogVerbose(@"%@", message);
                break;
        }
    }
}

@end


// 系统信息

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IOS8_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

#define IS_IPAD         (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
#define IS_IPHONE_5     [SNSystemInfo is_iPhone_5];

@interface SystemInfo : NSObject

/*系统版本*/
+ (NSString *)osVersion;

/*硬件版本*/
+ (NSString *)platform;

/*硬件版本名称*/
+ (NSString *)platformString;

/*系统当前时间 格式：yyyy-MM-dd HH:mm:ss*/
+ (NSString *)systemTimeInfo;

/*软件版本*/
+ (NSString *)appVersion;

/*是否是iPhone5*/
+ (BOOL)is_iPhone_5;

/*是否越狱*/
+ (BOOL)isJailBroken;

/*越狱版本*/
+ (NSString *)jailBreaker;

/*本地ip*/
+ (NSString *)localIPAddress;

@end

#import "SystemInfo.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/sockio.h>
#include <net/if.h>
#include <errno.h>
#include <net/if_dl.h>
#import "IPAddress.h"

@implementation SystemInfo

+ (NSString *)osVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)platform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

+ (NSString *)platformString
{
    NSString *platform = [self platform];
    
    if ([platform isEqualToString:@"iPhone1,1"])   return @"iPhone1G GSM";
    if ([platform isEqualToString:@"iPhone1,2"])   return @"iPhone3G GSM";
    if ([platform isEqualToString:@"iPhone2,1"])   return @"iPhone3GS GSM";
    if ([platform isEqualToString:@"iPhone3,1"])   return @"iPhone4 GSM";
    if ([platform isEqualToString:@"iPhone3,3"])   return @"iPhone4 CDMA";
    if ([platform isEqualToString:@"iPhone4,1"])   return @"iPhone4S";
    if ([platform isEqualToString:@"iPhone5,1"])   return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,2"])   return @"iPhone5";
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad1 WiFi";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad2 WiFi";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad2 GSM";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad2 CDMAV";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad2 CDMAS";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad mini WiFi";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad3 WiFi";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad3 GSM";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad3 CDMA";
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"])
        return @"iPhone Simulator";
    
    return platform;
}

//获取系统当前时间
+ (NSString *)systemTimeInfo
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateString = [dateFormatter stringFromDate:[NSDate date]];
    return currentDateString;
}

+ (NSString *)appVersion
{
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@", version];
}

+ (BOOL)is_iPhone_5
{
    if ([UIScreen mainScreen].bounds.size.height == 568.0f) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark -
#pragma mark jailbreaker

static const char * __jb_app = NULL;

+ (BOOL)isJailBroken
{
	static const char * __jb_apps[] =
	{
		"/Application/Cydia.app",
		"/Application/limera1n.app",
		"/Application/greenpois0n.app",
		"/Application/blackra1n.app",
		"/Application/blacksn0w.app",
		"/Application/redsn0w.app",
		NULL
	};
    
	__jb_app = NULL;
    
	// method 1
    for ( int i = 0; __jb_apps[i]; ++i )
    {
        if ( [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:__jb_apps[i]]] )
        {
			__jb_app = __jb_apps[i];
			return YES;
        }
    }
	
    // method 2
	if ( [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] )
	{
		return YES;
	}
	
	// method 3
	if ( 0 == system("ls") )
	{
		return YES;
	}
	
    return NO;
}

+ (NSString *)jailBreaker
{
	if ( __jb_app )
	{
		return [NSString stringWithUTF8String:__jb_app];
	}
	else
	{
		return @"";
	}
}

+ (NSString *)localIPAddress
{
    InitAddresses();
    
    GetIPAddresses();
    
    GetHWAddresses();
    
    return [NSString stringWithFormat:@"%s", ip_names[1]];
}

@end


//UIBarButtonItem

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SNNavItemStyle) {
    
    SNNavItemStyleBack, //返回
    SNNavItemStyleDone,
};

@interface SNUIBarButtonItem : UIBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title
                        Style:(SNNavItemStyle)style
                       target:(id)target
                       action:(SEL)action;

@end
#import "SNUIBarButtonItem.h"

@implementation SNUIBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title
                        Style:(SNNavItemStyle)style
                       target:(id)target
                       action:(SEL)action
{
    if (style == SNNavItemStyleBack)
    {
        //返回
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:[UIImage imageNamed:@"nav_back_normal.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"nav_back_select.png"] forState:UIControlStateHighlighted];
        btn.frame = CGRectMake(0, 0, 44, 44);
        if (IOS7_OR_LATER) {
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
        }else{
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
        }
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        SNUIBarButtonItem *item = [[SNUIBarButtonItem alloc] initWithCustomView:btn];
        return item;
    }
    else if (style == SNNavItemStyleDone)
    {
        if (IOS7_OR_LATER)
        {
            SNUIBarButtonItem *item = [[SNUIBarButtonItem alloc]
                                       initWithTitle:title
                                       style:UIBarButtonItemStylePlain
                                       target:target
                                       action:action];
            [item setTitlePositionAdjustment:UIOffsetMake(-5, 0) forBarMetrics:UIBarMetricsDefault];
            item.tintColor = [UIColor colorWithRGBHex:0xfc7c26];
            return item;
        }
        else
        {
            CGSize size = [title sizeWithFont:[UIFont boldSystemFontOfSize:17.0]];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor clearColor];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 2.5, 0, 0)];
            [btn setTitleColor:[UIColor colorWithRGBHex:0xfc7c26] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor light_Gray_Color] forState:UIControlStateDisabled];
            [btn setTitle:title forState:UIControlStateNormal];
            btn.frame = CGRectMake(0, 6, size.width + 20, 32);
            [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            SNUIBarButtonItem *item = [[SNUIBarButtonItem alloc] initWithCustomView:btn];
            return item;
        }
    }
    else
    {
        return nil;
    }
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    if ([self.customView isKindOfClass:[UIControl class]])
    {
        UIControl *ctrl = (UIControl *)self.customView;
        ctrl.enabled = enabled;
    }
}

@end




//密码

#import <Foundation/Foundation.h>

@interface PasswordVerifyUtil : NSObject

+ (BOOL)verifyRegistePassword:(NSString *)password error:(NSString **)errorMsg;


@end


#import "PasswordVerifyUtil.h"
#import "RegexKitLite.h"

@interface PasswordVerifyUtil()

//是否全是相同的字符
+ (BOOL)isAllSameChars:(NSString *)password;

//是否是连续递增的字符
+ (BOOL)hasAllIncreaseChars:(NSString *)password;

//是否是连续递减的字符
+ (BOOL)hasAllDecreaseChars:(NSString *)password;

//是否为纯数字
+ (BOOL)isAllNum:(NSString *)password;

//是否为纯字母
+ (BOOL)isAllLetter:(NSString *)password;

//是否为纯字符
+ (BOOL)isAllSymbol:(NSString *)password;

//是否含有非法字符
+ (BOOL)hasIllegalSymbol:(NSString *)password;

@end

/*********************************************************************/

@implementation PasswordVerifyUtil

+ (BOOL)verifyRegistePassword:(NSString *)password error:(NSString **)errorMsg
{
    //检查字符位数
    if (password == nil || password.length < 6 || password.length > 20) {
        *errorMsg = L(@"UCPleaseEnter6-20Password");
        return NO;
    }
    
    //检查是否为相同字符
    if ([self isAllSameChars:password]) {
        *errorMsg = L(@"UCPasswordCannotBeSameCharacter");
        return NO;
    }
    
    //检查是否为连续字符
    if ([self hasAllIncreaseChars:password] || [self hasAllDecreaseChars:password]) {
        *errorMsg = L(@"UCPasswordCannotBeContinueCharacter");
        return NO;
    }
    
    //检查是否为纯数字、字母、或符号
    if ([self isAllNum:password] || [self isAllLetter:password] || [self isAllSymbol:password])
    {
//        *errorMsg = @"密码不能为纯粹的数字，字母或者符号！";
        *errorMsg = L(@"UCPasswordNumbersOrSymbolsCombination");
        return NO;
    }
    
    //是否有非法字符
    if ([self hasIllegalSymbol:password]) {
//        *errorMsg = @"密码只能由英文、数字以及符号组成！";
        *errorMsg = L(@"UCPasswordNumbersOrSymbolsCombination");
        return NO;
    }
    
    return YES;
}

+ (BOOL)isAllSameChars:(NSString *)password
{
    unichar fir = [password characterAtIndex:0];
    for (int i = 1; i < password.length; i++) {
        unichar c = [password characterAtIndex:i];
        if (c != fir) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)hasAllIncreaseChars:(NSString *)password
{
    int l = password.length;
    unichar top = [password characterAtIndex:0];
    int j = 1;
    for (int i = 1; i < password.length; i++) {
        unichar c = [password characterAtIndex:i];
        if (c == top+1) {
            j++;
        }else{
            j = 1;
        }
        top = c;
    }
    
    if (j >= l) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)hasAllDecreaseChars:(NSString *)password
{
    int l = password.length;
    unichar top = [password characterAtIndex:0];
    int j = 1;
    for (int i = 1; i < password.length; i++) {
        unichar c = [password characterAtIndex:i];
        if (c == top-1) {
            j++;
        }else{
            j = 1;
        }
        top = c;
    }
    
    if (j >= l) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)isAllNum:(NSString *)password
{
    NSString *regex = @"^\\d+$";
    if ([password isMatchedByRegex:regex]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isAllLetter:(NSString *)password
{
    NSString *regex = @"^[a-zA-Z]+$";
    if ([password isMatchedByRegex:regex]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isAllSymbol:(NSString *)password
{
    NSString *regex = @"^[^0-9a-zA-Z\\s<>;'\\\\]+$";
    if ([password isMatchedByRegex:regex]) {
        return YES;
    }
    return NO;
}

+ (BOOL)hasIllegalSymbol:(NSString *)password
{
    NSString *regex = @"[\\s<>;'\\\\]";
    if ([password isMatchedByRegex:regex]) {
        return YES;
    }
    return NO;
}

@end



// 密码加密

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

// PBEWITHMD5andDES算法默认盐，长度为8个字节，数据可配置，
// 需要和服务端保持一致
#define kPBEDefaultSalt     @"sn201209"


@interface PasswdUtil : NSObject

/*!
 * @abstract
 * 给指定的密码进行加密，采用的是PBEWITHMD5andDES算法
 *
 * @discussion
 * PBEWITHMD5andDES是一种基于口令的加密算法，口令和盐需要事先和服务端约定，经过多重摘要后生成密钥
 *
 * @param data
 * 待加密的明文密码
 *
 * @param userID
 * 待登录的用户名，这里作为用户口令
 *
 * @result
 * 加密后的密文(十六进制字符串)
 */
+ (NSString *)encryptData:(NSData *)data forUser:(NSString *)userID;

//刘坤添加，可设盐的
+ (NSString *)encryptString:(NSString *)string forKey:(NSString *)key salt:(NSString *)salt;

/*!
 * @abstract
 * 将加密后的密码进行解密，采用的是PBEWITHMD5andDES算法
 *
 * @discussion
 * PBEWITHMD5andDES是一种基于口令的加密算法，口令和盐需要事先和服务端约定，经过多重摘要后生成密钥
 *
 * @param data
 * 经过加密后的密文
 *
 * @param userID
 * 待登录的用户名，这里作为用户口令
 *
 * @result
 * 解密后的密码明文
 */
+ (NSString *)decryptData:(NSData *)data forUser:(NSString *)userID;

//解密string, 可设盐的
+ (NSString *)decryptString:(NSString *)string forKey:(NSString *)key salt:(NSString *)salt;



+ (NSData *)runCryptor:(CCCryptorRef)cryptor withData:(NSData *)data;
+ (NSData *)encryptPBEData:(NSData *)data usingPwd:(NSString *)pwd withSalt:(NSString *)salt;
+ (NSData *)decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                   data:(NSData *)data
                                    key:(id)key		// data or string
                   initializationVector:(id)iv		// data or string
                                options:(CCOptions)options;
+ (NSData *)encryptedUsingAlgorithm:(CCAlgorithm)algorithm
                               data:(NSData *)data
                                key:(id)key
               initializationVector:(id)iv
                            options:(CCOptions)options;
+ (NSData *)decryptPBEData:(NSData *)data usingPwd:(NSString *)pwd withSalt:(NSString *)salt;
+ (NSString *)hexStringForData:(NSData *)data;
+ (NSData *)dataForHexString:(NSString *)hexString;
@end


#import "PasswdUtil.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


// 口令和盐摘要迭代次数,可配置，
// 需要和服务端保持一致
#define MD5_ITERATIONS_NUM  50
static void FixKeyLengths(CCAlgorithm algorithm, NSMutableData *keyData, NSMutableData *ivData);

@implementation PasswdUtil

+ (NSString *)encryptData:(NSData *)data forUser:(NSString *)userID
{
    
    if (!data || !userID) 
    {
        return nil;
    }
    
    NSData *encryptedData = nil;    
    
    // 使用PBE算法进行加密，其中，userID为口令，kPBEDefaultSalt为默认盐
    encryptedData = [self encryptPBEData:data usingPwd:userID withSalt:kPBEDefaultSalt];
    
    return [self hexStringForData:encryptedData];
}

+ (NSString *)encryptString:(NSString *)string forKey:(NSString *)key salt:(NSString *)salt
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (!data || !key || !salt) {
        return nil;
    }
    NSData *encryptedData = nil;
    
    encryptedData = [self encryptPBEData:data usingPwd:key withSalt:salt];
    
    return [self hexStringForData:encryptedData];
}

+ (NSString *)decryptData:(NSData *)data forUser:(NSString *)userID
{
    if (!data || !userID) 
    {
        return nil;
    }
    
    NSData *decryptedData = nil;
    
    // 使用PBE算法进行解密，其中，userID为口令，kPBEDefaultSalt为默认盐
    decryptedData = [self decryptPBEData:data usingPwd:userID withSalt:kPBEDefaultSalt];
    
    NSString *plainText = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    
    return plainText;
}

+ (NSString *)decryptString:(NSString *)string forKey:(NSString *)key salt:(NSString *)salt
{
    NSData *data = [self dataForHexString:string];
    if (!data || !key || !salt)
    {
        return nil;
    }
    
    NSData *decryptedData = nil;
    
    // 使用PBE算法进行解密，其中，userID为口令，kPBEDefaultSalt为默认盐
    decryptedData = [self decryptPBEData:data usingPwd:key withSalt:salt];
    
    NSString *plainText = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    
    return plainText;
}

#pragma mark -
#pragma mark PBE
+ (NSData *)encryptPBEData:(NSData *)data usingPwd:(NSString *)pwd withSalt:(NSString *)salt
{    
    
    NSData *pwdData = [pwd dataUsingEncoding:NSUTF8StringEncoding];
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t md5[CC_MD5_DIGEST_LENGTH];
    memset(md5, 0, CC_MD5_DIGEST_LENGTH);
    
    CC_MD5_CTX ctx;
    CC_MD5_Init(&ctx);
    CC_MD5_Update(&ctx, [pwdData bytes], [pwdData length]);
    CC_MD5_Update(&ctx, [saltData bytes],[saltData length]);
    CC_MD5_Final(md5, &ctx);
    
    int i = 0;
    while (++i < MD5_ITERATIONS_NUM) 
    {
        CC_MD5(md5, CC_MD5_DIGEST_LENGTH, md5);
    }
    
    NSData *key = [NSData dataWithBytes:md5 length:CC_MD5_DIGEST_LENGTH];
    
    unsigned char iv[kCCBlockSizeDES];
    memcpy(iv, md5 + (CC_MD5_DIGEST_LENGTH/2), sizeof(iv));
    NSData *civ = [NSData dataWithBytes:iv length:kCCBlockSizeDES];
    
	NSData *result = [self encryptedUsingAlgorithm:kCCAlgorithmDES
                                                   data:data
                                                    key:key
                                   initializationVector:civ
                                                options:kCCOptionPKCS7Padding];
	
	if (result != nil)
    {
        return result;
    }
			
	return nil;
}

+ (NSData *)decryptPBEData:(NSData *)data usingPwd:(NSString *)pwd withSalt:(NSString *)salt
{
    
    NSData *pwdData = [pwd dataUsingEncoding:NSUTF8StringEncoding];
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t md5[CC_MD5_DIGEST_LENGTH];
    memset(md5, 0, CC_MD5_DIGEST_LENGTH);
    
    CC_MD5_CTX ctx;
    CC_MD5_Init(&ctx);
    CC_MD5_Update(&ctx, [pwdData bytes], [pwdData length]);
    CC_MD5_Update(&ctx, [saltData bytes],[saltData length]);
    CC_MD5_Final(md5, &ctx);
    
    int i = 0;
    while (++i < MD5_ITERATIONS_NUM) 
    {
        CC_MD5(md5, CC_MD5_DIGEST_LENGTH, md5);
    }
    
    NSData *key = [NSData dataWithBytes:md5 length:CC_MD5_DIGEST_LENGTH];
    
    unsigned char iv[kCCBlockSizeDES];
    memcpy(iv, md5 + (CC_MD5_DIGEST_LENGTH/2), sizeof(iv));
    NSData *civ = [NSData dataWithBytes:iv length:kCCBlockSizeDES];
    
	NSData *result = [self decryptedDataUsingAlgorithm:kCCAlgorithmDES
                                                    data:data
                                                    key:key
                                   initializationVector:civ
                                                options:kCCOptionPKCS7Padding];
	
	if (result != nil)
    {
        return result;
    }
	
	return nil;

}

+ (NSData *)encryptedUsingAlgorithm:(CCAlgorithm)algorithm
                               data:(NSData *)data
                                key:(id)key
               initializationVector:(id)iv
                            options:(CCOptions)options
{
	CCCryptorRef cryptor = NULL;
	CCCryptorStatus status = kCCSuccess;
	
	NSParameterAssert([key isKindOfClass: [NSData class]] || [key isKindOfClass: [NSString class]]);
	NSParameterAssert(iv == nil || [iv isKindOfClass: [NSData class]] || [iv isKindOfClass: [NSString class]]);
	
	NSMutableData *keyData, *ivData;
	if ([key isKindOfClass: [NSData class]])
    {
        keyData = (NSMutableData *)[key mutableCopy];
    }
	else
    {
		keyData = [[key dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    }
	
	if ([iv isKindOfClass: [NSString class]])
    {
		ivData = [[iv dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    }
	else
    {
		ivData = (NSMutableData *)[iv mutableCopy];	// data or nil
    }
	
//	[keyData autorelease];
//	[ivData autorelease];
//	
	// ensure correct lengths for key and iv data, based on algorithms
	FixKeyLengths(algorithm, keyData, ivData);
	
	status = CCCryptorCreate(kCCEncrypt, algorithm, options,
                             [keyData bytes], [keyData length], [ivData bytes],
                             &cryptor);
	
	if (status != kCCSuccess)
	{

		return nil;
	}
	
	NSData * result = [self runCryptor:cryptor withData:data];
	
	CCCryptorRelease(cryptor);
	
	return result;
}

+ (NSData *)decryptedDataUsingAlgorithm:(CCAlgorithm)algorithm
                                   data:(NSData *)data
                                    key:(id)key		// data or string
                   initializationVector:(id)iv		// data or string
                                options:(CCOptions)options
{
	CCCryptorRef cryptor = NULL;
	CCCryptorStatus status = kCCSuccess;
	
	NSParameterAssert([key isKindOfClass: [NSData class]] || [key isKindOfClass: [NSString class]]);
	NSParameterAssert(iv == nil || [iv isKindOfClass: [NSData class]] || [iv isKindOfClass: [NSString class]]);
	
	NSMutableData *keyData, *ivData;
	if ([key isKindOfClass: [NSData class]])
    {
		keyData = (NSMutableData *) [key mutableCopy];
    }
	else
    {
		keyData = [[key dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    }
	
	if ([iv isKindOfClass: [NSString class]])
    {
		ivData = [[iv dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    }
	else
    {
		ivData = (NSMutableData *)[iv mutableCopy];	// data or nil
    }
	
//	[keyData autorelease];
//	[ivData autorelease];
//	
	// ensure correct lengths for key and iv data, based on algorithms
	FixKeyLengths(algorithm, keyData, ivData);
	
	status = CCCryptorCreate(kCCDecrypt, algorithm, options,
                             [keyData bytes], [keyData length], [ivData bytes],
                             &cryptor);
	
	if ( status != kCCSuccess )
	{

		return nil;
	}
	
	NSData *result = [self runCryptor:cryptor withData:data];
	
	CCCryptorRelease(cryptor);
	
	return result;
}

+ (NSData *)runCryptor:(CCCryptorRef)cryptor withData:(NSData *)data
{
    CCCryptorStatus status = kCCSuccess;
    
	size_t bufsize = CCCryptorGetOutputLength(cryptor, (size_t)[data length], true);
    
	void *buf = malloc(bufsize);
    
	size_t bufused = 0;
    size_t bytesTotal = 0;
    
	status = CCCryptorUpdate(cryptor, [data bytes], (size_t)[data length], 
                             buf, bufsize, &bufused);
    
	if (status != kCCSuccess)
	{
		free(buf);
		return nil;
	}
    
    bytesTotal += bufused;
	
	// From Brent Royal-Gordon (Twitter: architechies):
	//  Need to update buf ptr past used bytes when calling CCCryptorFinal()
	status = CCCryptorFinal(cryptor, buf + bufused, bufsize - bufused, &bufused);
	if (status != kCCSuccess)
	{
		free(buf);
		return nil;
	}
    
    bytesTotal += bufused;
	
	return [NSData dataWithBytesNoCopy:buf length:bytesTotal];
}

static void FixKeyLengths(CCAlgorithm algorithm, NSMutableData *keyData, NSMutableData *ivData)
{
	NSUInteger keyLength = [keyData length];
    
	switch (algorithm)
	{
		case kCCAlgorithmAES128:
		{
			if (keyLength <= 16)
			{
				[keyData setLength: 16];
			}
			else if (keyLength <= 24)
			{
				[keyData setLength: 24];
			}
			else
			{
				[keyData setLength: 32];
			}
			
			break;
		}
			
		case kCCAlgorithmDES:
		{
			[keyData setLength: 8];
			break;
		}
			
		case kCCAlgorithm3DES:
		{
			[keyData setLength: 24];
			break;
		}
			
		case kCCAlgorithmCAST:
		{
			if (keyLength <= 5)
			{
				[keyData setLength: 5];
			}
			else if (keyLength >= 16)
			{
				[keyData setLength: 16];
			}
			
			break;
		}
			
		case kCCAlgorithmRC4:
		{
			if (keyLength >= 512)
				[keyData setLength: 512];
			break;
		}
			
		default:
			break;
	}
	
	[ivData setLength: [keyData length]];
}

#pragma mark -
#pragma mark Hex Convert
+ (NSString *)hexStringForData:(NSData *)data
{
    if (data == nil)
    {
        return nil;
    }
    
    NSMutableString *hexString = [NSMutableString string];
    
    const unsigned char *p = [data bytes];
    
    for (int i=0; i < [data length]; i++) 
    {
        [hexString appendFormat:@"%02x", *p++];
    }
    
    return [hexString uppercaseString];
}

+ (NSData *)dataForHexString:(NSString *)hexString
{
    if (hexString == nil)
    {
        return nil;
    }
    
    const char* ch = [[hexString lowercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* data = [NSMutableData data];
    while (*ch) 
    {
        char byte = 0;
        if ('0' <= *ch && *ch <= '9') 
        {
            byte = *ch - '0';
        }
        else if ('a' <= *ch && *ch <= 'f') 
        {
            byte = *ch - 'a' + 10;
        }
        ch++;
        byte = byte << 4;
        if (*ch) 
        {
            if ('0' <= *ch && *ch <= '9') 
            {
                byte += *ch - '0';
            } else if ('a' <= *ch && *ch <= 'f') 
            {
                byte += *ch - 'a' + 10;
            }
            ch++;
        }
        
        [data appendBytes:&byte length:1];
    }
    
    return data;
}

@end


