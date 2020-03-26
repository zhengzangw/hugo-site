---
title: 19. Crawler
date: 2020-03-26
weight: 19
---

## Python

```python
import urllib
# 1
response = urllib.request.urlopen('http://python.org/')
html = response.read()
print(html.decode('utf-8'))

# 2 POST & GET
url = 'http://www.baidu.com/'
valuesPOST = {
 'user': 'name',
 'passwd': '*****'
}
data = urllib.parse.urlencode(valuesPOST).encode('utf-8')
valuesGET = {
 'verbose': 1,
 'nothing': ""
}
url = url + "?" + urllib.parse.urlencode(valuesGET)
req = urllib.request.urlopen(url, data)

# 3 Headers
headers = {
 'User-Agent' : 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
 'Referer' : 'http://www.zhihu.com/articles'
}
req = urllib.request.Request(url, data, headers, method='POST')
# method = 'GET'/'POST'/'PUT'/'DELETE'

# 4 Proxy
proxies = [
 {},
 {'http': '127.0.0.1:1188'}
]
proxy = random.choice(proxies) #import random
proxyHandler = urllib.request.ProxyHandler(proxy)
opener = urllib.request.build_opener(proxyHandler)
# Global
# urllib.request.install_opener(opener1)
opener1.open("http://www.google.com", timeout=10).read()

# 5 Debug
debugHandler = urllib.request.HTTPHandler(debuglevel=1)
opener = urllib.request.build_opener(debugHandler, proxyHandler) # Any number of handlers
opener.open(url)

# 6 Exception
req = urllib.request.Request('http://www.xNOTxEXISTxWEBx.com')
try:
 urllib.request.urlopen(req)
except urllib.error.HTTPError as e:
 print(e.code)
except urllib.error.URLError  as e:
 if hasattr(e, "reason"):
  print(e.reason)

# 7 Cookie
from http import cookiejar
cookie = cookiejar.CookieJar()
cookieHandler = urllib.request.HTTPCookieProcessor(cookie)
opener = urllib.request.build_opener(cookieHandler)
response = opener.open('http://www.baidu.com')
cookieInfo = ['Name={}, Value={}'.format(item.name, item.value) for item in cookie]
# save to file
cookie = cookiejar.MozillaCookieJar('cookies.txt') # LWPCookieJar
cookieHandler = urllib.request.HTTPCookieProcessor(cookie)
opener = urllib.request.build_opener(cookieHandler)
response = opener.open('http://www.baidu.com')
cookie.save(ignore_discard=True, ignore_expires=True)
# Load
cookie = cookiejar.MozillaCookieJar()
cookie.load('cookies.txt', ignore_expires=True, ignore_discard=True)

# 8 HTTP Auth
url = "http://www.pythonchallenge.com/pc/return/evil4.jpg"
passwdmgr = urllib.request.HTTPPasswordMgrWithDefaultRealm()
passwdmgr.add_password(None, "http://www.pythonchallenge.com", "huge", "file")
httpauth_handler = urllib.request.HTTPBasicAuthHandler(passwdmgr)
opener = urllib.request.build_opener(httpauth_handler)

# 9 Re
import re
pattern = re.compile(r'(hello)', re.I|re.U)
result = re.match(pattern, 'Hello, world!') # 判断字符串开头是否匹配，失败返回 None
result = pattern.search('Hi, Hello, world!') # 扫描整个字符串
result = re.findall(pattern, 'Hi, Hello, world!') # 扫描整个字符串,获得所有匹配，返回列表

result.group() # result.group(0), 返回挣个匹配的字符串
result.group(n) # 返回第 n 个捕获的字符串
result.groups() # 返回所有捕获的字符串
result.span() # 起止位置

pattern = re.compile(r'(\d+)(\d+)')
re.split(pattern,'one11two22three33four44') # 分割字符串
re.sub(pattern,r'\2 \1', 'one11two22three33four44') # 替换
pattern = re.compile(r'\d+')
for m in re.finditer(pattern,'one1two2three3four4'):
    print m.group()

# 10 Input
a = raw_input("input:")
# >>>input: 123
# type(a) is str
a = input("input:")
# >>>input: 123
# type(a) is int

# 11 Request GET
import requests
params = {'key1': 'value1', 'key2': 'value2'}
response = requests.get("http://httpbin.org/get", params=params, headers=headers, timeout=0.001)
# response 属性
# text, url, json()
# raw (stream=True)

# 12 Request Post
data = {'key1': 'value1', 'key2': 'value2'}
r = requests.post("http://httpbin.org/post", data=data)
# JSON 格式数据
# r = requests.post("http://httpbin.org/post", data=json.dump(data))
files = {'file': open('test.txt', 'rb')}
r = requests.post(url, files=files)

# 13 Request Cookie
print(r.cookies)
cookies = dict(cookies="working")
r = requests.get(url, cookies=cookies)

# 14 Request Session
s = requests.Session()
s.headers.update({'x-test': 'true'})
s.get('http://httpbin.org/cookies/set/sessioncookie/123456789', headers={'x-test2': 'true'})
r = s.get("http://httpbin.org/cookies")

# 15 Request ssl & proxy
r = requests.get('https://kyfw.12306.cn/otn/', verify=True, proxies=proxies)

# 16 Beautiful Soup
from bs4 import BeautifulSoup
soup = BeautifulSoup(r.text)
print(soup.prettify())
# Tag
soup.a, soup.title, soup.head # 获得第一个
soup.a.name, soup.a.attrs
# NavigableString
soup.a.string
if type(soup.a.string)==bs4.element.Comment:
    print soup.a.string

# 17 Beatififul Soup Traverse
soup.head.contents # tag 直接子节点列表
soup.head.children # tag 直接子节点 iter
soup.a.descendants # tag 子孙 iter
soup.a.parent, soup.a.parents
soup.a.next_sibling, soup.a.previous_sibling

# 18 Beatiful Soup Find (html)
soup.find_alll( name , attrs , recursive , text , **kwargs )
for tag in soup.find_all([re.compile("^b"), 'a'], id='link2', class_='sister', attrs={'data-foo': 'value'}, text='Elsie', limit=5):
    print(tag.name)
find
find_parents, find_parent
find_next_siblings, find_next_sibling
find_previous_siblings, find_previous_sibling()

# 18 Beatiful Soup Search (CSS)
soup.select('title')
soup.select('.sister')
soup.select('#link1')
soup.select('head > title .sister')
soup.select('p a[href="http://example.com/elsie"]')

# 19 pytesseract
import pytesseract #pip install pytesseract
from PIL import Image
from io import BytesIO

s = requests.session()
r = s.get(imgurl, strem=True)
img = Image.open(BytesIO(r.content))
img = img.convert('L') # 灰度图
img = img.point(lambda x: 0 if x<140 else 255, '1')
code = pytesseract.image_to_string(img, lang='eng', config='--psm 12 --oem 3').replace(' ','')
code = input("Maybe {}, enter yours:".format(code))

# 20 lxml
from lxml import etree
html = etree.HTML(r.text)
# or read from file
html = etree.parse('r.html')
result = etree.tostring(html, pretty_print=True)
print(result.decode('utf8'))
result = html.xpath('//li') # Get list of <li>
print(result[0].text, result[0].tag)
result = html.xpath('//li/@class') # Get All attribute of <li>

# 21 XPath
# see https://www.w3school.com.cn/xpath/xpath_intro.asp for a reference
```

