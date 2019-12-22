---
title: OJ-solution-2
date: 2018-09-01
tags: [oj]
---

# Problem : 带权DJS

## 题目

* 食物链 poj1182
* [幻想大学开学季](http://114.212.10.47:8084/problem.php?cid=1046&pid=3)
* Find them, Catch them

<!--more-->

## 事实并查集

原先的并查集在一个集合中代表的关系是：属于同一个类

将并查集属于同一个集合的含义改为：事实的相容性。每个元素表示的是一个事实。最朴素的并查集中的一个集合则表示：元素同类

现在用元素x+r表示事实：x属于r。在Find them, Catch them中，不同类信息转换为(x+r,y)和(x,y+r)。在食物链中，吃的关系转化为(x+2\*r,y),(x+r,y+2\*r),(x,y+2\*r)，同类关系转换为相应三个。由于关系的对称性（轮换性），判断时有许多是等价判断。

## 带权并查集

为每个元素增加属性rel表示其与父亲的关系，rel[x]（子到爷的关系）=(rel[x]（子到父的关系）+rel[y]（父到爷的关系）)%3

# Problem : Integers Exhibition(hdu6332)

定义性质P(K),若数X有性质P(K),则在比X小的数中有大于K个数，他们的因子数大于X。

给定T(10^(5)）组数据，询问第N(10^18)个有性质P(K(<=233))的数。

## 破题

我们难以给出通项公式，而N达到了10^(18)次方。观察到K小。在此情况下性质P具有不对称分布，即非P(K)的数多。

对于给定的K，如果一个数有性质P，则P的任意倍数都具有性质P。我们无法用筛法（O(n)），考虑到K很小，即如果一个数有超过233个比自身小的数因子数大于它，那么就肯定有P(K)。我们考虑生成所有非P(K),(0<=K<=233)，再用二分求出最后的答案。

## 算法

使用迭代法生成。利用（生成候补--筛选候补）的循环进行。令初始合法集为1，迭代每个素数，生成法则为合法集元素与素数乘到10^(18)内。筛选法则为将候补集按大小排序后从小到大进行按出现个数插入排序，保留K个。算法总复杂度为O(pre+solve)=O(P\*?\*KlogK + TlgN)。其中，P需要通过“迭代至稳定”的方法确定，而?为最后合法集大小。

实践得收敛值为：p=293,?=2757

最后再用按每个K计算前每个K值对应的非P(K)值。

## 编程注意点

* 数组大小long long 在256M下可以开1e7
* typedef pair<int,int> pii;
* 判断两数相乘是否越界
* upper_bound, lower_bound
* 多段二分存于线性数组中

## 算法难点

* 发现非P(k)数很少
* 生成后二分查找
* 利用性质构造迭代生成方法

## AC代码

```C++
//2277MS 84200K
#include <iostream>
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <string>
#include <cstring>
#include <map>
#include <set>
#include <vector>
#include <queue>
#include <stack>
#include <iomanip>
#include <cstdlib>
using namespace std;
#define mod 1000000007;
#define eps 1e-10
#define max(a, b) (((a) > (b)) ? (a) : (b))
#define min(a, b) ((a)>(b))? (b) : (a))
#define fabs(x) ((x) > 0 ? (x) : -(x))
#define randint(x, y) rand() % (y) + (x)
using int64 = long long;
typedef pair<int64, int> pii;
const int MAXN = (int)1e6; //Unkown
const int64 MAX = (int64)(1e18) + (int)(1e6);
int64 cprime[300];
bool p[300];

int valid(int64 a, int64 b)
{
    //两数相乘是否越界
    int64 ret = 0;
    for (; b; b >>= 1)
    {
        if (b & 1)
        {
            ret += a;
            if (ret > MAX || a < 0)
                return 0;
        }
        a += a;
        if (a >= MAX)
            a = -1;
    }
    return 1;
}

int prime_table(int64 n) //线性筛法
{
    int used = 0;
    p[0] = 1;
    p[1] = 1;
    for (int i = 2; i <= n; ++i)
    {
        if (!p[i])
            cprime[used++] = i;
        for (int j = 0; j < used; ++j)
        {
            if (i * cprime[j] > n)
                break;
            p[i * cprime[j]] = true;
            if (i % cprime[j] == 0) // n=p1 * (p2*p3*...*pk)
                break;
        }
    }
    return used;
}

int T, tot_l, tot_u, tot_v;
int64 n, k, tmp;
pii list[MAXN], upd[MAXN];
int64 ind[MAXN], mx[MAXN], va[MAXN * 10];
const int K = 233;

void update(int x)
{
    int t = K;
    while (t && mx[t - 1] < x)
    {
        mx[t] = mx[t - 1];
        --t;
    }
    mx[t] = x;
}

void pre()
{
    int len = prime_table(293);

    list[tot_l = 1] = make_pair(1, 1);
    for (int i = 0; i < len; ++i)
    {
        int64 p = cprime[i];
        tot_u = 0;
        for (int j = 1; j <= tot_l; ++j)
        {
            upd[++tot_u] = list[j];
            int64 f = list[j].first;
            int s = list[j].second, w = 0;
            while (valid(f, p))
            {
                f *= p;
                w++;
                upd[++tot_u] = make_pair(f, s * (w + 1));
            }
        }
        sort(upd + 1, upd + tot_u + 1);
        tot_l = 0;
        memset(mx, 0, sizeof(mx));
        for (int j = 1; j <= tot_u; ++j)
        {
            if (upd[j].second >= mx[K])
            {
                update(upd[j].second);
                list[++tot_l] = upd[j];
            }
        }
    }
    tot_v = 0;
    for (int i = 0; i <= K; ++i)
    {
        int cnt = 0;
        ind[i] = tot_v + 1;
        memset(mx, 0, sizeof(mx));
        for (int j = 1; j <= tot_l; ++j)
            if (list[j].second >= mx[i])
            {
                update(list[j].second);
                va[++tot_v] = list[j].first - (cnt++);
            }
    }
    ind[K + 1] = tot_v + 1;
}

void solve()
{
    scanf("%lld%lld", &n, &k);
    int64 p = upper_bound(va + ind[k], va + ind[k + 1], n) - va - ind[k];
    printf("%lld\n", p + n);
}

int main()
{
    scanf("%d", &T);
    pre();
    while (T--)
        solve();
    return 0;
}
```

## 参考题解

不难发现非 $K$-magic 数是非常少的，考虑先预处理出来，二分回答询问。

以下我们讨论如何求出非 $K$-magic 数，为方便描述，我们称一个正整数是良好的当且仅当其是非 $K$-magic 的。

对于一个质数 $p$，我们考虑所有仅包含小于 $p$ 的质因子的正整数集 $G$。不难发现：

> 若 $x \in G$，且在 $G$ 中已经有超过 $K$ 个小于 $x$ 的整数约数个数多于 $x$，即 $x$ 一定不是良好的，则 $x p ^ c$ $(c \ge 0)$ 也一定不可能是良好的。

这样我们就可以得到一个初步的想法。开始我们认为仅有 $1$ 是良好的，枚举质因子 $p$，对于每一个原来认为是良好的数 $x$，将 $x p ^ c$ $(c \ge 0)$ 加入候选列表，接着将候选列表排序，除去已经可以确定不是良好的数，进入下一轮迭代。容易证明，在这个算法中，筛去一个不是良好的数 $x$，是不会在后续过程中令一个原本不是良好的数，变成一个良好的数的，故筛去良好的数的过程是合法的剪枝。

然而枚举的质因子的范围有多大呢？联想 $K = 0$ 这一经典问题，我们知道对于 $10 ^ {18}$ 的范围，考虑前 $20$ 个质因子都绰绰有余了，因为将更大的质因子加入是非常不优的。在 $K$ 更大的时候，我们采用“迭代至稳定”的思想，每一轮迭代后检查答案是否变化，如果在较长一段迭代后答案无任何变化，我们就认为质因子 $p$ 的上界已经达到。经过实践，在 $K = 233$ 时，$p$ 的最大值取到 $293$ 即可。

我们考虑如何在一轮迭代中除去确定不是良好的数。考虑维护前 $K + 1$ 大值，从小到大枚举候选列表中的数 $x$，若 $x$ 小于第 $K + 1$ 大值，我们就把这个数除去。否则更新前 $K + 1$ 大值。根据上述描述可以大致估算复杂度。设 $K = 233$ 时，$10 ^ {18}$ 内良好的数的数量为 $N$，经过实践，可以知道 $N$ 约为 $50000$。每次扩展最多把一个数扩展成 $\log M$ 个数，在剪枝完毕后，列表大小又回归到 $N$ 以下，故时间复杂度可以估算为 $O(NK Max(p) \log M)$，常数较小

# Problem : Pizza Hub

## 题意

给定一个三角形和一个宽度为w的框，问把三角形放进框里最小的高度是多少

## 破题

以每条边（或每个点）分类，计算判断即可。难点在于如何计算坐标。

两个向量可以表达一个三角形。对称方法为四种，穷举三个顶点共12种情况。

## C语言技巧

* 穷举排列情况
将元素存于数组，定义cmp函数后

```c++
sort(p,p+n,cmp);
do {
    test(p);
} while(p,p+n,cmp);
```

* `#include <bits/cstdc++.h>` 添加相应文件后，在Xcode中可以使用
* `DBL_MAX`, `INT_MAX`
* 多关键字比较 `make_pair(a,b)<make_pair(c,d)`

## 计算几何技巧

* a > b 即 a-b > eps; a >= b 即 a-b > -eps; a=0 即 0<=a<=0 即 -eps < a < eps
* 求投影长度，点在直线上方
* rotate

```c++
        point rotate(point v,point p,double angle, double scale){
            point ret = p;
            v.x -= p.x;
            v.y -= p.y;
            ret.x += v.x * cos(angle) * scale - v.y * sin(angle) * scale;
            ret.y += v.x * sin(angle) * scale + v.y * cos(angle) * scale;
            return ret
        }
```

* atan [-pi/2,pi/2] atan2 [-pi,pi]
* asin [-pi/2,pi/2] acos [0,pi]

## 复数几何技巧

适合旋转、角度处理

* 复数 `complex<double>`
* `typedef complex<double> point`
* x: pt.real()
* y: pt.imag()
* rotate: pt*polar(1.0,angle) 逆时针
* rotate: pt *或/ (v/abs(v))
* len^2: norm(pt)
* len: abs(pt)
* atan(y/x): arg(pt)
* (x,-y): conj(pt)

## 代码——计算几何版

```c++
//265MS	 1424K
#include <bits/stdc++.h>
using namespace std;
#define zero(x) (fabs(x) < eps)
#define _sign(x) ((x) > eps ? 1 : ((x) < -eps) ? 2 : 0)
#define eps 1e-8
const double pi = acos(-1);
struct point
{ //点、向量
    double x, y;
    point() : x(0), y(0) {}
    point(double a, double b) : x(a), y(b){};
    point operator -(const point p){
        return point(x-p.x,y-p.y);
    }
};

typedef const point CP;
bool cmp(CP p1,CP p2){
    return (p1.x<p2.x)||(p1.x==p2.x && p1.y<p2.y);
}
double w,ans=DBL_MAX;
point p[5];
double len(CP p){
    return sqrt(p.x*p.x+p.y*p.y);
}
double dis(CP p,CP v){
    return abs(p.x*(p.y-v.y)-p.y*(p.x-v.x))/len(v);
}
double proj(CP p,CP v){
    return (p.x*v.x+p.y*v.y)/len(v);
}
bool above(CP p,CP v){
    return p.x*v.y+p.y*v.x>0;
}
point rotate(point v,double angle){
    return point(v.x*cos(angle)-v.y*sin(angle),v.x*sin(angle)+v.y*cos(angle));
}
double test(CP v1,CP v2){
    if (len(v1)<w){
        double t = proj(v2,v1);
        if (t>-eps&&t<w+eps&&above(v2,v1))
            return dis(v2,v1);
        else return DBL_MAX;
    } else {
        double h =sqrt(v1.x*v1.x+v1.y*v1.y-w*w);
        double a = atan(h/w),a2 = atan2(v1.y,v1.x);
        point p1 = rotate(v1,a-a2);
        point p2 = rotate(v2,a-a2);
        if (p2.x>-eps&&p2.x<w+eps&&p2.y>-eps)
            return max(p2.y,p1.y);
        else return DBL_MAX;
    }
}

int main(){
    int T,x1,x2,x3,y1,y2,y3,wid;
    //FILE *fp = fopen("/Users/Fermat/Downloads/multi8/data/b.in","r");
    //FILE *fout = fopen("/Users/Fermat/Downloads/multi8/data/b.out","w");
    scanf("%d",&T);
    while (T--){
        ans = DBL_MAX;
        scanf("%d%d%d%d%d%d%d",&x1,&y1,&x2,&y2,&x3,&y3,&wid);
        w = wid;
        p[0] = point(x1,y1); p[1] = point(x2,y2); p[2] = point(x3,y3);
        sort(p,p+3,cmp);
        do {
            ans = min(ans,test(p[1]-p[0],p[2]-p[0]));
        } while (next_permutation(p,p+3,cmp));
        for (int i=0;i<3;++i){
            p[i].y = -p[i].y;
        }
        sort(p,p+3,cmp);
        do {
            ans = min(ans,test(p[1]-p[0],p[2]-p[0]));
        } while (next_permutation(p,p+3,cmp));
        if (ans==DBL_MAX) printf("impossible\n");
        else printf("%.9f\n",ans);
    }
    //fclose(fp);
    //fclose(fout);
    return 0;
}
```

## 代码——复数几何

```c++
//265MS    1440K
#include <bits/stdc++.h>
using namespace std;
#define eps 1e-8
const double pi = acos(-1);
typedef complex<double> point;
typedef const point CP;
bool cmp(CP a,CP b){
    return make_pair(a.real(),a.imag())<make_pair(b.real(),b.imag());
}
double w,ans;
point p[5];
double test(point v1,point v2){
    if (norm(v1)<w*w){
        v2 = v2/(v1/abs(v1));
        if (v2.real()>-eps&&v2.real()<w+eps&&v2.imag()>-eps)
            return v2.imag();
        else return DBL_MAX;
    } else {
        double h =sqrt(norm(v1)-w*w);
        double a = atan(h/w),a2 = arg(v1);
        v1 = polar(abs(v1),a);
        v2 = v2*polar(1.0,a-a2);
        if (v2.real()>-eps&&v2.real()<w+eps&&v2.imag()>-eps)
            return max(v2.imag(),v1.imag());
        else return DBL_MAX;
    }
}

int main(){
    int T,x1,x2,x3,y1,y2,y3,wid;
    //FILE *fp = fopen("/Users/Fermat/Downloads/multi8/data/b.in","r");
    //FILE *fout = fopen("/Users/Fermat/Downloads/multi8/data/b.out","w");
    scanf("%d",&T);
    while (T--){
        ans = DBL_MAX;
        scanf("%d%d%d%d%d%d%d",&x1,&y1,&x2,&y2,&x3,&y3,&wid);
        w = wid;
        p[0] = point(x1,y1); p[1] = point(x2,y2); p[2] = point(x3,y3);
        sort(p,p+3,cmp);
        do {
            ans = min(ans,test(p[1]-p[0],p[2]-p[0]));
        } while (next_permutation(p,p+3,cmp));
        for (int i=0;i<3;++i){
            p[i] = conj(p[i]);
        }
        sort(p,p+3,cmp);
        do {
            ans = min(ans,test(p[1]-p[0],p[2]-p[0]));
        } while (next_permutation(p,p+3,cmp));
        if (ans==DBL_MAX) printf("impossible\n");
        else printf("%.9f\n",ans);
    }
    //fclose(fp);
    //fclose(fout);
    return 0;
    }
```


# Problem : Harvest of Apples

## 题意

共$T(10^(5))$组数据，每组给定m,n($10^5$)，求S(m,n) = C(0,n)+...+C(m,n)

<!--more-->

## 破题

数学推导可得

$$S(n, m) = S(n, m - 1) + {n \choose m}$$
$$S(n, m) = 2S(n - 1, m) - {n - 1 \choose m}$$

由于修改时O(1),利用莫队算法可以获得$ O((N+T)*sqrt{T}) $的复杂度。

## 算法

莫队算法：解决一类可离线且在得到区间[l,r]的答案后，能在O(1)或O(log2n)得到区间[l,r+1]或[l−1,r]的答案的问题

1. 分$\sqrt{n}$块
2. 将查询按第一关键字为块编号，第二关键字为r排序
3. 处理询问，保存答案

## 编程实现

1. 莫队算法的经典实现使用while
2. 文件输入输入输出 
    FILE *fp = fopen("/Users/Fermat/Desktop/hdu4/tests/b.in","r")
    fscnaf(fp," ",&x);
    fclose(fp)
3. 带模运算
减法 a-b -> ((a-b)%m+m)%m
4. C(n,m) O(1)生成： 预处理阶乘和阶乘逆元（生成阶乘逆元时，生成最大者（快速幂求逆元），每次乘i+1求上一个）
5. 莫队算法分块后分别排序更快

## AC代码

```c++
//670MS	 5344K
#include <iostream>
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <string>
#include <cstring>
#include <map>
#include <set>
#include <vector>
#include <queue>
#include <stack>
#include <iomanip>
#include <cstdlib>
const int mod = (int)1e9 + 7;
#define eps 1e-10
#define max(a, b) (((a) > (b)) ? (a) : (b))
#define min(a, b) ((a)>(b))? (b) : (a))
#define fabs(x) ((x) > 0 ? (x) : -(x))
#define randint(x, y) rand() % (y) + (x)
using int64 = long long;
using namespace std;
const int MAXN = (int)1e5 + 2400;
struct node
{
    int L, R, index, kuai;
};
node qu[MAXN + 10];
int64 ans[MAXN + 10];

bool cmp(node a, node b)
{
    return (a.kuai < b.kuai || (a.kuai == b.kuai && a.R < b.R));
}

int FM(int a, int b, int mod) //快速幂
{
    int c = 1;
    for (; b; b >>= 1, a = 1ll * a * a % mod)
        if (b & 1)
            c = 1ll * c * a % mod;
    return c;
}

int ni_mod(int a, int mod)
{
    return FM(a, mod - 2, mod);
}
int64 jie[MAXN + 10], jie_ni[MAXN + 10];
int64 C(int m, int n)
{
    if (m == 0 || n == m)
        return 1;
    return (jie[n] * jie_ni[m] % mod) * jie_ni[n - m] % mod;
}

int64 ni2;
int64 cnt = 2;
int tn = 1, cm = 1;

void nplus_m(int64 &cnt, int n, int m)
{
    cnt = ((2 * cnt % mod - C(m, n - 1)) + mod) % mod;
}

void nminus_m(int64 &cnt, int n, int m)
{

    cnt = (cnt + C(m, n)) % mod * ni2 % mod;
}

void n_mplus(int64 &cnt, int n, int m)
{
    cnt = (cnt + C(m, n)) % mod;
}

void n_mminus(int64 &cnt, int n, int m)
{
    cnt = ((cnt - C(m + 1, n)) + mod) % mod;
}

void turn(int64 &cnt, int &tn, int &cm, int L, int R)
{
    int syn_n = tn < L;
    int syn_m = cm < R;
    if (syn_n)
        for (int i = tn + 1; i <= L; ++i)
            nplus_m(cnt, i, cm);
    else
        for (int i = tn - 1; i >= L; --i)
            nminus_m(cnt, i, cm);
    tn = L;
    if (syn_m)
        for (int i = cm + 1; i <= R; ++i)
            n_mplus(cnt, tn, i);
    else
        for (int i = cm - 1; i >= R; --i)
            n_mminus(cnt, tn, i);
    cm = R;
}

void pre()
{
    jie[0] = 1;
    jie[1] = 1;
    for (int i = 2; i <= MAXN; i++)
        jie[i] = jie[i - 1] * i % mod;
    jie_ni[MAXN] = ni_mod(jie[MAXN], mod);
    for (int i = MAXN - 1; i >= 1; --i)
        jie_ni[i] = 1ll * jie_ni[i + 1] * (i + 1) % mod;

    ni2 = ni_mod(2ll, mod);
}
int main()
{
    int T;
    pre();
    //FILE *fp = fopen("/Users/Fermat/Desktop/hdu4/tests/b.in","r");
    scanf("%d", &T);
    int64 sqrtn = sqrt(MAXN);
    for (int i = 0; i < T; i++)
    {
        scanf("%d%d", &qu[i].L, &qu[i].R);
        qu[i].index = i;
        qu[i].kuai = qu[i].L / sqrtn;
    }
    sort(qu, qu + T, cmp);
    for (int i = 0; i < T; i++)
    {
        turn(cnt, tn, cm, qu[i].L, qu[i].R);
        ans[qu[i].index] = cnt;
    }
    //FILE *fw = fopen("/Users/Fermat/Desktop/out.ans","w");
    for (int i = 0; i < T; i++)
        printf("%lld\n", ans[i] % mod);
    //fclose(fw);
    //fclose(fp);
    return 0;
}
```

## 参考题解

定义 $S(n, m) = \sum_{i = 0} ^ {m} {n \choose i}$，不难发现 $S(n, m) = S(n, m - 1) + {n \choose m}, S(n, m) = 2S(n - 1, m) - {n - 1 \choose m}$。也就是说，如果我们知道 $S(n, m)$，就能以 $O(1)$ 的代价计算出 $S(n - 1, m), S(n,  m - 1), S(n + 1, m), S(n, m + 1)$，可以采用莫队算法。

时间复杂度 $O(T \sqrt{MAX})$。

# Problem : Music Game

## 题意

Given n and m, there are n clicks. Each click may success or fail.

For a continuous success sequence with length X, the player can score X^m.

The probability that the i-th click success is p[i]/100.

We want to know the expectation of score.

## 破题

穷举断点

$$F[i] = \sum_{j=0}^{i}(F[i]+Zero\_at\_After\_one[j,i-j]*(i-j)^m$$

$$Zero\_at\_After\_one[j,0] = 1 - p[j]$$

$$Zero\_at\_After\_one[j,i] = Zero\_at\_After\_one[j,i-1] * p[i]$$

## 代码

```C++
#include <bits/stdc++.h>
using int64 = long long;
const int64 maxn = 1010;
const int64 mod = 1e9+7;
int64 ans[maxn],p[maxn],cp[maxn][maxn],n,m;
#define md(x) (((x)%mod+mod)%mod)
int64 ext_gcd(int64 a, int64 b, int64 &x, int64 &y)
{
    if (b == 0)
    {
        x = 1;
        y = 0;
        return a;
    }
    else
    {
        int64 r = ext_gcd(b, a % b, y, x);
        y -= x * (a / b);
        return r;
    }
}

int64 ni_mod(int64 a, int64 mod)
{ // only for (x,mod)=1
    int64 x, y;
    ext_gcd(mod, a, x, y);
    return ((y % mod) + mod) % mod;
}
int64 inv100 = ni_mod(100,mod);

int64 FM(int64 a, int64 b, int64 mod) //快速幂
{
    int64 c = 1;
    for (; b; b >>= 1, a = 1ll * a * a % mod)
        if (b & 1)
            c = 1ll * c * a % mod;
    return c;
}

int main(){
    scanf("%lld%lld",&n,&m);
    cp[0][0] = 1;
    for (int64 i=1;i<=n;++i){
        scanf("%lld",&p[i]);
        cp[i][0] = md(md(100-p[i])*inv100);
    }
    for (int64 i=0;i<=n;++i)
        for (int64 j=1;j+i<=n;++j){
            cp[i][j] = md(md(cp[i][j-1]*p[i+j])*inv100);
        }
    ans[0] = 0;
    for (int64 i=1;i<=n;++i)
        for (int64 j=0;j<=i;++j){
            int t = md(md((j-1>=0?ans[j-1]:0)+FM(i-j,m,mod))*cp[j][i-j]);
            ans[i] = md(ans[i] + t);
        }
    printf("%lld\n",ans[n]);
    return 0;
}
```

# 最远曼哈顿距离

$$dis(a,b) = |a.x-b.x|+|a.y-b.y| \\= max( a.x-b.x+a.y-b.y , \\ b.x-a.x+a.y-b.y ,\\ a.x-b.x+b.y-a.y ,\\ b.x-a.x+b.y-a.y)$$

对于$2^k$情况，每种求最值。复杂度从O($2^k$)降到O($2^kn$)

## 核心代码

```C++
for (int s=0; s<(1<<5); s++) {
            mi = inf, mx = -inf;
            for (int i=0; i<n; i++) {
                t = 0;
                for (int j=0; j<5; j++)
                    if ((1<<j) & s) t += a[i][j];
                    else t -= a[i][j];
                mi = min(mi, t);
                mx = max(mx, t);
            }
            ans = max(ans, mx-mi);
        }
```

# 树上点对距离之和

枚举边，动归
$$dp[cur] = sum\{dp[son]+sum[son]*(n-sum[son])*v[i]\}$$

## 树上任意一点到其它点距离之和

可以请教徐臣

## Code

```C++
void dfs(LL f,LL cur){
    sum[cur] = 1;
    for (LL i=head[cur];i!=0;i=pre[i]){
        LL son = to[i];
        if (f == son) continue;
        dfs(cur,son);
        sum[cur] = (sum[cur] + sum[son])%mod;
        dp[cur] = (dp[cur] + (dp[son] + md(sum[son]*md(md(n-sum[son])*v[i])))%mod)%mod;
    }
}
```