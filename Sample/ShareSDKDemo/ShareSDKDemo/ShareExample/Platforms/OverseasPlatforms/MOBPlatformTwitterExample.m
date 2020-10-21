//
//  MOBPlatformTwitterExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformTwitterExample.h"
#import "MOBLoadingViewController.h"
@implementation MOBPlatformTwitterExample{
    MOBLoadingViewController *loadingViewController;
}
- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBTextImageShareIcon name:@"图文" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextAndImage];
    }];
    loadingViewController = [[MOBLoadingViewController alloc] initWithNibName:@"MOBLoadingViewController" bundle:nil];
    loadingViewController.view.frame = [SSDKScenePackage mainBounds];
    [self setAuthSetting:@{@"scopes":@"read"}];
}


/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
    //    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                      images:nil
    //                                    latitude:0
    //                                   longitude:0
    //                                        type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图文
 */
- (void)shareTextAndImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[path1]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 分享单图
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //        [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                          images:path4
    //                                        latitude:0
    //                                       longitude:0
    //                                            type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 分享多图
 */
- (void)shareMutiImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1,path2,path3]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //        [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                          images:path4
    //                                        latitude:0
    //                                       longitude:0
    //                                            type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    //Twitter链接分享 卡片效果(小图、大图、视频、应用下载4种效果) 请查看官方API:https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/abouts-cards
    // 注意：如果你的链接已经根据"Twitter官方API卡片效果文档"对网址内容进行改造 以下images参数请一定设置为nil 否则展示的是内容含有链接的图片分享。
    // 如Demo地址 http://f.moblink.mob.com/twitter/bigcard/ 和 http://f.moblink.mob.com/twitter/smallcard/ 网址内容html中head已经改造过
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://tech.diary.support.mob.com/sharesdk/demo/index.html"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
//    [parameters SSDKSetupShareParamsByText:@"Share SDK"
//                                    images:nil
//                                       url:[NSURL URLWithString:@"http://f.moblink.mob.com/twitter/smallcard/"]
//                                     title:nil
//                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
    //    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                       video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
    //                                    latitude:0
    //                                   longitude:0
    //                                         tag:@"Twitter_0001"];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideoProgress
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL fileURLWithPath:filePath]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
    //    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                       video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
    //                                    latitude:0
    //                                   longitude:0
    //                                         tag:@"Twitter_0001"];
    __weak __typeof__ (self) weakSelf = self;
    loadingViewController.session = [ShareSDK share:self.platformType
                                         parameters:parameters
                                     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                                         NSString *title = @"";
                                         switch (state) {
                                             case SSDKResponseStateUpload:
                                             {
                                                 SSDKUploadState state = [userData[@"progressInfo"][@"state"] integerValue];
                                                 
                                                 switch (state)
                                                 {
                                                     case SSDKUploadStateBegin:
                                                     [weakSelf showLoading];
                                                     break;
                                                     
                                                     case SSDKUploadStateUploading:
                                                     {
                                                         unsigned long long totalBytes = [userData[@"progressInfo"][@"totalBytes"] unsignedLongLongValue];
                                                         unsigned long long loadedBytes = [userData[@"progressInfo"][@"loadedBytes"] unsignedLongLongValue];
                                                         
                                                         CGFloat temp =  loadedBytes*1.0/totalBytes;
                                                         
                                                         if(temp > loadingViewController.progressView.progress )
                                                         {
                                                             [loadingViewController.progressView setProgress:temp animated:YES];
                                                         }
                                                     }
                                                     break;
                                                     
                                                     case SSDKUploadStateFinish:
                                                     {
                                                         [loadingViewController.progressView setProgress:1 animated:YES];
                                                         [loadingViewController hidden];
                                                     }
                                                     break;
                                                     
                                                     default:
                                                     break;
                                                 }
                                                 break;
                                             }
                                             case SSDKResponseStateSuccess:
                                             {
                                                 title = @"分享成功";
                                                 break;
                                             }
                                             case SSDKResponseStateFail:
                                             {
                                                 title = @"分享失败";
                                                 NSLog(@"error :%@",error);
                                                 break;
                                             }
                                             case SSDKResponseStateCancel:
                                             {
                                                 title = @"分享已取消";
                                                 break;
                                             }
                                             default:
                                             break;
                                         }
                                         
                                         if(state != SSDKResponseStateUpload)
                                         {
                                             [loadingViewController hidden];
                                             
                                             UIAlertControllerAlertCreate(title, nil)
                                             .addCancelAction(@"确定")
                                             .present();
                                         }
                                     }];
}

-(void)showLoading
{
    [[UIApplication currentWindow] addSubview:loadingViewController.view];
    loadingViewController.view.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        loadingViewController.view.alpha = 1;
    }];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeTwitter;
}
@end
