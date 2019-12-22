---
title: Matplotlib
date: 2019-02-06
tags: [python]
---

# Preface

This document serves as a reminder of basic usage of matplotlib. More information on [matplotlib tutorial](https://matplotlib.org/tutorials/index.html)

# 多图绘制

## figure

    # print(plt.style.available)
    plt.style.use('ggplot')
    plt.figure(1)
    plt.figure(2)

## subplot

    plt.subplots_adjust(wspace = 0, hspace =0.5)
    plt.subplot(211)
    plt.subplot(212)

## Axes

    ax = plt.axes([0.025,0.025,0.95,0.95])

<!--more-->

# plot

两组数据关系。

    plt.plot(x,y,'r^--',linewidth=2.0,label='uniq') # plot绘图
    plt.xlim(x.min()*0.9, x.max()*1.1) # x轴范围
    plt.ylim(y.min()*1.1, y.max()*1.1) # y轴范围
    plt.yscale('linear') # y轴度量 linear/log/sin
    plt.legend(loc='best') # 图例
    plt.title('The first fig') # 标题
    plt.xlabel('t/s') # x轴坐标
    plt.ylabel('f') # y轴坐标
    plt.xticks( [x*np.pi/2 for x in range(7)],[r'$0$', r'$+\pi/2$', r'$+\pi$']) # x轴刻度
    plt.yticks([-1, 0, +1]) # y轴刻度
    plt.annotate('local max', xy=(np.pi/2, 1), xytext=(3, 1.5), arrowprops=dict(facecolor='black', shrink=0.05,  connectionstyle="arc3,rad=.2"),) # 指示
    plt.fill_between(x, 0, y, y >= 0, color='blue', alpha=.25) # 填充
    plt.fill_between(x, 0, y, y < 0, color='red',  alpha=.25) # 填充

# 3Dplot

三组/四组数据可视化

    from mpl_toolkits.mplot3d import Axes3D

    fig = plt.figure()
    ax = Axes3D(fig)
    X = np.arange(-4, 4, 0.25)
    Y = np.arange(-4, 4, 0.25)
    X, Y = np.meshgrid(X, Y)
    R = np.sqrt(X**2 + Y**2)
    Z = np.sin(R)

    ax.plot_surface(X, Y, Z, rstride=1, cstride=1, cmap=plt.cm.hot)
    ax.contourf(X, Y, Z, zdir='z', offset=-2, cmap=plt.cm.hot)
    ax.set_zlim(-2,2)

# scatter

两组数据关系；三组数据关系（颜色表示一种）

    n = 1024
    X = np.random.normal(0,1,n)
    Y = np.random.normal(0,1,n)
    T = np.arctan2(Y,X)
    plt.scatter(X, Y, s=75, c=T, alpha=.5)

# pie

一组数据可视化

    n = 20
    Z = np.ones(n)
    Z[-1] *= 2
    plt.pie(Z, explode=Z*.05, colors=['%f' % (i/float(n)) for i in range(n)],
            wedgeprops={"linewidth": 1, "edgecolor": "black"})
    plt.xticks([]), plt.yticks([])
    plt.show()

# hist

一组数据可视化

    plt.hist(xx, 50, density=1, facecolor='g', alpha=0.75)
    plt.xlabel('Smarts', fontsize=14, color='red')
    plt.ylabel('Probability')
    plt.title('Histogram of IQ')
    plt.text(60, .025, r'$\mu=100,\ \sigma=15$')
    plt.axis([40, 160, 0, 0.03])
    plt.grid(True)

# boxplot

一组数据可视化

    sns.boxplot(Z)

# kdeplot

一组/二组数据可视化

    sns.kdeplot(Z, shade=True)

# violinplot

一组数据可视化

    sns.violinplot(Z)

# bar

两组数据关系（可显示1对2）

    n = 12
    X = np.arange(n)
    Y1 = (1-X/float(n)) * np.random.uniform(0.5,1.0,n)
    Y2 = (1-X/float(n)) * np.random.uniform(0.5,1.0,n)
    plt.bar(X, +Y1, facecolor='#9999ff', edgecolor='white')
    plt.bar(X, -Y2, facecolor='#ff9999', edgecolor='white')
    plt.ylim(-1.25,+1.25)

# contour

三组数据关系

    def f(x,y): return (1-x/2+x**5+y**3)*np.exp(-x**2-y**2)

    n = 256
    x = np.linspace(-3,3,n)
    y = np.linspace(-3,3,n)
    X,Y = np.meshgrid(x,y)

    plt.contourf(X, Y, f(X,Y), 8, alpha=.75, cmap='jet')
    C = plt.contour(X, Y, f(X,Y), 8, colors='black', linewidth=.5)
    plt.clabel(C, inline=1, fontsize=10)
    plt.show()

# imshow

三组数据关系

    def f(x,y): return (1-x/2+x**5+y**3)*np.exp(-x**2-y**2)
    n = 10
    x = np.linspace(-3,3,4*n)
    y = np.linspace(-3,3,3*n)
    X,Y = np.meshgrid(x,y)

    plt.imshow(f(X,Y),interpolation='bicubic', cmap='bone', origin='lower')
    plt.colorbar(shrink=.92)
    plt.xticks([]), plt.yticks([])
    plt.show()

# quiver

矢量可视化

    n = 8
    X,Y = np.mgrid[0:n,0:n]
    plt.quiver(X,Y)
    plt.show()

# grid

    ax = plt.axes([0.025,0.025,0.95,0.95])
    ax.set_xlim(0,4)
    ax.set_ylim(0,3)
    ax.xaxis.set_major_locator(plt.MultipleLocator(1.0))
    ax.xaxis.set_minor_locator(plt.MultipleLocator(0.1))
    ax.yaxis.set_major_locator(plt.MultipleLocator(1.0))
    ax.yaxis.set_minor_locator(plt.MultipleLocator(0.1))
    ax.grid(which='major', axis='x', linewidth=0.75, linestyle='-', color='0.75')
    ax.grid(which='minor', axis='x', linewidth=0.25, linestyle='-', color='0.75')
    ax.grid(which='major', axis='y', linewidth=0.75, linestyle='-', color='0.75')
    ax.grid(which='minor', axis='y', linewidth=0.25, linestyle='-', color='0.75')
    ax.set_xticklabels([])
    ax.set_yticklabels([])
    plt.show()

# pairplot

两两关系

    sns.pairplot(df)

# 多维数据

## PCA

    from sklearn import decomposition

    pca = decomposition.PCA(n_components=2)

    X = pca.fit_transform(values)

    plt.scatter(X[:,0], X[:,1], c=np.log(train['time']))
    plt.colorbar()
    plt.show()

## ICA

    from sklearn import decomposition

    fica = decomposition.FastICA(n_components=2)

    X = fica.fit_transform(values)

    plt.scatter(X[:,0], X[:,1], c=np.log(train['time']))
    plt.colorbar()
    plt.show()

## TSNE

    from sklearn.manifold import TSNE

    X = TSNE(n_components=2).fit_transform(train.iloc[:,1:-1].values, train['time'].values)

    plt.scatter(X[:,0], X[:,1], c=np.log(train['time']))
    plt.colorbar()
    plt.show()