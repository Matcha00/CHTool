Redis

了解什么Redis，Redis和Memcached区别   

可以写个Demo联系下  需要服务器的话  可以用我的阿里云



公司选择 

公司规模: A轮 > B轮 > 天使轮  外包公司最低级别

公司类型: 游戏公司 > 自媒体 > 其他 > 电商 

基本算法 以Java为例 因为我不会PHP2333333333


父类 
// extends 继承 Comparable<T>泛型类   泛型我的理解是  泛指多种类型  因此我们初始化时可以给任何基本数据类型做参数或返回值
public abstract class Sort<T extends Comparable<T>> {

    public abstract void sort(T[] nums);
    // 比较大小，数组索引v与数组索引w 返回布尔值 如果v < w -1  v = w 0   v > w 1
    protected boolean less(T v, T w) {
        return v.compareTo(w) < 0;
    }
    // 交换索引 i j 位置 a作为中间交换第三方
    protected void swap(T[] a, int i, int j) {
        T t = a[i];
        a[i] = a[j];
        a[j] = t;
    }
} 

// java 多继承
// 选择排序:       原理选择数组从0到n-1 与 0 + 1 到 n - 1 做对比 若0 + 1 到 n - 1 大于 0到n-1 交换索引位置
public class Selection<T extends Comparable<T>> extends Sort<T> {
    @Override
    public void sort(T[] nums) {
        int N = nums.length; // 数组长度
        for (int i = 0; i < N; i++) {
            int min = i;
            for (int j = i + 1; j < N; j++)
                if (less(nums[j], nums[min]))
                    min = j;
            swap(nums, i, min);
        }
    }
}

// 冒泡排序: 比较相邻的两个元素第一个比第二个大交换位置 

public class Bubble<T extends Comparable<T>> extends Sort<T> {
    @Override
    public void sort(T[] nums) {
        int N = nums.length;
        boolean hasSorted = false;
        for (int i = 0; i < N && !hasSorted; i++) {
            hasSorted = true;
            for (int j = 0; j < N - i - 1; j++) {
                if (less(nums[j + 1], nums[j])) {
                    hasSorted = false;
                    swap(nums, j, j + 1);
                }
            }
        }
    }
}

// 插入排序 选出索引为1确认它有序，用 1 与 1 - 1 相比如果 1 < 1 -1 交换 1 与 1 - 1 位置 循环遍历

public class Insertion<T extends Comparable<T>> extends Sort<T> {
    @Override
    public void sort(T[] nums) {
        int N = nums.length;
        for (int i = 1; i < N; i++)
            for (int j = i; j > 0 && less(nums[j], nums[j - 1]); j--)
                swap(nums, j, j - 1);
    }
}

// 希尔排序: 去一个间隔值h， h等于数组长度除以2的四舍五入值 例如 5 8 5 4 1 6 5 3 数组长度为8 间隔h= 4， 5 与 1比较大小交换位置 下一个循环间隔是当前间隔除以2 

public class Shell<T extends Comparable<T>> extends Sort<T> {
    @Override
    public void sort(T[] nums) {
        int N = nums.length;
        int h = 1;
        while (h < N / 3)
            h = 3 * h + 1;  // 1, 4, 13, 40, ...

        while (h >= 1) {
            for (int i = h; i < N; i++)
                for (int j = i; j >= h && less(nums[j], nums[j - h]); j -= h)
                    swap(nums, j, j - h);
            h = h / 3;
        }
    }
}


//归并排序 将一个数组分成两个数组 分别排序 再排序

public abstract class MergeSort<T extends Comparable<T>> extends Sort<T> {

    protected T[] aux;

    protected void merge(T[] nums, int l, int m, int h) {
        int i = l, j = m + 1;

        for (int k = l; k <= h; k++)
            aux[k] = nums[k];        // 将数据复制到辅助数组

        for (int k = l; k <= h; k++) {
            if (i > m)
                nums[k] = aux[j++];
            else if (j > h)
                nums[k] = aux[i++];
            else if (aux[i].compareTo(nums[j]) <= 0)
                nums[k] = aux[i++];  // 先进行这一步，保证稳定性
            else
                nums[k] = aux[j++];
        }
    }
}


// 快速排序  将一个数组分为两个数组  切分依据partition函数返回索引    partition切分函数选出所以 比左侧大比右侧小

