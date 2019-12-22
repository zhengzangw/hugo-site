---
title: List of RSS resource
date: 2018-02-25
tags: [rss, tutor]
---

# RSS Resource

## 订阅

* [rss订阅源推荐个人收集](http://blog.csdn.net/dll635281462/article/details/51201490)
* [知乎](https://www.zhihu.com/question/19580096)

## 制作

[Feed43](http://feed43.com)

github:直接搜索 `https://github.com/username`

<!--more-->

## 利用别人的轮子

* 订阅 Bilibili up 主和番剧：[DIYGod](https://diygod.me/3264/)
* 订阅微博：[DIYGod](https://github.com/DIYgod/Weibo2RSS)
* 订阅知乎专栏：[lilydjwg](https://rss.lilydjwg.me/)
* 订阅 V2EX：[lilydjwg](https://rss.lilydjwg.me/)
* [参考资料](https://sspai.com/post/42401)

## 我造的几个源

* NJU教务——公告通知：`https://feed43.com/njujwnews.xml`
* 傅忠的小百合博客：`https://feed43.com/fzxbbs.xml`
* 南京大学官网新闻：`http://feed43.com/njunews.xml`
* 南京大学国际合作与交流处通知通告：`http://feed43.com/stuex.xml`
* 南大计科新闻：`http://feed43.com/njucsnews.xml`
* xclient讯息：`http://feed43.com/xclientnews.xml`
* 问求作业：`https://feed43.com/problemsolving_2.xml`

## 利用Applescript快速添加

适合知乎和b站：

```applescript
tell application "Safari"
set theURL to URL of front document
if theURL contains "space.bilibili.com" then
    do shell script "echo " & theURL & "|egrep -o '[0-9]{6,9}'"
    set rssURL to "https://api.prprpr.me/bilibili2rss/user/" & result as string
end if
if theURL contains "bangumi.bilibili.com" then
    do shell script "echo " & theURL & "|egrep -o '[0-9]{4,9}'"
    set rssURL to "https://api.prprpr.me/bilibili2rss/bangumi/" & result as string
end if
if theURL contains "zhuanlan.zhihu.com" then
    do shell script "echo " & theURL & "|egrep -o '[a-z]*$'"
    set rssURL to "https://rss.lilydjwg.me/zhihuzhuanlan/" & result as string
end if
if theURL contains "www.zhihu.com/people/" then
    do shell script "echo " & theURL & "|egrep -o '[a-z]*/[a-z]*$' | egrep -o '^[a-z]*'"
    set rssURL to "https://rss.lilydjwg.me/zhihu/" & result as string
end if
set the clipboard to rssURL
end tell
```