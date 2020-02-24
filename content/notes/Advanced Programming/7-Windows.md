---
title: Windows
date: 2019-02-13
weight: 7
---

## Windows 简介

- Windows: 基于图形界面的多任务操作系统
  - 多任务：同时运行多个应用程序
  - 窗口：应用程序通过窗口与用户交互
  - 输入：鼠标单击/双击/拖放，菜单选择，键盘输入
- Windows 功能
  - 工具：资源管理器，记事本，画图 ...
  - 函数库：作为 Windows 应用程序接口（API）提供 `windows.h`
- 应用程序类型
  - 单文档应用
    - 只能对一个文档数据操纵
    - 必须首先结束当前文档的所有操作之后，才能进行下一个文档的操作
  - 多文档应用
    - 同时可以对多个文档的数据进行操作
    - 不必等到一个文档的所有操作结束，就可以对其它文档进行操作，对不同文档的操作是在不同的子窗口中进行的
  - 对话框应用
    - 以对话框的形式操作一个文档数据
    - 对文档数据的操作以各种“控件”（control）来实现
    - 程序以按<确定>或<取消>等按钮来结束

## 消息驱动程序结构

- Windows 应用程序的结果属于消息（事件）驱动的结构：程序的任何一个动作都是在接收到一条消息后发生的

| Windows 消息                                              |              |
| --------------------------------------------------------- | ------------ |
| WM_KEYDOWN/WM_KEYUP                                       | 键盘按键     |
| WM_CHAR                                                   | 字符         |
| WM_LBUTTONDOWN/WM_LBUTTONUP/WM_LBUTTONDBLCLK/WM_MOUSEMOVE | 鼠标按键     |
| WM_COMMAND                                                | 菜单         |
| WM_PAINT                                                  | 窗口内容刷新 |
| WM_TIMER                                                  | 定时器消息   |

- 消息队列：Windows 系统会把属于各个应用程序的消息放入各自的消息队列
  - 大部分消息关联到某个窗口
  - 每个窗口有一个消息处理函数
- 消息循环：取消息-处理消息
  - 取到 WM_QUIT，循环结束
- 可再入：函数的调用者要自带工作区（数据空间）
  - 由于消息处理函数在处理一条消息时可能会主动产生一些新消息，这些消息并不放入消息队列，而是直接调用消息处理函数来处理这些消息，这样就有可能导致消息处理函数的一次执行还未结束，另一次执行就开始的现象，这可能会引起数据的不一致错误。
  - 函数需要的数据要通过参数来传递
  - 函数不能有 static 存储类的局部变量
  - 在函数中访问全局变量也可能导致函数不可再入

## Windows API

- 基于 Windows API 的过程式 Windows 应用程序设计
  - 是一种基于过程抽象的程序设计范式
  - 通过调用 API 函数编写程序的粒度太细、太繁琐，开发效率不高
- 主函数 WinMain：每个 Windows 应用程序都必须提供
  - 注册窗口类（窗口基本信息）
    - 窗口类的名字、窗口的基本风格、消息处理函数名、图标、光标、背景颜色以及菜单
    - 每类窗口（不是每个窗口）都需要注册
  - 创建应用程序主窗口
  - 进入消息循环
  - 为每类窗口提供一个消息处理函数，用于处理发送到它的消息