public class QuickSort<T extends Comparable<T>> extends Sort<T> {
    @Override
    public void sort(T[] nums) {
        shuffle(nums);
        sort(nums, 0, nums.length - 1);
    }

    private void sort(T[] nums, int l, int h) {
        if (h <= l)
            return;
        int j = partition(nums, l, h);
        sort(nums, l, j - 1);
        sort(nums, j + 1, h);
    }

    private void shuffle(T[] nums) {
        List<Comparable> list = Arrays.asList(nums);
        Collections.shuffle(list);
        list.toArray(nums);
    }


    private int partition(T[] nums, int l, int h) {
    int i = l, j = h + 1;
    T v = nums[l];
    while (true) {
        while (less(nums[++i], v) && i != h) ;
        while (less(v, nums[--j]) && j != l) ;
        if (i >= j)
            break;
        swap(nums, i, j);
    }
    swap(nums, l, j);
    return j;
}
}

算法gif图示例: https://blog.csdn.net/wfq784967698/article/details/79551476

加密 



加密方式 ：1 AES加密方法   一个秘钥+加密算法加密， 解密 用同样秘钥和同样算法解密  称对称加密

         2 MD5  文件验证算法，完全不可逆，存在MD5数据库破解MD5 所以我们可以进行二次MD5

         3 RAS  用公钥加密，用私钥解密  非对称加密

PHP加密安全方式：

         1 接口参数加密 +  接口时效性验证  （MD5 或 AES）

         2 接口参数加密 +  接口时效性验证  + RAS （接口参数加密 +  接口时效性验证先通过MD5或AES加密 在将加密后数据通过RAS公钥加密 ）

         3 接口参数加密 +  接口时效性验证  + RAS + HTTPS （接口参数加密 +  接口时效性验证先通过MD5或AES加密 在将加密后数据通过RAS公钥加密 ）



HTTP 网络知识

HTTP 与 HTTPS 区别

HTTP 的URL 以http:// 开头，而HTTPS 的URL 以https:// 开头
HTTP 是不安全的，而 HTTPS 是安全的
HTTP 标准端口是80 ，而 HTTPS 的标准端口是443
在OSI 网络模型中，HTTP工作于应用层，而HTTPS 的安全传输机制工作在传输层
HTTP 无法加密，而HTTPS 对传输的数据进行加密
HTTP无需证书，而HTTPS 需要CA机构wosign的颁发的SSL证书


什么是Http协议无状态协议?怎么解决Http协议无状态协议?

无状态协议对于事务处理没有记忆能力。缺少状态意味着如果后续处理需要前面的信息

也就是说，当客户端一次HTTP请求完成以后，客户端再发送一次HTTP请求，HTTP并不知道当前客户端是一个”老用户“。


可以使用Cookie来解决无状态的问题，Cookie就相当于一个通行证，第一次访问的时候给客户端发送一个Cookie，当客户端再次来的时候，拿着Cookie(通行证)，那么服务器就知道这个是”老用户“。

HTTP请求报文与响应报文格式

请求报文包含四部分：
a、请求行：包含请求方法、URI、HTTP版本信息
b、请求首部字段
c、请求内容实体
d、空行

响应报文包含四部分：

a、状态行：包含HTTP版本、状态码、状态码的原因短语
b、响应首部字段
c、响应内容实体
d、空行


常见的首部：

通用首部字段（请求报文与响应报文都会使用的首部字段）

Date：创建报文时间
Connection：连接的管理
Cache-Control：缓存的控制
Transfer-Encoding：报文主体的传输编码方式


请求首部字段（请求报文会使用的首部字段）

Host：请求资源所在服务器
Accept：可处理的媒体类型
Accept-Charset：可接收的字符集
Accept-Encoding：可接受的内容编码
Accept-Language：可接受的自然语言


响应首部字段（响应报文会使用的首部字段）

Accept-Ranges：可接受的字节范围
Location：令客户端重新定向到的URI
Server：HTTP服务器的安装信息


实体首部字段（请求报文与响应报文的的实体部分使用的首部字段）

Allow：资源可支持的HTTP方法
Content-Type：实体主类的类型
Content-Encoding：实体主体适用的编码方式
Content-Language：实体主体的自然语言
Content-Length：实体主体的的字节数
Content-Range：实体主体的位置范围，一般用于发出部分请求时使用

