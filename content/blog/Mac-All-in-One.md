---
title: Mac All in One
date: 2019-03-21
---

笔者 Mac 也用了三年，一直在寻找着适合 Mac 的配置、软件。今天准备第三次重装电脑（第一次是装驱动坏了返厂重修，第二次和这次一样，来个大整理）。希望这次重装后，能达到以下效果：

- 进一步加强文件管理，多用软件管理而非原生目录
- 奥卡姆剃刀：如无必要，勿增实体
- 在电脑上完成一整套学习和工作的工作流（Workflow）
- 配置可复现化（降低 macos 新系统配置代价）

希望这次重装后，我的整个工作环境能够稳定下来。本博客希望传递的知识是

- 让你知道，关于 Mac 你还有不知道的东西

而不是

- 让你知道，关于 Mac 你知道的东西怎么做

在开始重装前，先介绍一下我为 mac 配的外设和硬件：

- 扩展坞/转接口：注意如果是金属的可能会影响 wifi 信号
- 键盘 + 屏幕保护膜：后悔买迟了
- 背面贴纸：没贴
- magic mouse：不怎么用，主要还是触控板
- 1T 移动固态：电脑 500G 也不够用了。机械暂时不知道放哪合适

我们以重装的流程，组织介绍的顺序。在备份资料后，我们首先要做一下几部

- 保存主目录下的 `.` 文件（GNU stow），以方便快捷导出
- 记录 brew 下载的应用

# Developer's Tools

## IDE

```diff
Xcode
vscode: Main Code Editor
Anaconda: Python
PyCharm CE: Python
Sagemath: sage
IntelliJ IDEA CE: Java
Android Studio
MATLAB R2019a: Matlab
script editor: (native) Apple Script
Qt Series: Qt

- CocosCreator: 游戏引擎，基于 cocos
- Orange3: 快速测试 ML 算法
- Ecllipse: Java, 选择 IntelliJ 替代
- CLion: C++, 选择终端命令执行
- Visual Studio: C#
- CodeRunner: multi language
- DataGrip: SQL
- Mathematica: Mathematica
```

<!--more-->

## Virtural Machine

```diff
virtualbox
docker

- Parallels Desktop
```

## Network

```diff
wireshark: catch packages

- Charles: catch packages
- WiFi Explorer: Analyse Wifi
- Microsoft Remote Desktop
```

## Terminal

```diff
terminal
iTerm
```

## Auxiliary Tools

```diff
Dash: documents
sequal pro: SQL
+ Dropdmg
+ VNC Viewer
+ VNC Server

- Gitkraken: github
- SPSS: for data analysis
- MAMP PRO: mysql&php setup
- XQuartz: Necessary for desktop remote link
```

# Designer's Tools

## Text&Color

```diff
colorwell: color
HelloFont: font Management
Font Books

- RightFont: manage font
```

## Image

```diff
Photoshop: Picture Design
MediBangPaintPro: Draw
Photos
Wix Photo Albums
snipaste: Screenshot
paparazzi!: Webshot
+ Magicavoxel: 3D

- Polarr Photo Edit: easy photo edit
- ColorSnapper2: color
- xScope: icon design
- annotate: for screenshot
- jietu: for screenshot
- GIPHY capture: for screenshot
- LICEcap: for screen recording gif
```

## Music

```diff
Logic Pro X: Music Design
XLD: Music Conversion
+ Sibelius: 打谱

- VOCOLOID 5 Editor: Music Design
- Audition
```

## Video

```diff
+ Adobe Premiere Pro 2020
Total Video Converter Pro: Convertion
GIF Brewery
Arctime Pro: Caption
kap: Screenshot
screenflow: Screen recording and editing

- Gifrocket: for gif generation
- After Effects
```

## Text

```diff
Words
Pages
OmniGraffle: mind map
Mactex(TexShop, BibDesk, LaTeXiT, Tex Live Utility
TextEdit
+ iText: OCR

- Mweb: for markdown
- Writer Pro: for plain text
- Evernote: for note
- UltraEdit: for 16bit edit
```

## Slides

```diff
PowerPoint
+ Deckset

- Keynote
```