```cpp
#include <windows.h>
int APIENTRY WinMain(HINSTANCE hInstance, //本实例标识，Handle
                     HINSTANCE hPrevInstance, //上一实例标识
                     LPSTR lpCmdLine, //命令行参数
                     int nCmdShow) //主窗口显示方式
{
    //注册窗口类
    RegisterClass(..., WindowProc, "my_window_class");
    //创建并显示主窗口
    HWND hWnd;
    hWnd = CreateWindow("my_window_class", ..., x, y, width, height, ...);
    ShowWindow(hWnd, nCmdShow);
    //消息循环
    while (GetMessage(&msg, NULL, 0, 0)){//从消息队列中取消息
        DispatchMessage(&msg);
    }
    return msg.wParam;
}
//窗口消息处理函数
LRESULT CALLBACK WindowProc(HWND hWnd, //窗口标识
                            UINT message, //消息标识
                            WPARAM wParam, //消息的参数1
                            LPARAM lParam) //消息的参数2
{
    switch (message){
        case WM_KEYDOWN:
            //wParam 为扫描码
        case WM_CHAR: //字符键消息
            //wParam 为按键字符编码
        case WM_COMMAND: //菜单消息
            switch (wParam) {//wParam 菜单项标识
                case ID_FILE_OPEN:
                case ID_START_TIMER:
                    SetItimer(hWnd, 1, 1000, NULL);
            }
        case WM_LBUTTONDOWN:
            //lParam 鼠标在窗口中位置
        case WM_CLOSE:
            DestroyWindow(hWnd);//关闭窗口
            break;
        case WM_DESTORY: //窗口被关闭
            PostQuitMessage(0); //往本应用消息队列中放入 WM_QUIT
            break;
        default: //由系统做默认的消息处理
            return DefWindownProc(hWnd, message, wParam, lParam);
    }
    return 0;
}
```

- 消息处理函数中生成新消息
  - PostMessage: 放入消息队列 `PostMessage(HWND hwnd, UINT Msg, WPARAM wParam, LPARAM lParam)`
  - SendMessage: 直接调用消息处理函数
- Resource
  - 菜单：菜单 ID、菜单项 ID/显示文字
  - 对话框：对话框 ID 和尺寸；对话框中各个控件的 ID、类型、尺寸与位置
- 资源文件(.rc)：编译后作为应用程序一部分链接到目标文件中
  - 资源描述有规定的格式
  - 可以用 VC++的资源编辑器来进行可视化编辑

## MFC

- 基于 MFC 和“文档--视”结构的面向对象 Windows 应用程序设计
  - MFC(Microsoft Foundation Class library, 微软基础类库)
  - MFC 提供了一些类来描述应用中对象的基本功能，应用程序可以通过继承这些类来实现各自的特殊功能
  - 文档--视结构
    - 文档：储存和管理程序中的数据
    - 视：显示文档数据以及实现对文档数据进行操作时与用户的交互功能
    - 一个文档对象对应一个或多个视对象
- MFC 提供的文档视框架主要由以下类构成
  - CView
  - CDocument
  - CFrameWnd
  - CDocTemplate
  - CWinApp
- 类向导 Class Wizard
  - 为应用程序中从 MFC 派生的类增加/删除成员
  - 为应用程序增加/删除基于 MFC 的类
- 图形用户接口(GUI)设计
  - 菜单：菜单由菜单项构成，每个菜单项包含标识，显示文字和提示文字，处理函数
  - 对话框
  - 绘图
  - 坐标转换

### 窗口类

- 基本窗口类 CWnd
  - 实现窗口的基本功能：一般的消息处理、窗口大小和位置管理、菜单管理、坐标系管理、滚动条管理、剪贴板管理、窗口状态管理、窗口间位置关系管理，等等
  - 其它窗口类的基类
- 框架窗口类
  - 提供对标题栏、菜单栏、工具栏、状态栏以及属于它的子窗口的管理功能
  - CFrameWnd: 单文档应用主窗口
  - CMDIFramWnd: 多文档应用主窗口
  - CMDIChildWnd: 多文档应用子窗口
- 视类 CView

  - 视窗口（简称视）位于单文档应用主窗口（CFrameWnd）和多文档应用子窗口（CMDIChildWnd）的客户区（可显示区）
  - 实现程序数据的显示功能以及操作数据时与用户的交互功能
  - CScrollView 带滚动功能

  ```cpp
  void CScrollView::SetScrollSizes(
    int nMapMode, //映射方式（坐标的逻辑单位，坐标轴方向）
    SIZE sizeTotal, //文档内容大小
    const SIZE& sizePage = sizeDefault, //文档滚动页大小
    const SIZE& sizeLine = sizeDefault //文档滚动行大小
  );
  //坐标转换函数
  OnPrepareDC(&dc, NULL); //为ScrollView初始化dc
  dc.DPtoLP(&point); //从物理坐标转换逻辑坐标
  dc.LPtoDP(&point);
  ```

  - CEditView 具有编辑功能
  - CFormView 具有表格功能
  - CHtmlView 具有Web浏览功能

