
// 91去除非UTF-8编码




- (NSData *)replaceNoUtf8:(NSData *)data
{
    char aa[] = {'A','A','A','A','A','A'};                      //utf8最多6个字符，当前方法未使用
    NSMutableData *md = [NSMutableData dataWithData:data];
    int loc = 0;
    while(loc < [md length])
    {
        char buffer;
        [md getBytes:&buffer range:NSMakeRange(loc, 1)];
        if((buffer & 0x80) == 0)
        {
            loc++;
            continue;
        }
        else if((buffer & 0xE0) == 0xC0)
        {
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                continue;
            }
            loc--;
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
        else if((buffer & 0xF0) == 0xE0)
        {
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                [md getBytes:&buffer range:NSMakeRange(loc, 1)];
                if((buffer & 0xC0) == 0x80)
                {
                    loc++;
                    continue;
                }
                loc--;
            }
            loc--;
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
        else
        {
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
    }
    
    return md;
}


//netManger

//常量文件
#import <UIKit/UIKit.h>


UIKIT_EXTERN NSString *const HB_RecommendURL;

#import <UIKit/UIKit.h>


NSString *const HB_RecommendURL = @"http://123.57.45.74/feiybg1/public/index.php/api/Team/retrieve_team";

// 网络访问工具
#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, HBNetworkMethod)
{
    Get = 0,
    Post,
    Put,
    Delete,
    Post_Mulit
    
};



@interface HBNetwork : AFHTTPSessionManager

+ (instancetype)sharedManager;


- (void)requestJsonDataWithPath:(NSString *)aPath withParams:(NSDictionary *)params withMethodType:(HBNetworkMethod)method andBlock:(void(^)(id data, NSError *error))block;


@end
#import "HBNetwork.h"

@implementation HBNetwork

static HBNetwork *shareManager = nil;
static dispatch_once_t onceToken;

+ (instancetype)sharedManager
{
    dispatch_once(&onceToken, ^{
        shareManager = [[HBNetwork alloc]initWithBaseURL:nil];
        
    });
    
    return shareManager;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    //[self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
    [self.requestSerializer setValue:@"Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; U8860 Build/HuaweiU8860) UC AppleWebKit/530+ (KHTML, like Gecko) Mobile Safari/530 " forHTTPHeaderField:@"User-Agent"];
    [self.requestSerializer setValue:@"zh-CN,zh;q=0.8,en;q=0.6" forHTTPHeaderField:@"Accept-Language"];
    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}


- (void)requestJsonDataWithPath:(NSString*)aPath withParams:(NSDictionary *)params withMethodType:(HBNetworkMethod)method andBlock:(void (^)(id data, NSError *error))block
{
    if (!aPath || aPath.length <= 0) {
        return;
    }
    
    
    switch (method) {
        case Get:{
            [self GET:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                block(responseObject,nil);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                block(nil,error);
                
            }];
        }
            
            break;
            
        case Post:{
            [self POST:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                block(responseObject,nil);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                block(nil,error);
                
            }];
        }
            
            break;
            
        default:
            break;
    }
    
}
@end



// apiManger

#import <Foundation/Foundation.h>

@interface HBAPIManger : NSObject


+ (instancetype)sharedManager;
- (void)post_recommend:(void(^)(id data, NSError *error))block;
@end

#import "HBAPIManger.h"
#import "HBNetwork.h"
#import "HBConst.h"
#import "HBRecommendModel.h"
#import "MJExtension.h"

@implementation HBAPIManger

+ (instancetype)sharedManager
{
    static HBAPIManger *shared_manager = nil;
    
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shared_manager = [[self alloc]init];
    });
    return shared_manager;
    
}

- (void)post_recommend:(void (^)(id, NSError *))block
{
    NSDictionary *params = @{@"recommended_team" : @"1" };
    
    [[HBNetwork sharedManager] requestJsonDataWithPath:@"http://91porn.com/video.php?category=rf&page=3" withParams:nil withMethodType:Get andBlock:^(id data, NSError *error) {
        
        if (data) {
            
            //NSArray *array = [HBRecommendModel mj_objectArrayWithKeyValuesArray:data[@"info"]];
            
            block(data, nil);
        } else {
            block(nil,error);
        }
        
    }];
}

@end
