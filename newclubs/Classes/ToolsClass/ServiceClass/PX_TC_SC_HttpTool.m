

//
//  PX_TC_SC_HttpTool.m
//  newclubs
//
//  Created by a on 2018/5/24.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_TC_SC_HttpTool.h"

static NSString * kBaseUrl = @"";

@interface AFHttpClient : AFHTTPSessionManager
+ (instancetype)sharedClient;

@end

@implementation AFHttpClient

+ (instancetype)sharedClient {
    
    static AFHttpClient * client = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        client = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:configuration];
        //接收参数类型
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
        //设置超时时间
        client.requestSerializer.timeoutInterval = 15;
        //安全策略
        client.securityPolicy = [AFSecurityPolicy defaultPolicy];
        // 设置请求格式
        client.requestSerializer = [AFJSONRequestSerializer serializer];
      
        NSString *authorization =  [NSString stringWithFormat:@"%@ %@",@"Bearer",[PX_UserDefaults objectForKey:@"token"]];
        [client.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
        [client.requestSerializer setValue:@"device-uuihhhhd1111hhhhhhh" forHTTPHeaderField:@"device-uuid"];
        [client.requestSerializer setValue:@"user-agent" forHTTPHeaderField:@"user-agent"];
        
    });
    
    return client;
}

@end


@implementation PX_TC_SC_HttpTool
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure {
    //获取完整的url路径
    NSString * url = [kBaseUrl stringByAppendingPathComponent:path];
    
    [[AFHttpClient sharedClient] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure {
    
    //获取完整的url路径
    NSString * url = [kBaseUrl stringByAppendingPathComponent:path];
    
    [[AFHttpClient sharedClient] POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

+ (void)downloadWithPath:(NSString *)path
                 success:(HttpSuccessBlock)success
                 failure:(HttpFailureBlock)failure
                progress:(HttpDownloadProgressBlock)progress {
    
    //获取完整的url路径
    NSString * urlString = [kBaseUrl stringByAppendingPathComponent:path];
    
    //下载
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [[AFHttpClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progress(downloadProgress.fractionCompleted);
        
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        //获取沙盒cache路径
        NSURL * documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            failure(error);
        } else {
            success(filePath.path);
        }
        
    }];
    
    [downloadTask resume];
    
}

+ (void)uploadImageWithPath:(NSString *)path
                     params:(NSDictionary *)params
                  thumbName:(NSString *)imagekey
                      image:(UIImage *)image
                    success:(HttpSuccessBlock)success
                    failure:(HttpFailureBlock)failure
                   progress:(HttpUploadProgressBlock)progress {
    
    //获取完整的url路径
    NSString * urlString = [kBaseUrl stringByAppendingPathComponent:path];
    
    NSData * data = UIImagePNGRepresentation(image);
    
    [[AFHttpClient sharedClient] POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data name:imagekey fileName:@"01.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


+ (void)httpManagerNetworkReachabilityManageWithBlock:(nullable void (^)(AFNetworkReachabilityStatus status))block{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:block];
 
    
}
+ (void)httpManagerNetworkReachabilityManage {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        PX_ApplicationDelegate.reachabilityStatus = status;
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable: {
                NSLog(@"无网络");
                whetherHaveNetwork = YES;
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                whetherHaveNetwork = NO;
                NSLog(@"WiFi网络");
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                whetherHaveNetwork = NO;
                NSLog(@"无线网络");
                break;
            }
                
            default:
                NSLog(@"不明网络");
                whetherHaveNetwork = NO;
                break;
        }
    }];
    
}
@end
