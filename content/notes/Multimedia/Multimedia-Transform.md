---
title: 多媒体转换
author: [Zangwei Zheng]
date: 2020-02-28
CJKmainfont: STSong
---

## 视频

### ffmpeg

- ffmpeg -formats 查看支持容器
- ffmpeg -codec 查看支持编码
- ffmpeg -encoders 查看编码器
- ffmpeg -hide_banner

| 参数                                        | 效果                                         |
| ------------------------------------------- | -------------------------------------------- |
| -i                                          | 输入文件                                     |
| -c copy                                     | 直接复制                                     |
| -c:v libx264                                | 视频编码器                                   |
| -c:a acc                                    | 音频编码器                                   |
| -an                                         | 去除音频流                                   |
| -vn                                         | 去除视频流                                   |
| -preset                                     | ultrafast, superfast, medium, slow, veryslow |
| -y                                          | 覆盖同名                                     |
| -vf scale=480:-1                            | 分辨率                                       |
| -ss 00:01:24 -t 00:00:01                    | 裁剪一秒视频                                 |
| -ss 01:02:03 -vframes 1 -q:v 2              | 截取一帧，质量为 2                           |
| -loop 1 -shortest                           | 音频文件化为带封面的视频                     |
| -r 24                                       | 强制帧数                                     |
| -b:v 64k                                    | 输出文件比特率（缺省 200kb/s）               |
| -minrate 964K -maxrate 3856K -bufsize 2000K | 码率调整                                     |

- 普屏4:3：320*240 640*480 
- 宽屏16:9：480*272 640*360 672*378 720*480 1024*600 1280*720 1920*1080 
- 获取封面：ffmpeg -ss 00:00:10 -i test1.flv -f image2 -y test1.jpg

## 音频

- XLD：转换无损音乐到 itunes 支持的音乐
  - `xld -f mp3 -o output.mp3 file.flac`

## 文字

### iconv

编码方式转换
  
- `iconv -f GBK -t utf-8 -o out.txt in.txt`
- `iconv -l`

### pandoc

- 查看默认目录 .pandoc
- `pandoc in.md --self-contained -c style.css -o out.html`
- `pandoc in.md -o out.pdf --pdf-engine=xelatex -V mainfont=SimSun`
- `pandoc in.md -o out.pdf --template=pm-template.latex --pdf-engine=xelatex`
- `pandoc in.md -o out.docx/tex/pptx`
- `pandoc --list-input-formats`
- `pandoc --list-highlight-languages`
- `-s` 生成单个文件（而非片段）
- `--toc` 生成目录

## 图片

- sips
- iconutil