```cpp
//CView 成员
CDocument *m_pDocument; //储存相应文档对象指针
CDocument *GetDocument() const;
virtual void OnDraw(CDC* pDC)=0; //处理窗口（视）刷新信息
virtual void OnInitialUpdate(); //视对象创建时被调用
virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint); //文档对象的数据发生改变时调用该函数刷新相应的视对象。默认处理：发送WM_PAINT消息
```

- 对话框类 CDialog
  - 对话框是一种特殊的窗口，用于获取用户的输入信息
  - CFileDialog: 文件打开/保存对话框
  - CFontDialog: 字体选择对话框
  - CColorDialog: 颜色选择对话框
  - CPrintDialog: 打印对话框
  - CFindReplaceDialog: 查找/替换对话框

```cpp
CMyDlg dlg;
dlg.m_ = ...;
if (dlg.DoModal()==IDOK){
  ... = dlg.m_;
}
```

### 文档类

- CDocument

  - 对程序要处理的数据进行管理，包括磁盘文件 I/O。
  - 一个 CDocument 类的对象至少要对应一个 CView 类的对象。

  ```cpp
  //CDocument 成员
  void AddView(CView* pView); //给文档对象增加一个关联的CView类的对象
  void RemoveView(CView* pView); //使一个CView对象脱离与文档对象的关联
  virtual POSITION GetFirstViewPosition() const; //获取关联的第一个CView对象的位置
  virtual CView* GetNextView(POSITION& rPosition) const; //获取指定位置的CView对象，rPosition自动往后移动一个位置
  void UpdateAllViews(CView* pSender, LPARAM lHint=0L, CObject* pHint=NULL); //向关联的CView对象发送刷新消息。当pSender为NULL时，向关联的所有CView对象发送刷新消息
  void SetModifiedFlag(BOOL bModified=TRUE); //设置文档修改标记
  BOOL IsModified(); //判断文档是否被修改
  virtual BOOL OnSaveDocument(LPCTSTR lpszPathName); //把文档数据保存到文件名为 lpszPathName 的文件中去
  virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
  virtual BOOL OnNewDocument();
  virtual BOOL OnCloseDocument();
  virtual void Serialize(CArchive& ar); //用于文档数据的序列化（写入磁盘文件或从磁盘文件读出），一般由OnSaveDocument和OnOpenDocument来调用
  ```

### 应用程序类

- 文档模板类

  - 实现对文档、视窗口和框架窗口所构成的对象组的管理功能。（用于支持基于“文档－视”结构的应用框架）
  - CDocTemplate: 文档模板的基类

  ```cpp
  CDocTemplate(UINT nIDResource, CRuntimeClass* pDocClass, CRuntimeClass* pFrameClass, CRuntimeClass* pViewClass); //参数为文档、视以及框架窗口的类信息
  ```

  - CSingleDocTemplate: 单文档模板类
  - CMultiDocTemplate: 多文档模板类

- 应用类 CWinApp

  - 提供了对 Windows 应用程序的各部分进行组合和管理的功能，其中包括对主窗口和文档模板的管理以及实现消息循环等

  ```cpp
  virtual BOOL InitInstance(); //应用程序初始化，包括注册窗口类、创建/显示主窗口等。它由WinMain调用
  virtual int Run(); //实现消息循环，由WinMain调用
  virtual int ExitInstance(); //由Run调用
  virtual CWnd *GetMainWnd();
  void AddDocTemplate(CDocTemplate* Template); //把一个文档模板加入到CWinApp类的对象中
  afx_msg void OnFileNew(); //对 File|New 菜单消息的处理功能
  afx_msg void OnFileOpen(); //对 File|Open 处理
  ```

