Pod::Spec.new do |s|
  s.name             = 'mob_sharesdk'
  s.version          = "4.4.2"
  s.summary          = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
  s.license          = 'MIT'
  s.author           = { "mob" => "mobproducts@163.com" }

  s.homepage         = 'http://www.mob.com'

  s.source           = { :http => 'https://dev.ios.mob.com/files/download/sharesdk/ShareSDK_For_iOS_v4.4.2.zip' }

  s.platform         = :ios
  s.ios.deployment_target = "8.0"
  s.frameworks       = 'JavaScriptCore'
  s.libraries        = 'sqlite3'
  s.default_subspecs = 'ShareSDK'
  s.static_framework = true
  s.dependency 'MOBFoundation','>= 3.2.9'
  

  # 核心模块
    s.subspec 'ShareSDK' do |sp|
        sp.vendored_frameworks = 'ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework'
        sp.source_files = 'ShareSDK/ShareSDK.framework/Headers/**/*'
        sp.resource_bundles = {
           'ShareSDK' => ['ShareSDK/Support/Required/ShareSDK.bundle/*.lproj','ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/*.js']
        }
    end

    # 各个平台：每个平台都必须要有ShareSDK.bundle和对应的Connector
    s.subspec 'ShareSDKPlatforms' do |sp|

        # QQ
        sp.subspec 'QQ' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenAPI.framework','ShareSDK/Support/PlatformConnector/QQConnector.framework'
            ssp.libraries = 'sqlite3'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_QQ' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/QQ.js']
            }
        end

        # QQ 精简版
        sp.subspec 'QQ_Lite' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/QQConnector.framework'
            ssp.libraries = 'sqlite3'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_QQ' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/QQ.js']
            }
        end

        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
            ssp.vendored_libraries = 'ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.a'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/SinaWeiboSDK/WeiboSDK.bundle'
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework'
            ssp.frameworks = 'ImageIO'
            ssp.libraries = 'sqlite3'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.{h,m}"
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.h"
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_SinaWeibo' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/SinaWeibo.js']
            }
        end

        # SinaWeibo 精简版
        sp.subspec 'SinaWeibo_Lite' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework'
            ssp.frameworks = 'ImageIO'
            ssp.libraries = 'sqlite3'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_SinaWeibo' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/SinaWeibo.js']
            }
        end

        #WeChat
        sp.subspec 'WeChat' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WechatConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.h"
            ssp.libraries = 'sqlite3'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_WeChat' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/WeChat.js']
            }
        end

        #WeChatFull
        sp.subspec 'WeChatFull' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WechatConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.h"
            ssp.libraries = 'sqlite3'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_WeChat' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/WeChat.js']
            }
        end

        # WeChat 精简版
        sp.subspec 'WeChat_Lite' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WechatConnector.framework'
            ssp.libraries = 'sqlite3'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_WeChat' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/WeChat.js']
            }
        end


        # 支付宝（AliSocial）
        sp.subspec 'AliPaySocial' do |ssp|
            ssp.vendored_libraries = 'ShareSDK/Support/PlatformSDK/APSocialSDK/*.a'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/AliSocialConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.h"
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_AliSocial' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/AliSocial.js']
            }
        end

        # Kakao
        sp.subspec 'Kakao' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoOpenSDK.framework','ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoCommon.framework','ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoLink.framework','ShareSDK/Support/PlatformConnector/KakaoConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_KaKao' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/KaKao.js']
            }
        end

        # Yixin
        sp.subspec 'Yixin' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/EasyChatConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.h"
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_EasyChat' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/EasyChat.js']
            }
        end

        # Facebook
        sp.subspec 'Facebook' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/FacebookConnector.framework','ShareSDK/Support/PlatformSDK/FacebookSDK/FBSDKLoginKit.framework','ShareSDK/Support/PlatformSDK/FacebookSDK/FBSDKCoreKit.framework','ShareSDK/Support/PlatformSDK/FacebookSDK/FBSDKShareKit.framework'
            ssp.library = 'c++', 'stdc++','z'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/FacebookSDK/FacebookSDKStrings.bundle'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.ios.weak_framework = 'Accelerate', 'Accounts', 'CoreLocation', 'Social', 'Security', 'QuartzCore', 'CoreGraphics', 'UIKit', 'AudioToolbox','AuthenticationServices','SafariServices','CoreServices'
            ssp.resource_bundles = {
                'ShareSDK_JS_Facebook' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Facebook.js']
            }
        end
        
        # Facebook 精简版
        sp.subspec 'Facebook_Lite' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/FacebookConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.ios.weak_framework  = 'AuthenticationServices','SafariServices','Accelerate','CoreServices'
            ssp.resource_bundles = {
                'ShareSDK_JS_Facebook' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Facebook.js']
            }
        end

        # Messenger
        sp.subspec 'Messenger' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/FacebookMessengerConnector.framework','ShareSDK/Support/PlatformSDK/FacebookSDK/FBSDKLoginKit.framework','ShareSDK/Support/PlatformSDK/FacebookSDK/FBSDKCoreKit.framework','ShareSDK/Support/PlatformSDK/FacebookSDK/FBSDKShareKit.framework'
            ssp.library = 'c++', 'stdc++','z'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/FacebookSDK/FacebookSDKStrings.bundle'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.ios.weak_framework = 'Accelerate', 'Accounts', 'CoreLocation', 'Social', 'Security', 'QuartzCore', 'CoreGraphics', 'UIKit', 'AudioToolbox','AuthenticationServices','SafariServices','CoreServices'
            ssp.resource_bundles = {
                'ShareSDK_JS_FacebookMessenger' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/FacebookMessenger.js']
            }
        end

        # Copy
        sp.subspec 'Copy' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/CopyConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Copy' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Copy.js']
            }
        end

        # Evernote
        sp.subspec 'Evernote' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/EvernoteConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Evernote' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Evernote.js']
            }
        end

        # GooglePlus
        sp.subspec 'GooglePlus' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/GooglePlusConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_GooglePlus' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/GooglePlus.js']
            }
        end

        # Instagram
        sp.subspec 'Instagram' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstagramConnector.framework'
            ssp.frameworks = 'AssetsLibrary','Photos'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Instagram' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Instagram.js']
            }
        end

        # Instapaper
        sp.subspec 'Instapaper' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstapaperConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Instapaper' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Instapaper.js']
            }
        end

        # Line
        sp.subspec 'Line' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/LineSDK/LineSDK.framework','ShareSDK/Support/PlatformConnector/LineConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/LineSDK/LineSDKResource.bundle'
            ssp.resource_bundles = {
                'ShareSDK_JS_Line' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Line.js']
            }
        end

        # Mail
        sp.subspec 'Mail' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/MailConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Mail' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Mail.js']
            }
        end

        # SMS
        sp.subspec 'SMS' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SMSConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_SMS' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/SMS.js']
            }
        end

        # WhatsApp
        sp.subspec 'WhatsApp' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WhatsAppConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_WhatsApp' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/WhatsApp.js']
            }
        end

        # YouTube
        sp.subspec 'YouTube' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/YouTubeConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_YouTube' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/YouTube.js']
            }
        end

        # Twitter
        sp.subspec 'Twitter' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TwitterConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Twitter' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Twitter.js']
            }
        end

        # Dropbox
        sp.subspec 'Dropbox' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/DropboxConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Dropbox' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Dropbox.js']
            }
        end

        # DingTalk
        sp.subspec 'DingTalk' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/DingTalkSDK/DTShareKit.framework','ShareSDK/Support/PlatformConnector/DingTalkConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_DingTalk' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/DingTalk.js']
            }
        end

        # Telegram
            sp.subspec 'Telegram' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TelegramConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Telegram' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Telegram.js']
            }
        end

        # Reddit
        sp.subspec 'Reddit' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/RedditConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Reddit' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Reddit.js']
            }
        end

        # Flickr
        sp.subspec 'Flickr' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/FlickrConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Flickr' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Flickr.js']
            }
        end

        # KaiXin
        sp.subspec 'KaiXin' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/KaiXinConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_KaiXin' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/KaiXin.js']
            }
        end

        # LinkedIn
        sp.subspec 'LinkedIn' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/LinkedInConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_LinkedIn' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/LinkedIn.js']
            }
        end

        # MingDao
        sp.subspec 'MingDao' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/MingDaoConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_MingDao' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/MingDao.js']
            }
        end

        # Pinterest
        sp.subspec 'Pinterest' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/PinterestConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Pinterest' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Pinterest.js']
            }
        end

        # Pocket
        sp.subspec 'Pocket' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/PocketConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Pocket' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Pocket.js']
            }
        end

        # Print
        sp.subspec 'Print' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/PrintConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Print' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Print.js']
            }
        end

        # Tumblr
        sp.subspec 'Tumblr' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TumblrConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Tumblr' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Tumblr.js']
            }
        end

        # VKontakte
        sp.subspec 'VKontakte' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/VKontakteConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_VKontakte' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/VKontakte.js']
            }
        end

        # YouDaoNote
        sp.subspec 'YouDaoNote' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/YouDaoNoteConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_YouDaoNote' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/YouDaoNote.js']
            }
        end

        # FacebookAccount
        sp.subspec 'FacebookAccount' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/FacebookAccountSDK/AccountKit.framework','ShareSDK/Support/PlatformConnector/FacebookAccountConnector.framework'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/FacebookAccountSDK/AccountKitStrings.bundle'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_FacebookAccount' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/FacebookAccount.js']
            }
        end

        # Douyin(抖音)
        sp.subspec 'Douyin' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/DouyinOpenSDK/DouyinOpenSDK.framework','ShareSDK/Support/PlatformConnector/DouyinConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_Douyin' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/Douyin.js']
            }
        end
        
        # TikTok(TikTok)
        sp.subspec 'TikTok' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/TikTokSDK/TikTokOpenSDK.framework','ShareSDK/Support/PlatformConnector/TikTokConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_TikTok' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/TikTok.js']
            }
        end

        # WeWork(企业微信)
        sp.subspec 'WeWork' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/WXWorkSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/WXWorkSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WeworkConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/WXWorkSDK/*.h"
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_WeWork' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/WeWork.js']
            }
        end
        # Apple
        sp.subspec 'Apple' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/AppleAccountConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.weak_framework = 'AuthenticationServices'
        end
        
        # Osis(绿洲)
        sp.subspec 'Oasis' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/OasisConnector.framework','ShareSDK/Support/PlatformSDK/OasisSDK/OasisSDK.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
        end
        
        # SnapChat
        sp.subspec 'SnapChat' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SnapChatConnector.framework','ShareSDK/Support/PlatformSDK/SnapChat/SCSDKLoginKit.framework','ShareSDK/Support/PlatformSDK/SnapChat/SCSDKCoreKit.framework','ShareSDK/Support/PlatformSDK/SnapChat/SCSDKCreativeKit.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
        end
        
        # KuaiShou(快手)
        sp.subspec 'KuaiShou' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/KuaiShouConnector.framework','ShareSDK/Support/PlatformSDK/KwaiSDKLibrary/KwaiSDK.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_KuaiShou' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/KuaiShou.js']
            }
        end
        
        # KuaiShou(快手) 精简版
        sp.subspec 'KuaiShou_Lite' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/KuaiShouConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_KuaiShou' => ['ShareSDK/Support/Required/ShareSDK.bundle/ScriptCore/platforms/KuaiShou.js']
            }
        end
        
        # WatermelonVideo
        sp.subspec 'WatermelonVideo' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WatermelonVideoConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
        end
    end

    # ShareSDK 配置文件模块
    s.subspec 'ShareSDKConfigFile' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKConfigFile.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKConfigFile.bundle'
        sp.dependency 'mob_sharesdk/ShareSDK'
    end
    
    # ShareSDK Extension扩展模块
    s.subspec 'ShareSDKExtension' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKExtension.framework'
        sp.dependency 'mob_sharesdk/ShareSDK'
    end

    # ShareSDK提供的UI
    s.subspec 'ShareSDKUI' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKUI.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKUI.bundle'
        sp.dependency 'mob_sharesdk/ShareSDK'
    end

    # ShareSDK提供闭环分享场景还原
    s.subspec 'ShareSDKRestoreScene' do |sp|
        sp.dependency 'mob_sharesdk/ShareSDKExtension'
        sp.vendored_frameworks = "ShareSDK/Support/Optional/ShareSDKLink.framework"
    end
end
