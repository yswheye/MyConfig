##我的开发总结
####网络请求部分
* Rxjava + Retrofit

####图片加载
* Glide
* //picasso
* //fresco

####数据库
* //greenDao(ORM)
* //Afinal
* //Litepal
* LiteOrm还算比较好用
* //Realm是一个可以替代Sqlite以及ORMlibraries的轻量级数据库，相比SQLite，Realm更快并且具有很多现代数据库的特性，比如支持JSON，流式api，数据变更通知，以及加密支持，这些都为安卓开发者带来了方便。

####UI
* XRecylerView，下拉刷新，加载更多

####Log
* Logger https://github.com/orhanobut/logger

####视频播放器
* GSYVideoPlayer https://github.com/CarGuo/GSYVideoPlayer   
基于Bilibili/ijkplayer
Android/iOS video player based on FFmpeg n3.2, with MediaCodec, VideoToolbox support.
支持弹幕 https://github.com/Bilibili/DanmakuFlameMaster
播放本地视频比较流畅

####图片压缩
* TinyPNG：TinyPNG – Compress PNG images while preserving transparency ，支持对 PNG/JPEG 文件做压缩处理，效果不错  https://tinypng.com/
* pngquant：pngquant - lossy PNG compressor ， 支持 PNG 压缩，有时候 TinyPNG 处理过的图片噪点会稍多，可以考虑用 pngquant 来处理。
命令行工具，brew install pngquant.
* ImageOptim：better Save for Web ，支持压缩 PNG/JPEG/GIF ，而且效果显著。
mac 客户端https://imageoptim.com/mac
* WebP

####Android快速编译方案
* Alibaba freeline
通过插件自动导包
先进行全量编译 python freeline.py -f
之后可以增量编译 python freeline.py
1. 确定FreelineCore.init(this);加入到Application类中，且在onCreate()下的第一行，不要根据是否在主进程做特殊处理，否则可能导致FreelineService无法正常启动；[Freeline 0.7.0+开始，默认开启了Application替换，这条可以不用检查]
2. 确定FreelineService以及freeline相关组件是否正常merge到最终的minifest中，最终的manifest路径在${module}/build/intermediates/manifests中；
3. 确定python freeline.py -v与定义在build.gradle中的freeline的版本是否一致；
4. 确定是否刚刚执行了清空app数据的操作，freeline缓存数据在/data/data路径，清空app数据也会导致连接不上的问题（执行freeline命令时，通常会有句明显的日志反复出现：server result is -1）；
5. 确定是否开启了网络代理导致127.0.0.1被重定向？
6. 一定要先使用freeline来打全量包，再来进行增量，否则也会出现这个问题。即，freeline的全量编译与android-studio自带的RUN会存在冲突。
* Facebook Buck