### 其它类

- 绘图类

  - CDC 绘图环境类：实现 Windows 应用程序中的绘图功能：文本以及几何图形（线、矩形、椭圆等）的输出
    - CClientDC: CDC 派生类，用于在一个窗口的客户区绘图
    - 应用框架调用 CView 的 OnDraw 成员函数时，会自动创建一个 CDC 类的对象，作为参数传给 OnDraw

  ```cpp
  //文本输出函数
  virtual BOOL TextOut(int x, int y, LPCTSTR lpszString, int nCount);
  BOOL TextOut(int x, int y, const CString& str);
  virtual int DrawText(LPCTSTR lpszString, int nCount, LPRECT lpRect, UINT nFormat);
  int DrawText(const CString& str, LPRECT lpRect, UINT nFormat);
  virtual COLORREF SetTextColor(COLORREF crColor ); //设置字符和背景颜色
  virtual COLORREF SetBkColor(COLORREF crColor);
  //几何图形输出函数
  //线段
  CPoint MoveTo(int x, int y);//定起点
  CPoint MoveTo(POINT point);
  BOOL LineTo(POINT point);
  BOOL LineTo(int x, int y);
  //画矩形
  BOOL Rectangle(int x1, int y1, int x2, int y2);
  BOOL Rectangle(LPCRECT lpRect);
  //画椭圆，参数为外接矩形
  BOOL Ellipse(int x1, int y1, int x2, int y2);
  BOOL Ellipse(LPCRECT lpRect);
  //绘图工具选择函数
  virtual CGdiObject* SelectStockObject(int nIndex); //选择系统提供的绘图工具
  CPen* SelectObject(CPen* pPen); //选择自定义的笔
  CBrush* SelectObject(CBrush* pBrush);
  virtual CFont* SelectObject(CFont* pFont);
  ```

  - 绘图工具类

    - CPen: 画笔，用于画线
    - CFont: 字体
    - CBrush：刷子，用于填充封闭图形

    ```cpp
    Cpen(int nPenStyle, int nWidth, COLORREF crColor);
    CBrush(COLORREF crColor);
    CFont();
    BOOL CFont::CreatePointFont(int nPointSize, LPCTSTR lpszFaceName, CDC* pDC = NULL);
    ```

```cpp
//绘图实例
void CMyView::OnDraw(CDC* pDC){
  COLORREF old_text_color=pDC->SetTextColor(RGB(255,0,0)); //把字符颜色设置成“红”色。
  COLORREF old_bk_color=pDC->SetBkColor(RGB(0,255,0)); //把字符背景颜色设置成“绿”色。
  pDC->TextOut(0,0,”hello”); //在位置(0,0)处显示字符串"hello"
  pDC->SetTextColor(old_text_color); //把原来的字符颜色选回CDC类的对象
  pDC->SetBkColor(old_bk_color); //把原来的字符背景颜色选回CDC类的对象
  CBrush brush(RGB(0,0,255)),*old_brush; //创建一个蓝色的刷子
  old_brush = pDC->SelectObject(&brush); //把新刷子选进CDC类的对象，原来的刷子由old_brush指向
  pDC->Rectangle(0,50,100,150); //画一个内部为蓝色的矩形，左上角：(0,50)；右下角：(100,150)
  pDC->SelectObject(old_brush); //把原来的刷子选回到CDC类的对象中，必须要做！
}
```

- 文件输入输出类

  - CFile: 基于字节流的文件 I/O
  - CArchive: 通过重载操作符 << >> 实现了对基本数据类型和 MFC 类对象的文件 I/O

  ```cpp
  BOOL IsLoading() const;
  BOOL IsStoring() const;
  ```

- 常用数据类型类
  - CPoint（点坐标）
  - CRect（矩形信息）
  - CSize（矩形的宽度/高度、点之间的偏移量等）
  - CString