## Data

```diff
Excel

- Number
```

# Reader's Tools

## Reading

```diff
PDF Experts
CAJ Cloud Viewer: CAJ
+ CHM Viewer Star

- Adobe Acrobat
- Kaleidoscope: for file diff
- CHM Reader: for chm
```

## Management

```diff
+ QSpace
+ DEVONthink 3: 准备卸载
Papers
Calibre
jabref
```

# Routine

## Social Network

[QQ 助手](https://github.com/TKkk-iOSer/QQPlugin-macOS)
[微信助手](https://github.com/TKkk-iOSer/wechat-alfred-workflow)

```diff
QQ
WeChat
Reeder
Mail
zoom.us
Messages
+ Skype
+ Telegram
+ 腾讯会议
+ Gitter
+ Slack

- Tweetbot: for tweet
- AliWangwang
- Maipo
```

## Game

```diff
steam
UU booster: for steam
+ Google Earth Pro
Futu bull: stock
Electrum
cheatengine
```

## Video

```diff
ivideo: video player
Quicktime Player
IINA: video player

- VLC: video player
- youku
- aiqiyi
- 在线视频播放器: for TV
```

## Music

```diff
NeteaseMusic
QQ Music
Music
Noizio
Lyrics
```

## Surfing

```diff
Chrome

- Safari
- Firefox
```

## Download

[baidu disk plugin](https://github.com/CodeTips/BaiduNetdiskPlugin-macOS)

```diff
Transmit
Transmission
Proxyee Down
Baidu Disk
one drive
Dropbox
Downie 3
Sitesucker

- FileZilla: for ftp
- cyberduck: for ftp
- uTorrent
- Downie 3: Download video
- xiaotong: 城通云盘
- Folx
- Aria2GUI
- WebTorrent: Quick view for BT
```

## English

```diff
TPO
GPO

- EuDic: English
```

## Schedule

```diff
Reminder
Notes
Stickers
Calenders

- OmniFocus: GTD
- Fantastical 2
```

## Zip

```diff
betterzip: (un)archiver
The Unarchiver
```

# Plugins

按推荐程度排序

```diff
Alfred 4
Paste
1Password 7
Bartender 3
Mailbutler
hyperdock: preview of apps
V2rayU
Spectacle: windows layout
NewFileMenu
Mounty
+ Boom 3D
Irvue: change desktop
FreeMyDesktop
EasyConnect
+ AppCleaner
+ Timer
CheetSheet: shortcut reminder
Flux: bright adjustment
+ Yoink
+ PixelScheduler
smcFanControl
+ Karabiner: 拳皇改键
gfxCardStatus: manage graphics card
Background Music
Pock
+ context
popclip
V2rayX
ShandowsocksX-NG-R8
MurGaa Recorder
Creative Cloud
Adobe zii

- caffeine
- unetbooter: make boot disk
- Fuse
- superDuper!: for backup
- boom: Enlarge voice
- iStat Menus: System status
- Xee: View picture
- minutes: Countdown
- Multitimer: Countdown
- Tickeys: Sound
- Gemini 2: Delete duplication
- Shandowsocks R
- Manico
- Moom: windows
- youdaodict: interact with alfred3
- InsomniaX: Disable sleep
- HazeOver: Highlight current window
- Total Finder: plugins for finder
- RescueTime: Record
- BetterTouchTool: TrackPad
```

## Mobile

```diff
duet
airserver
remote for mac
splashtop streamer
air video server HD
Android File Transfer
balenaEtcher: make boot disk

- IMazing: Substitute iTunes
- Reflector 2: make mac apple TV
- 1Keyboard: make mac remote keyboard for iphone
```

# Shell

## Brew

```diff
cscope
ctags
curl
conda
+ ffmpeg
fzf
graphviz
imagemagick
macvim
mas
node
pandoc
pdftk
pstree
tesseract
tldr
tmux
tree
+ webkit2png
wget
yarn
+ you-get
zsh
```

## Native

# Drive

```diff
Wacom
Canon Utility
Epson Remote Print Utility
OpenGL Extension Viewer
```
