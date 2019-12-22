---
title: 利用hexo搭建我的博客
date: 2018-01-20 14:50:22
tags: [config]
---

## Hexo

### 参考资料

* [HEXO+Github,搭建属于自己的博客][tutor]

### 主题

* [next 7][next]
  * tags 启用
  * math 启用，且 per page: false
    * 修改 kramed 部分内容
  * 使用双栏 scheme
* [yilia][yilia]

<!--more-->

### 插件

* hexo-asset-image
* hexo-deployer-git
* hexo-generator-feed
* hexo-generator-cname
* hexo-generator-tag
* hexo-renderer-kramed
* -hexo-tag-dplayer
* -hexo-pdf

### 发布文章

* hexo new "name"
* hexo g && hexo d

## Jupyter Notebook 转 markdown

    ipython nbconvert --to markdown *.ipynb

## Markdown 语法

### 锚点

[回到顶部](#参考资料)

### 复选框

* [x] 选项1
* [ ] 选项2
* [ ] 选项3

## diff 语法

```diff
+ hexo and markdown
- hexo
```

## 插入图片

* 使用路径 `/images/***.png` (有问题，未解决)

* 使用网络地址 `https://blog.zhengzangw.com/images/***.png`

[![NJUlogo](https://blog.zhengzangw.com/images/general/njuicon.png)](www.njujb.com)

## 插入音乐

在网易云音乐网页版获取连接，auto=1 自动播放

<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=298 height=52 src="//music.163.com/outchain/player?type=2&id=22677433&auto=1&height=32"></iframe>

## 插入视频

gif  
![test gif](https://blog.zhengzangw.com/images/gif/dcproject-1.gif)

## 链接pdf

[Example pdf](/pdfs/Interactive-Mobile-Gamepad-Based-on-Neutral-Network.pdf)

## 字体

    单行
> 块
> > 再缩进

*斜体*
__粗体__
~~删除~~
***~~全部~~***

## 致谢

感谢杜xl,裴yf,吕yz的帮助！于此我开始了计科的生活记录。

[yilia]:https://github.com/litten/hexo-theme-yilia
[next]:https://github.com/theme-next/hexo-theme-next
[tutor]:https://www.jianshu.com/p/465830080ea9