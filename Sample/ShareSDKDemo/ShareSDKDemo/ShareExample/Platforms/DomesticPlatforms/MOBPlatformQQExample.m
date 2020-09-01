//
//  MOBPlatformQQExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.

//  文档地址: https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformQQExample.h"

@implementation MOBPlatformQQExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeQQFriend;
}

- (void)setup{
    
    // QQ 新增了二维码授权,QQAuthType授权类型 @0(优先客户端授权，未安装客户端进行web授权)、@1(优先客户端授权，未安装客户端进行二维码授权)
       // QQ 新增强制网页或二维码授权,QQForceWebLogin @1(强制根据QQAuthType进行 web授权或二维码授权)
       // 可不设置，默认为 @"QQAuthType":@(0),@"QQForceWebLogin"=@(0)
//    [self setAuthSetting:@{@"QQAuthType":@(0), @"QQForceWebLogin":@0}];
    
    
    self.authHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
        NSLog(@"授权结果:  %@", user.dictionaryValue?:error);
    };
    
    self.shareHandler = ^(SSDKResponseState state, NSDictionary * _Nonnull userData, SSDKContentEntity * _Nonnull contentEntity, NSError * _Nonnull error) {
        NSLog(@"分享结果回调: %@", userData);
    };
}

- (void)shareText{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupQQParamsByText:SHARESDKDEMO_TEXT
                                  title:nil
                                    url:nil
                          audioFlashURL:nil
                          videoFlashURL:nil
                             thumbImage:nil
                                 images:nil
                                   type:SSDKContentTypeText
                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}

- (void)shareImage{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]//SHARESDKDEMO_IMAGE_STRING //[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //    [parameters SSDKEnableExtensionShare];
    
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK"
    //                                  title:nil
    //                                    url:nil
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   type:SSDKContentTypeImage
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}


- (void)shareLink{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //通用参数设置
    
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_STRING
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    
    
    
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
    //                                  title:@"Share SDK"
    //                                    url:[NSURL URLWithString:@"https://www.mob.com"]
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   type:SSDKContentTypeWebPage
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}

- (void)shareAudio{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //    //通用参数设置
    //    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
    //                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
    //                                     title:@"Share SDK"
    //                                      type:SSDKContentTypeAudio];
    
    //平台定制
    [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
                                  title:@"Share SDK"
                                    url:[NSURL URLWithString:@"https://i.y.qq.com/v8/playsong.html?songmid=&_wv=1&songid=4797678&source=qq&platform=1&appsongtype=1&_wv=1&appshare=iphone&type=0&media_mid=001AFWGk4MKbvX&hosteuin=owEzoivFoio5"]
                          audioFlashURL:[NSURL URLWithString:@"http://music.163.com/song/media/outer/url?id=133998.mp3"]
                          videoFlashURL:nil
                             thumbImage:nil
                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                   type:SSDKContentTypeAudio
                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
    
}



//网络视频
- (void)shareVideo{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //通用参数设置
    //    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
    //                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
    //                                       url:[NSURL URLWithString:@"http://www.mob.com"]
    //                                     title:SHARESDKDEMO_TITLE
    //                                      type:SSDKContentTypeVideo];
    
    //平台定制
    [parameters SSDKSetupQQParamsByText:SHARESDKDEMO_TEXT
                                  title:SHARESDKDEMO_TITLE
                                    url:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                          audioFlashURL:nil
                          videoFlashURL:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                             thumbImage:nil
                                 images:SHARESDKDEMO_IMAGE_LOCALPATH
                                   type:SSDKContentTypeVideo
                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}

- (void)shareMiniProgram{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupQQMiniProgramShareParamsByTitle:SHARESDKDEMO_TITLE
                                             description:SHARESDKDEMO_TEXT
                                              webpageUrl:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                                            hdThumbImage:@"http://yjmf.bs2dl.yy.com/NzFmYzRiMjUtZjYzMS00ZjEwLWExZTUtMTYyYWJiMWMyNmM5.jpg"//SHARESDKDEMO_IMAGE_LOCALPATH
                                               miniAppID:@"1109762672"
                                                miniPath:@"pages/index/index"
                                          miniWebpageUrl:@"www.qq.com"
                                         miniProgramType:3
                                      forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    [self shareWithParameters:parameters];
}





@end