- `nodename` 选取此节点的所有子节点
- `/` 从根节点选取
- `//` 从匹配选择的当前节点选择文档中的节点，而不考虑它们的位置
- `.` 选取当前节点
- `..` 选取当前节点的父节点
- `@` 选取属性
- `/bookstore/book[last()-1]` 选取属于 bookstore 子元素的倒数第二个 book 元素
- `/bookstore/book[price>35.00]` 选取 bookstore 元素的所有 book 元素，且其中的 price 元素的值须大于 35.00
- `//title[@*]` 选取所有带有属性的 title 元素

```python
# 22 JS Render
# Find JSON data in XHR
url = "https://www.toutiao.com/stream/widget/local_weather/city/"
r_text = requests.get(url).text
data = json.loads(r_text)

# 23 Selenium
from selenium import webdriver # pip install selenium
from selenium.webdriver.common.keys import Keys
# brew cask install chromedriver
# brew services start chromedriver
driver = webdriver.Chrome()
# options = webdriver.ChromeOptions()
# options.add_argument('headless')
driver.get('http://www.baidu.com') # Open URL
elem = driver.find_element_by_name("wd")
elem.send_keys("Test")
elem.send_keys(Keys.RETURN)
print(driver.page_source)

# 24 Selenium Interaction
element = driver.find_element_by_id("passwd-id")
element = driver.find_element_by_name("passwd")
element = driver.find_elements_by_tag_name("input")
element = driver.find_element_by_xpath("//input[@id='passwd-id']")
element.send_keys("and some", Keys.ARROW_DOWN)
element.clear()
from selenium.webdriver.support.ui import Select
select = Select(driver.find_element_by_name('name'))
select.select_by_index(index)
select.select_by_visible_text("text")
select.select_by_value(value)
all_selected_options = select.all_selected_options
options = select.options
select.deselect_all()
driver.find_element_by_id("submit").click()

# 25 js2py
context = js2py.EvalJs()
with open('test.js', 'r') as f: # JS function F in test.js
 context.execute(f.read())
y = context.f(a)
# or execute immediately
js2py.eval_js(js_text)
```

## 反爬虫

- 防盗链：Referred
- 淘宝 ua 算法：登录前发送 post 请求，携带 ua 信息
