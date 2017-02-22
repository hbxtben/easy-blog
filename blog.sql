-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2016-11-09 14:04:27
-- 服务器版本： 5.7.13
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `cls`
--

CREATE TABLE `cls` (
  `clsid` int(11) NOT NULL,
  `clsname` varchar(100) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cls`
--

INSERT INTO `cls` (`clsid`, `clsname`, `num`) VALUES
(1, 'python爬虫', 1),
(3, 'PHP', 3),
(4, 'PS', 1),
(5, 'Angularjs 2', 1),
(6, '前端', 3),
(7, 'CSS', 1),
(8, '生活', 1);

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `commentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `comment` varchar(300) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`commentid`, `userid`, `id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '欢迎大家评论\r\n', 1478673953, 1478673953),
(2, 2, 10, '。。。。。\r\n', 1478674775, 1478674775),
(3, 3, 10, '厉害了', 1478675038, 1478675038);

-- --------------------------------------------------------

--
-- 表的结构 `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `clsid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `contents`
--

INSERT INTO `contents` (`id`, `clsid`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, '零基础自学用Python 3开发网络爬虫,使用第三方模块快速抓取与解析', 'Requests Module\r\nRequests 是 Python 界大名鼎鼎的一个网络库, 其设计哲学是为人类而设计, 所以他提供的功能都非常的人性化. 他的方便对我而言主要有两大点:\r\n\r\n对 GET 和 POST 方法的封装做的很好, 自动处理了编码等问题;\r\n默认开启了 Cookies 处理, 在处理需要登录的问题上面非常方便.\r\nRequests 的方便之处不止这两点, 还提供了诸如标准登录接口之类的功能, 我们暂时用不上.\r\n\r\n总而言之, 对于使用过 urllib 的我们来说, 用 requests 会感觉我们之前生活在石器时代. 第三方库的强大就在于这里, 这也是 Python 这么火的重要原因.\r\n\r\n \r\n\r\nBeautifulSoup Module\r\nBeautifulSoup 大大方便了我们对抓取的 HTML 数据的解析, 可以用tag, class, id来定位我们想要的东西, 可以直接提取出正文信息, 可以全文搜索, 同样也支持正则表达式, 相当给力.\r\n\r\n\r\n', 1478673719, 1478673719),
(2, 3, 'PHP中把stdClass Object转array的几个方法', '我们在经常使用API接口获取数据返回json数值的时候，往往单纯通过json_decode方法解析获得得数值一般并非数组，而是带有stdClass Objec的对象字符串，这时如果我们想获取相应的PHP数组时，需通过以下几种方法来获取。\r\n\r\n方法一：\r\n//PHP stdClass Object转array  \r\nfunction object_array($array) {  \r\n    if(is_object($array)) {  \r\n        $array = (array)$array;  \r\n     } if(is_array($array)) {  \r\n         foreach($array as $key=>$value) {  \r\n             $array[$key] = object_array($value);  \r\n             }  \r\n     }  \r\n     return $array;  \r\n}\r\n\r\n方法二：\r\n$array = json_decode(json_encode(simplexml_load_string($xmlString)),TRUE);\r\n\r\n方法三：\r\n function object2array_pre(&$object) {\r\n        if (is_object($object)) {\r\n            $arr = (array)($object);\r\n        } else {\r\n            $arr = &$object;\r\n        }\r\n        if (is_array($arr)) {\r\n            foreach($arr as $varName => $varValue){\r\n                $arr[$varName] = $this->object2array($varValue);\r\n            }\r\n        }\r\n        return $arr;\r\n    }\r\n\r\n如果是10W的数据量的话，执行要进1s，结构再复杂些，可以达到3s， 性能太差了\r\n可以用以下替换：\r\n \r\nfunction object2array(&$object) {\r\n             $object =  json_decode( json_encode( $object),true);\r\n             return  $object;\r\n    }\r\n 但是对json的特性，只能是针对utf8的，否则得先转码下。', 1478673844, 1478673844),
(3, 3, '如何学好PHP的几个重要心得', '虽然PHP并非目前最火爆的编程语言，但随着信息社会的发展，大量的PHP编程人员近期在剧增，再加上IT行业的崛起，让学习编程的人能得到一个很好的就业机会，这时候我们想要快速地学习这门技术，且能更好的融入这个行业，我们下面应该来学习以下的一些技巧。\r\n　　其实我们想要成为一名真正的PHP程序员，并非学好PHP编程语言就行了，还需要了解更多的相关只是。\r\n    而我们要学习PHP第一步就是要学会如何在自己的电脑上安装PHP的运行环境。\r\n　　PHP程序员需要装备的技能有：\r\n　　MYSQL只有一门好的开发语言而不懂得数据库，我们依然是寸步难行的!还好，我们有一样开源、小巧的MYSQL!对于一个web开发人员来说，不能仅仅懂得(填/删/改/查-insert/delete/update/select),为了让我们的网站跑的更快、更顺畅我们还要懂得mysql的优化。没错!这个时候，视图、索引会帮你完成你想要的结果。\r\n　　Apache 你要学会配置Apache\r\n　　Javascript“后端语言群雄逐鹿，前端语言唯我独尊!”没错，这就是Javascript在前端语言地位的真实写照!想让网站拥有绚丽的视觉效果，就离不开 Javascript。\r\n　　Ajax 想让网站拥有良好的客户体验，就离不开Ajax!纵然有时候，YUI，JQuery等就Javascript框架会帮助我们提高效率，但是，他们的基础仍是Javascript!\r\n　　算法、数据结构按照常理来说，算法是PHP程序员的“灵魂”。对一名合格的程序员的第一要求的往往就是过硬的算法基础。\r\n　　要都精通上述技能，很难。当然，你是PHP程序员，主要是负责PHP编程。但是你要明白，你一个后台程序员，为了能开发出自己满意网站，还必须跟前台沟通。并且你要知道，你就是开发团队的核心，所以，无论如何都要学习上述技能。\r\n　　OK，上述技能都懂七七八八了，这样就成了真正的PHP程序员了么?又错了。\r\n　　你还必须要有程序员必须有的品质。\r\n　　团队精神和协作能力。通常项目开发都是一个团队开发，所以这是一个\r\n　　学习和总结的能力。因为互联网的技术日新月异，假如不能学习掌握新技术，那么就要遭到淘汰。这是最最重要的硬性要求。\r\n　　文档习惯。缺乏文档，一个软件系统就缺乏生命力，在未来的查错，升级以及模块的复用时就都会遇到极大的麻烦。\r\n　　规范化，标准化的代码编写习惯。代码具有良好的可读性，是PHP程序员基本的素质需求。\r\n　　需求理解能力。程序员需要理解一个模块的需求，性能需求指标中，稳定性，并访支撑能力以及安全性都很重要。\r\n　　测试习惯\r\n　　软件研发作为一项工程而言，一个很重要的特点就是问题发现的越早，解决的代价就越低，程序员在每段代码，每个子模块完成后进行认真的测试，就可以尽量将一些潜在的问题最早的发现和解决，这样对整体系统建设的效率和可靠性就有了最大的保证。\r\n　　作为一名合格的PHPer 首先就是对PHP的热爱，俗话说：“要做好一件事，要先去理解他，然后爱他。”PHP是一种很美妙的开发语言，你不需要再为定义一个变量的类型而犹豫不定，PHP会自动判断;你不需要在得到一个表单数据而声明N多的函数，一切都交给PHP吧!PHPer是一个极具挑战性的工作，so，如果你热爱挑战，喜欢有挑战性的工作，如果你已经准备好了，那么就加入吧。', 1478673938, 1478673938),
(4, 4, '用Photoshop抠图的四种方法', '\r\n抠图难吗？其实一点也不难，只要你有足够的耐心和细心，只须掌握最基础的photoshop知识就能完美的抠出图片。当然，这是靠时间换来的，我们应当掌握更简便、快速、效果好的抠图方法。抠图，也就是传说中的“移花接木”术，是学习photoshop的必修课，也是photoshop最重要的功能之一。这几天在研究photoshop抠图，个人纵观所有抠图方法无外乎两大类：一是作选区抠图；二是运用滤镜抠图。 \r\n稍难点的抠图就是“抠发抠婚纱”，抠发，指的是抠细小的物体，如毛发等；抠婚纱，就是抠透明质感的物体，如婚纱、玻璃杯等。好了，我们就分三大类来解析一下photoshop抠图：\r\n       ', 1478674033, 1478674033),
(5, 5, 'Angularjs 2 库', 'Angular 被打包成了一个 JavaScript 模块的集合。你可以理解为库模块。\r\n每一个 Angular 库命名跟着 @angular前缀。\r\n通过 npm 包管理器来安装这些库，通过JavaScript import 语句来导入使用的部分。\r\n例如，从 @angular/core 导入 Angular 组件修饰符库如下所示：\r\nimport { Component } from \'@angular/core\';\r\n你也可以使用 JavaScript 的导入语句从 Angular 库中导入 Angular 模块：\r\nimport { BrowserModule } from \'@angular/platform-browser\';\r\n前面根模块的简单例子中，应用模块需要 BrowserModule 中的功能更。访问这些功能，添加 @NgModule 元数据的导入如下：\r\nimports:      [ BrowserModule ],\r\n这样我们同时使用了 Angular 和 JavaScript 模块系统。\r\n这很容易混淆两个系统，因为他们都共享相同的单词 “imports” 和 “exports”。但是暂时先放一边，时间和经验慢慢会清晰这种混淆。', 1478674079, 1478674079),
(6, 6, '先定一个小目标，做他一个天猫官网', '先定一个小目标，做他一个天猫官网 \r\n\r\n带了挺多届的学生，发现了一个现象，同学们在学习HTML，CSS，Javascript这些前端基础技术的时候，不会有太大的问题，大概也能分开掌握里面的标签，元素，选择器，函数，对象等等知识点。 但是要综合运用这些知识做一个好看的网站的时候，就犯晕了，不知道该如何布局，如何运用合适的样式，一些稍复杂的效果也不知道怎么下手了。 \r\n\r\n这样我认识到，单纯学习这些分开的样式等知识点，是无法有效的运用他们的。 那么就需要一个前端项目来进行整体的练手。 \r\n\r\n每个培训学校呢，都会有一个WEB项目来练手，通常都会做一个电商的购物网站，虽然听上去老套，但是确实很典型，各种知识点都会涉及到。 \r\n\r\n既然如此，就做一个购物网站来让他们跟着做来练手吧，那么做一个什么样的好呢？ 放眼望去，难道还有比天猫官网更有说服力的吗？ \r\n\r\n能够从头到尾做一个天猫官网前端，是非常有价值的。 假如，能够独立的做出来，那么这就意味着，各种典型的场景，布局的思路，相关技术的运用都达到相当熟悉的程度，这个对于找工作，拿offer，更重要的是，技能的提升，是很有用的。 \r\n\r\n说干就干，我就照着天猫官网，做了一个模仿天猫官网: http://how2j.cn/tmall 包括里面的取色，布局，javascript交互，尺寸，都统统尽我所能做到跟天猫官网近似。 ', 1478674190, 1478674190),
(7, 6, 'web性能优化_(转载文)', '一、尽量减少 HTTP 请求\r\n \r\n有几种常见的方法能切实减少 HTTP 请求：\r\n \r\n1、 合并脚本跟样式文件，如可以把多个 CSS 文件合成一个，把多个 JS 文件合成一个。\r\n \r\n2、 CSS Sprites 利用 CSS background 相关元素进行背景图绝对定位,把多个图片合成一个图片。\r\n \r\n二、使用浏览器缓存\r\n \r\n       在用户浏览网站的不同页面时，很多内容是重复的，比如相同的JS、CSS、图片等。如果我们能够建议甚至强制浏览器在本地缓存这些文件，将大大降低页面产生的流量，从而降低页面载入时间。\r\n \r\n   根据服务器端的响应header，一个文件对浏览器而言，有几级不同的缓存状态。\r\n \r\n   1、服务器端告诉浏览器不要缓存此文件，每次都到服务器上更新文件。\r\n \r\n   2、服务器端没有给浏览器任何指示。\r\n \r\n   3、在上次传输中，服务器给浏览器发送了Last-Modified或Etag数据，再次浏览时浏览器将提交这些数据到服务器，验证本地版本是否最新的，如果为最新的则服务器返回304代码，告诉浏览器直接使用本地版本，否则下载新版本。一般来说，有且只有静态文件，服务器端才会给出这些数据。\r\n \r\n   4、服务器强制要求浏览器缓存文件，并设置了过期时间。在缓存未到期之前，浏览器将直接使用本地缓存文件，不会与服务器端产生任何通信。\r\n \r\n       我们要做的是尽量强制浏览器到第四种状态，特别是对于JS、CSS、图片等变动较少的文件。\r\n \r\n三、使用压缩组件\r\n \r\nIE和Firefox浏览器都支持客户端GZIP，传输之前，先使用GZIP压缩再传输给客户端，客户端接收之后由浏览器解压，这样虽然稍微占用了一些服务器和客户端的CPU，但是换来的是更高的带宽利用率。对于纯文本来讲，压缩率是相当可观的。如果每个用户节约50%的带宽，那么租用来的那点带宽就可以服务多一倍的客户，并且缩短了数据的传输时间。\r\n \r\n四、图片、JS的预载入\r\n \r\n预载入图像最简单的方法是在 JavaScript 中实例化一个新 Image() 对象，然后将需要载入的图像的 URL 作为参数传入。\r\n \r\nfunction preLoadImg(url) {\r\n \r\nvar img = new Image();\r\n \r\nimg.src = url;\r\n \r\n}\r\n \r\n可以在登录页面预载入JS和图片\r\n \r\n五、将脚本放在底部\r\n \r\n脚本放在顶部带来的问题，\r\n \r\n1、  使用脚本时，对于位于脚本以下的内容，逐步呈现将被阻塞\r\n \r\n2、  在下载脚本时会阻塞并行下载\r\n \r\n放在底部可能会出现JS错误问题，当脚本没加载进来，用户就触发脚本事件。\r\n \r\n要综合考虑情况。\r\n \r\n六、将样式文件放在页面顶部\r\n \r\n如果样式表任在加载，构建呈现树就是一种浪费，样式文件放在页面底部可能会出现两种情况：\r\n \r\n1、  白屏\r\n \r\n2、  无样式内容的闪烁\r\n \r\n七、使用外部的JS和CSS\r\n \r\n将内联的JS和CSS做成外部的JS、CSS。减少重复下载内联的JS和CSS。\r\n \r\n八、切分组件到多个域\r\n \r\n主要的目的是提高页面组件并行下载能力。但不要跨太多域名，建议采用2个子域名。\r\n  \r\n九、精简JS\r\n \r\n可以做到两个级别\r\n \r\n1、精简：从代码中移除不必要的字符以减少其大小，\r\n \r\n2、混淆：在精简的同时，还会改写代码，函数、变量名被转换成更短的字符串\r\n \r\n可以使用ShrinkSafe来精简JS  http://shrinksafe.dojotoolkit.org/\r\n \r\n十、精简CSS\r\n \r\n从代码中移除不必要的字符以减少其大小，\r\n \r\n可以使用CSS Compressor http://www.cssdrive.com/index.php/main/csscompressor /\r\n \r\n十一、       精简图片、Flash\r\n \r\n对大图片、Flash，要在效果和大小之间做出平衡。', 1478674313, 1478674313),
(8, 7, '常用css样式属性大全（中文注释）', '一 CSS文字属性：\r\ncolor : #999999; /*文字颜色*/\r\nfont-family : 宋体,sans-serif; /*文字字体*/\r\nfont-size : 9pt; /*文字大小*/\r\nfont-style:itelic; /*文字斜体*/\r\nfont-variant:small-caps; /*小字体*/\r\nletter-spacing : 1pt; /*字间距离*/\r\nline-height : 200%; /*设置行高*/\r\nfont-weight:bold; /*文字粗体*/\r\nvertical-align:sub; /*下标字*/\r\nvertical-align:super; /*上标字*/\r\ntext-decoration:line-through; /*加删除线*/\r\ntext-decoration: overline; /*加顶线*/\r\ntext-decoration:underline; /*加下划线*/\r\ntext-decoration:none; /*删除链接下划线*/\r\ntext-transform : capitalize; /*首字大写*/\r\ntext-transform : uppercase; /*英文大写*/\r\ntext-transform : lowercase; /*英文小写*/\r\ntext-align:right; /*文字右对齐*/  \r\ntext-align:left; /*文字左对齐*/\r\ntext-align:center; /*文字居中对齐*/\r\ntext-align:justify; /*文字分散对齐*/\r\nvertical-align属性\r\nvertical-align:top; /*垂直向上对齐*/\r\nvertical-align:bottom; /*垂直向下对齐*/\r\nvertical-align:middle; /*垂直居中对齐*/\r\nvertical-align:text-top; /*文字垂直向上对齐*/\r\nvertical-align:text-bottom; /*文字垂直向下对齐*/\r\n二、CSS边框空白\r\npadding-top:10px; /*上边框留空白*/\r\npadding-right:10px; /*右边框留空白*/\r\npadding-bottom:10px; /*下边框留空白*/\r\npadding-left:10px; /*左边框留空白\r\n三、CSS符号属性\r\nlist-style-type:none; /*不编号*/\r\nlist-style-type:decimal; /*阿拉伯数字*/\r\nlist-style-type:lower-roman; /*小写罗马数字*/\r\nlist-style-type:upper-roman; /*大写罗马数字*/\r\nlist-style-type:lower-alpha; /*小写英文字母*/\r\nlist-style-type:upper-alpha; /*大写英文字母*/\r\nlist-style-type:disc; /*实心圆形符号*/\r\nlist-style-type:circle; /*空心圆形符号*/\r\nlist-style-type:square; /*实心方形符号*/\r\nlist-style-image:url(/dot.gif); /*图片式符号*/\r\nlist-style-position: outside; /*凸排*/\r\nlist-style-position:inside; /*缩进*/\r\n四、CSS背景样式\r\nbackground-color:#F5E2EC; /*背景颜色*/  \r\nbackground:transparent; /*透视背景*/\r\nbackground-image : url(/image/bg.gif); /*背景图片*/\r\nbackground-attachment : fixed; /*浮水印固定背景*/\r\nbackground-repeat : repeat; /*重复排列-网页默认*/\r\nbackground-repeat : no-repeat; /*不重复排列*/\r\nbackground-repeat : repeat-x; /*在x轴重复排列*/\r\nbackground-repeat : repeat-y; /*在y轴重复排列*/\r\n指定背景位置\r\nbackground-position : 90% 90%; /*背景图片x与y轴的位置*/\r\nbackground-position : top; /*向上对齐*/\r\nbackground-position : buttom; /*向下对齐*/\r\nbackground-position : left; /*向左对齐*/\r\nbackground-position : right; /*向右对齐*/\r\nbackground-position : center; /*居中对齐*/\r\n五、CSS连接属性\r\na /*所有超链接*/\r\na:link /*超链接文字格式*/  \r\na:visited /*浏览过的链接文字格式*/\r\na:active /*按下链接的格式*/\r\na:hover /*鼠标转到链接*/\r\n鼠标光标样式：\r\n链接手指 CURSOR: hand\r\n十字体 cursor:crosshair\r\n箭头朝下 cursor:s-resize\r\n十字箭头 cursor:move\r\n箭头朝右 cursor:move\r\n加一问号 cursor:help\r\n箭头朝左 cursor:w-resize\r\n箭头朝上 cursor:n-resize\r\n箭头朝右上 cursor:ne-resize\r\n箭头朝左上 cursor:nw-resize\r\n文字I型 cursor:text\r\n箭头斜右下 cursor:se-resize\r\n箭头斜左下 cursor:sw-resize\r\n漏斗 cursor:wait\r\n光标图案(IE6)   p {cursor:url(“光标文件名.cur”),text;}\r\n六、CSS框线一览表\r\nborder-top : 1px solid #6699cc; /*上框线*/\r\nborder-bottom : 1px solid #6699cc; /*下框线*/\r\nborder-left : 1px solid #6699cc; /*左框线*/  \r\nborder-right : 1px solid #6699cc; /*右框线*/\r\n以上是建议书写方式,但也可以使用常规的方式 如下:\r\nborder-top-color : #369 /*设置上框线top颜色*/\r\nborder-top-width :1px /*设置上框线top宽度*/\r\nborder-top-style : solid/*设置上框线top样式*/\r\n其他框线样式\r\nsolid /*实线框*/\r\ndotted /*虚线框*/\r\ndouble /*双线框*/\r\ngroove /*立体内凸框*/\r\nridge /*立体浮雕框*/\r\ninset /*凹框*/\r\noutset /*凸框*/\r\n七、CSS表单运用\r\n文字方块  \r\n按钮  \r\n复选框  \r\n选择钮  \r\n多行文字方块  \r\n下拉式菜单 选项1选项2\r\n八、CSS边界样式\r\nmargin-top:10px; /*上边界*/\r\nmargin-right:10px; /*右边界值*/\r\nmargin-bottom:10px; /*下边界值*/\r\nmargin-left:10px; /*左边界值*/', 1478674461, 1478674461),
(9, 3, '想用PHP 搭建个个人空间系统？', '作者：阿木\r\n链接：https://www.zhihu.com/question/21886828/answer/86543555\r\n来源：知乎\r\n著作权归作者所有，转载请联系作者获得授权。\r\n\r\n数据库设计\r\n\r\n1 用户表：用户编号，登录名，密码，显示名，用户分类编号（0：普通用户，1：管理员），其它\r\n\r\n2 文章分类表：分类编号，分类名，父分类编号（0：根分类（可实现无限级）），排序，其它（如是否显示）\r\n\r\n3 文章表：文章编号，标题，摘要图，摘要内容，内容，发表时间，统计（浏览，评论等），发表人（用户编号），文章分类（分类编号），关键词（,词一,词二,词三,），排序，置顶，推荐，其它（如是否显示，是否允许评论等）\r\n\r\n4 导航表：导航编号，导航显示名称（如：我爱php），导航地址（如：php，如果用php框架可以实现用户访问http://www.test.com/php，程序自动读取本导航对应文章分类下的数据），文章分类（分类编号）\r\n\r\n\r\n5 评论表：评论编号，评论内容，发表时间，所属文章编号，所属父评论编号（可以实现无限级评论），发表人编号\r\n\r\n\r\n6 文件表：文件编号，文件存放地址（一般绝对于根目录如：/file/img/1.jpg），文件大小，文件类型（0：图片，1：文件（一般是只能下载的txt,rar,zip...），2：video....），发表人编号\r\n\r\n7 站点基本信息表：浏览器title，keyword等..\r\n\r\n\r\n\r\n\r\n大致程序结构\r\n\r\n1 共用部分：用户登录，用户退出，用户个人页面，用户上传文件管理等\r\n\r\n2 后台部分（仅管理员可以进入）：上述所有数据库表的增，删，改，查\r\n\r\n3 前台部分：按所有可用导航写文章列表与文章详细页面，文章详细列评论与添加评论；可能还会出现普通用户个人中心（方便用户看自己看过哪些文章，在哪些文章发过评论）\r\n\r\n\r\n\r\n框架选择\r\n\r\n我学过tp，但我用的是ci，因为我觉得ci非常简单，ci的手册写得非常好\r\n\r\n\r\n\r\n可能涉及到的难点\r\n编辑器，现在大多用百度ueditor，但我还是用的是kindeditor\r\n难点在于这些编辑器本身不自带用户文件管理（例如用户发评论的编辑器中选择插入图片，可以选择以前已上传的图片），你得自己改动原编辑器代码，实现这个功能', 1478674584, 1478674584),
(10, 8, '发烧捂一身汗就会退烧吗？', '作者：阿木\r\n链接：https://www.zhihu.com/question/21886828/answer/86543555\r\n来源：知乎\r\n著作权归作者所有，转载请联系作者获得授权。\r\n\r\n数据库设计\r\n\r\n1 用户表：用户编号，登录名，密码，显示名，用户分类编号（0：普通用户，1：管理员），其它\r\n\r\n2 文章分类表：分类编号，分类名，父分类编号（0：根分类（可实现无限级）），排序，其它（如是否显示）\r\n\r\n3 文章表：文章编号，标题，摘要图，摘要内容，内容，发表时间，统计（浏览，评论等），发表人（用户编号），文章分类（分类编号），关键词（,词一,词二,词三,），排序，置顶，推荐，其它（如是否显示，是否允许评论等）\r\n\r\n4 导航表：导航编号，导航显示名称（如：我爱php），导航地址（如：php，如果用php框架可以实现用户访问http://www.test.com/php，程序自动读取本导航对应文章分类下的数据），文章分类（分类编号）\r\n\r\n\r\n5 评论表：评论编号，评论内容，发表时间，所属文章编号，所属父评论编号（可以实现无限级评论），发表人编号\r\n\r\n\r\n6 文件表：文件编号，文件存放地址（一般绝对于根目录如：/file/img/1.jpg），文件大小，文件类型（0：图片，1：文件（一般是只能下载的txt,rar,zip...），2：video....），发表人编号\r\n\r\n7 站点基本信息表：浏览器title，keyword等..\r\n\r\n\r\n\r\n\r\n大致程序结构\r\n\r\n1 共用部分：用户登录，用户退出，用户个人页面，用户上传文件管理等\r\n\r\n2 后台部分（仅管理员可以进入）：上述所有数据库表的增，删，改，查\r\n\r\n3 前台部分：按所有可用导航写文章列表与文章详细页面，文章详细列评论与添加评论；可能还会出现普通用户个人中心（方便用户看自己看过哪些文章，在哪些文章发过评论）\r\n\r\n\r\n\r\n框架选择\r\n\r\n我学过tp，但我用的是ci，因为我觉得ci非常简单，ci的手册写得非常好\r\n\r\n\r\n\r\n可能涉及到的难点\r\n编辑器，现在大多用百度ueditor，但我还是用的是kindeditor\r\n难点在于这些编辑器本身不自带用户文件管理（例如用户发评论的编辑器中选择插入图片，可以选择以前已上传的图片），你得自己改动原编辑器代码，实现这个功能', 1478674679, 1478674679);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `useremail` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `userpass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`userid`, `useremail`, `username`, `userpass`) VALUES
(1, '709994967@qq.com', 'superMan', '123456'),
(2, '111@qq.com', '妮妮', '123456'),
(3, '222@qq.com', '刘华', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cls`
--
ALTER TABLE `cls`
  ADD PRIMARY KEY (`clsid`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentid`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clsid` (`clsid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cls`
--
ALTER TABLE `cls`
  MODIFY `clsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `commentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 限制导出的表
--

--
-- 限制表 `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`clsid`) REFERENCES `cls` (`clsid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
