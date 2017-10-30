
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT '0',
  `ownerId` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `text` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
);

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '1507950419', 'Typecho', '0', '1', null, 'http://typecho.org', '127.0.0.1', 'Typecho 1.0/14.10.10', '欢迎加入 Typecho 大家族', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('2', '4', '1507971743', 'test', '0', '1', 'asdf@sina.com', null, '1.119.128.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'test', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('3', '3', '1508230261', '宝宝', '0', '1', 'baobao@sina.com', null, '114.247.25.26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', '倪路是个笨笨哟', 'comment', 'approved', '0');

-- ----------------------------
-- Table structure for contents
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `text` text,
  `order` int(10) unsigned DEFAULT '0',
  `authorId` int(10) unsigned DEFAULT '0',
  `template` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `password` varchar(32) DEFAULT NULL,
  `commentsNum` int(10) unsigned DEFAULT '0',
  `allowComment` char(1) DEFAULT '0',
  `allowPing` char(1) DEFAULT '0',
  `allowFeed` char(1) DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
);

-- ----------------------------
-- Records of contents
-- ----------------------------
INSERT INTO `contents` VALUES ('1', '欢迎使用 Typecho', 'start', '1507950419', '1507950419', '<!--markdown-->如果您看到这篇文章,表示您的 blog 已经安装成功.', '0', '1', null, 'post', 'publish', null, '1', '1', '1', '1', '0');
INSERT INTO `contents` VALUES ('2', '关于', 'start-page', '1507950419', '1507950419', '<!--markdown-->本页面由 Typecho 创建, 这只是个测试页面.', '1', '1', null, 'page', 'publish', null, '0', '1', '1', '1', '0');
INSERT INTO `contents` VALUES ('3', '文章', '3', '1507964975', '1507964975', '<!--markdown-->这是文章', '0', '1', null, 'post', 'publish', null, '1', '1', '1', '1', '0');
INSERT INTO `contents` VALUES ('4', 'Mybatis入门(一)', '4', '1507970340', '1508740877', '<!--markdown-->### Mybatis简介\r\nMybatis是支持定制化 SQL、存储过程以及高级映射的优秀的持久层框架。MyBatis 避免了几乎所有的 JDBC 代码和手动设置参数以及获取结果集。MyBatis 可以对配置和原生Map使用简单的 XML 或注解，将接口和 Java 的 POJOs(Plain Old Java Objects,普通的 Java对象)映射成数据库中的记录。\r\n### Mybatis入门\r\n##### 1、安装\r\n一种方式是将mybatis-x.x.x.jar直接置于ClassPath下\r\n另一种方式是使用Maven下载管理jar\r\n```\r\n<dependency>\r\n    <groupId>org.mybatis</groupId>\r\n    <artifactId>mybatis</artifactId>\r\n    <version>x.x.x</version>\r\n</dependency>\r\n```\r\n##### 2、构建SqlSessionFactory\r\nMybatis的应用是以SqlSessionFactory的一个实例为核心的，SqlSessionFactory 的实例可以通过SqlSessionFactoryBuilder 获得。而 SqlSessionFactoryBuilder 则可以从 XML 配置文件或一个预先定制的 Configuration 的实例构建出 SqlSessionFactory 的实例。\r\n    基本XML配置文件如下\r\n```\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE configuration\r\n  PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\"\r\n  \"http://mybatis.org/dtd/mybatis-3-config.dtd\">\r\n<configuration>\r\n  <!-- 引入外部配置文件，也可不引入，直接在下面的配置文件中写死 -->\r\n  <!-- <properties resource=\"database.xml\"></properties>  -->\r\n  <environments default=\"development\">\r\n    <environment id=\"development\">\r\n      <transactionManager type=\"JDBC\"/>\r\n      <!-- Mybatis自带数据库连接池，POOLED代表使用数据库连接池 -->\r\n      <dataSource type=\"POOLED\">\r\n        <property name=\"driver\" value=\"${driver}\"/>\r\n        <property name=\"url\" value=\"${url}\"/>\r\n        <property name=\"username\" value=\"${username}\"/>\r\n        <property name=\"password\" value=\"${password}\"/>\r\n      </dataSource>\r\n    </environment>\r\n  </environments>\r\n  <mappers>\r\n    <mapper resource=\"org/mybatis/example/BlogMapper.xml\"/>\r\n  </mappers>\r\n</configuration>\r\n```\r\n也可以不使用XML配置，直接在Java程序中构建SqlSessionFactory，具体实现方式见Mybatis官方说明\r\n##### 3、配置Mapper.xml\r\nMapper.xml中存储由用户配置的sql语句，Mybatis支持配置多个Mapper.xml，其中每条sql语句由id唯一标识(同一Mapper.xml中不可重复)，不同Mapper.xml通过命名空间区分。\r\n```\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper\r\n  PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\r\n  \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\r\n<!-- 通常使用包名逆序作为命名空间，命名空间的存在也是为了防止多个mapper.xml中出现重复的id -->\r\n<mapper namespace=\"com.mybatis.mapper.UserMapper\">\r\n  <!-- id唯一的标识了这条语句，因此可以使用namespace+id来映射这条语句 -->\r\n  <!-- resultType给出返回bean的完整类名 -->\r\n  <select id=\"selectUser\" resultType=\"com.mybatis.model.User\">\r\n    select * from Users where id = #{id}\r\n  </select>\r\n</mapper>\r\n```\r\n##### 4、编码调用sql语句\r\n```\r\n/**\r\n*Mybatis快速入门，从查询开始\r\n*/\r\npublic class DbTest1 {\r\n    private SqlSessionFactory sqlSessionFactory;\r\n \r\n    @Before\r\n    public void init() throws IOException {\r\n        //通过mybatis提供的资源加载类加载配置文件\r\n        Reader reader = Resources.getResourceAsReader(\"Configuration.xml\");\r\n        //获取SqlSessionFactoryBuilder\r\n        SqlSessionFactoryBuilder sqlSessionFactroyBuilder = new SqlSessionFactoryBuilder();\r\n        //根据XML配置文件构建SqlSessionFactory\r\n        SqlSessionFactory sqlSessionFactory = sqlSessionFactroyBuilder.build(reader);\r\n        this.sqlSessionFactory = sqlSessionFactory;\r\n    }\r\n \r\n    @Test\r\n    public void testQuery1() {\r\n        SqlSession session = sqlSessionFactory.openSession();\r\n        try {\r\n            //sqlsession封装了所有对数据库的操作，包括connection的获取、statement的拼装、resultset的解析\r\n            //第一个参数为mapper.xml中的namespace+id，第二个参数为sql参数\r\n            User user = session.selectOne(\"com.mybatis.mapper.UserMapper.selectUser\", 2);\r\n        } finally {\r\n            //使用完后必须关闭\r\n            session.close();\r\n        }  \r\n    }\r\n}\r\n```\r\n对应的Bean为\r\n```\r\npublic class User {\r\n    //ID\r\n    private String id;\r\n    //用户名\r\n    private String username;\r\n    //密码\r\n    private String password;\r\n    //年龄\r\n    private String age;\r\n    //邮箱\r\n    private String email;\r\n    public String getId() {\r\n        return id;\r\n    }\r\n    public void setId(String id) {\r\n        this.id = id;\r\n    }\r\n    public String getUsername() {\r\n        return username;\r\n    }\r\n    public void setUsername(String username) {\r\n        this.username = username;\r\n    }\r\n    public String getPassword() {\r\n        return password;\r\n    }\r\n    public void setPassword(String password) {\r\n        this.password = password;\r\n    }\r\n    public String getAge() {\r\n        return age;\r\n    }\r\n    public void setAge(String age) {\r\n        this.age = age;\r\n    }\r\n    public String getEmail() {\r\n        return email;\r\n    }\r\n    public void setEmail(String email) {\r\n        this.email = email;\r\n    }\r\n}\r\n```\r\n数据库为\r\n\r\n\r\n### 范围和生命周期(以下摘自Mybatis官方文档)\r\n理解我们目前已经讨论过的不同范围和生命周期类是很重要的。 不正确的使用它们会导 致严重的并发问题。\r\n \r\n##### 1、SqlSessionFactoryBuilder\r\n这个类可以被实例化,使用和丢弃。一旦你创建了 SqlSessionFactory 后,这个类就不需 要存在了。 因此SqlSessionFactoryBuilder 实例的最佳范围是方法范围 (也就是本地方法变量)。 你可以重用SqlSessionFactoryBuilder 来创建多个 SqlSessionFactory 实例, 但是最好的方式是 不需要保持它一直存在来保证所有 XML 解析资源,因为还有更重要的事情要做。\r\n \r\n##### 2、SqlSessionFactory\r\n一旦被创建,SqlSessionFactory 应该在你的应用执行期间都存在。没有理由来处理或重 新创建它。 使用 SqlSessionFactory 的最佳实践是在应用运行期间不要重复创建多次。 这样的 操作将被视为是非常糟糕的。 因此 SqlSessionFactory 的最佳范围是应用范围。 有很多方法可 以做到, 最简单的就是使用单例模式或者静态单例模式。\r\n \r\n##### 3、SqlSession\r\n每个线程都应该有它自己的 SqlSession 实例。SqlSession 的实例不能被共享,也是线程 不安全的。因此最佳的范围是请求或方法范围。绝对不能将 SqlSession 实例的引用放在一个 类的静态字段甚至是实例字段中。 也绝不能将 SqlSession 实例的引用放在任何类型的管理范 围中, 比如 Serlvet 架构中的 HttpSession。 如果你现在正用任意的 Web 框架, 要考虑 SqlSession 放在一个和 HTTP 请求对象相似的范围内。换句话说,基于收到的 HTTP 请求,你可以打开 了一个 SqlSession,然后返回响应,就可以关闭它了。关闭 Session 很重要,你应该确保使 用 finally 块来关闭它。下面的示例就是一个确保 SqlSession 关闭的基本模式:\r\n```\r\nSqlSession session = sqlSessionFactory.openSession();\r\ntry {\r\n  // do work\r\n} finally {\r\n  session.close();\r\n}\r\n```\r\n在你的代码中一贯地使用这种模式, 将会保证所有数据库资源都正确地关闭 (假设你没 有通过你自己的连接关闭,这会给 MyBatis 造成一种迹象表明你要自己管理连接资源) 。\r\n \r\n##### 4、Mapper 实例\r\n映射器是你创建绑定映射语句的接口。映射器接口的实例可以从 SqlSession 中获得。那 么从技术上来说,当被请求时,任意映射器实例的最宽范围和 SqlSession 是相同的。然而, 映射器实例的最佳范围是方法范围。也就是说,它们应该在使用它们的方法中被请求,然后 就抛弃掉。它们不需要明确地关闭,那么在请求对象中保留它们也就不是什么问题了,这和 SqlSession 相似。你也许会发现,在这个水平上管理太多的资源的话会失控。保持简单,将 映射器放在方法范围内。下面的示例就展示了这个实践:\r\n```\r\nSqlSession session = sqlSessionFactory.openSession();\r\ntry {\r\n  BlogMapper mapper = session.getMapper(BlogMapper.class);\r\n  // do work\r\n} finally {\r\n  session.close();\r\n}\r\n```\r\n\r\n##### 5、重要 Object lifecycle and Dependency Injection Frameworks\r\nDependency Injection frameworks can create thread safe, transactional SqlSessions and mappers and inject them directly into your beans so you can just forget about their lifecycle. You may want to have a look at MyBatis-Spring or MyBatis-Guice sub-projects to know more about using MyBatis with DI frameworks.\r\n', '0', '1', null, 'post', 'publish', null, '1', '1', '1', '1', '0');
INSERT INTO `contents` VALUES ('6', '给我二哥', '6', '1508740405', '1508740405', '<!--markdown-->123', '0', '1', null, 'page', 'publish', null, '0', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for fields
-- ----------------------------
DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `cid` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `str_value` text,
  `int_value` int(10) DEFAULT '0',
  `float_value` float DEFAULT '0',
  PRIMARY KEY (`cid`,`name`),
  KEY `int_value` (`int_value`),
  KEY `float_value` (`float_value`)
);

-- ----------------------------
-- Records of fields
-- ----------------------------

-- ----------------------------
-- Table structure for metas
-- ----------------------------
DROP TABLE IF EXISTS `metas`;
CREATE TABLE `metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `count` int(10) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
);

-- ----------------------------
-- Records of metas
-- ----------------------------
INSERT INTO `metas` VALUES ('1', '数据库', 'default', 'category', '数据库相关文章', '3', '1', '0');
INSERT INTO `metas` VALUES ('2', 'java', 'java', 'tag', null, '1', '0', '0');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `name` varchar(32) NOT NULL,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`name`,`user`)
);

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('theme', '0', 'default');
INSERT INTO `options` VALUES ('theme:default', '0', 'a:2:{s:7:\"logoUrl\";N;s:12:\"sidebarBlock\";a:5:{i:0;s:15:\"ShowRecentPosts\";i:1;s:18:\"ShowRecentComments\";i:2;s:12:\"ShowCategory\";i:3;s:11:\"ShowArchive\";i:4;s:9:\"ShowOther\";}}');
INSERT INTO `options` VALUES ('timezone', '0', '28800');
INSERT INTO `options` VALUES ('lang', '0', null);
INSERT INTO `options` VALUES ('charset', '0', 'UTF-8');
INSERT INTO `options` VALUES ('contentType', '0', 'text/html');
INSERT INTO `options` VALUES ('gzip', '0', '0');
INSERT INTO `options` VALUES ('generator', '0', 'Typecho 1.0/14.10.10');
INSERT INTO `options` VALUES ('title', '0', 'Skyfree Blog');
INSERT INTO `options` VALUES ('description', '0', '不忘初心，砥砺前行');
INSERT INTO `options` VALUES ('keywords', '0', 'typecho,php,blog');
INSERT INTO `options` VALUES ('rewrite', '0', '0');
INSERT INTO `options` VALUES ('frontPage', '0', 'recent');
INSERT INTO `options` VALUES ('frontArchive', '0', '0');
INSERT INTO `options` VALUES ('commentsRequireMail', '0', '1');
INSERT INTO `options` VALUES ('commentsWhitelist', '0', '0');
INSERT INTO `options` VALUES ('commentsRequireURL', '0', '0');
INSERT INTO `options` VALUES ('commentsRequireModeration', '0', '0');
INSERT INTO `options` VALUES ('plugins', '0', 'a:2:{s:9:\"activated\";a:0:{}s:7:\"handles\";a:0:{}}');
INSERT INTO `options` VALUES ('commentDateFormat', '0', 'F jS, Y \\a\\t h:i a');
INSERT INTO `options` VALUES ('siteUrl', '0', 'http://123.207.122.21');
INSERT INTO `options` VALUES ('defaultCategory', '0', '1');
INSERT INTO `options` VALUES ('allowRegister', '0', '0');
INSERT INTO `options` VALUES ('defaultAllowComment', '0', '1');
INSERT INTO `options` VALUES ('defaultAllowPing', '0', '1');
INSERT INTO `options` VALUES ('defaultAllowFeed', '0', '1');
INSERT INTO `options` VALUES ('pageSize', '0', '5');
INSERT INTO `options` VALUES ('postsListSize', '0', '10');
INSERT INTO `options` VALUES ('commentsListSize', '0', '10');
INSERT INTO `options` VALUES ('commentsHTMLTagAllowed', '0', null);
INSERT INTO `options` VALUES ('postDateFormat', '0', 'Y-m-d');
INSERT INTO `options` VALUES ('feedFullText', '0', '1');
INSERT INTO `options` VALUES ('editorSize', '0', '350');
INSERT INTO `options` VALUES ('autoSave', '0', '0');
INSERT INTO `options` VALUES ('markdown', '0', '1');
INSERT INTO `options` VALUES ('commentsMaxNestingLevels', '0', '5');
INSERT INTO `options` VALUES ('commentsPostTimeout', '0', '2592000');
INSERT INTO `options` VALUES ('commentsUrlNofollow', '0', '1');
INSERT INTO `options` VALUES ('commentsShowUrl', '0', '1');
INSERT INTO `options` VALUES ('commentsMarkdown', '0', '0');
INSERT INTO `options` VALUES ('commentsPageBreak', '0', '0');
INSERT INTO `options` VALUES ('commentsThreaded', '0', '1');
INSERT INTO `options` VALUES ('commentsPageSize', '0', '20');
INSERT INTO `options` VALUES ('commentsPageDisplay', '0', 'last');
INSERT INTO `options` VALUES ('commentsOrder', '0', 'ASC');
INSERT INTO `options` VALUES ('commentsCheckReferer', '0', '1');
INSERT INTO `options` VALUES ('commentsAutoClose', '0', '0');
INSERT INTO `options` VALUES ('commentsPostIntervalEnable', '0', '1');
INSERT INTO `options` VALUES ('commentsPostInterval', '0', '60');
INSERT INTO `options` VALUES ('commentsShowCommentOnly', '0', '0');
INSERT INTO `options` VALUES ('commentsAvatar', '0', '1');
INSERT INTO `options` VALUES ('commentsAvatarRating', '0', 'G');
INSERT INTO `options` VALUES ('commentsAntiSpam', '0', '1');
INSERT INTO `options` VALUES ('routingTable', '0', 'a:26:{i:0;a:25:{s:5:\"index\";a:6:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:8:\"|^[/]?$|\";s:6:\"format\";s:1:\"/\";s:6:\"params\";a:0:{}}s:7:\"archive\";a:6:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:13:\"|^/blog[/]?$|\";s:6:\"format\";s:6:\"/blog/\";s:6:\"params\";a:0:{}}s:2:\"do\";a:6:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:32:\"|^/action/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:10:\"/action/%s\";s:6:\"params\";a:1:{i:0;s:6:\"action\";}}s:4:\"post\";a:6:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:26:\"|^/archives/([0-9]+)[/]?$|\";s:6:\"format\";s:13:\"/archives/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:10:\"attachment\";a:6:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:28:\"|^/attachment/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/attachment/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:8:\"category\";a:6:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:25:\"|^/category/([^/]+)[/]?$|\";s:6:\"format\";s:13:\"/category/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:3:\"tag\";a:6:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:20:\"|^/tag/([^/]+)[/]?$|\";s:6:\"format\";s:8:\"/tag/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:6:\"author\";a:6:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:24:\"|^/author/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/author/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"uid\";}}s:6:\"search\";a:6:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:23:\"|^/search/([^/]+)[/]?$|\";s:6:\"format\";s:11:\"/search/%s/\";s:6:\"params\";a:1:{i:0;s:8:\"keywords\";}}s:10:\"index_page\";a:6:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/page/([0-9]+)[/]?$|\";s:6:\"format\";s:9:\"/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:12:\"archive_page\";a:6:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:27:\"|^/blog/page/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/blog/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:13:\"category_page\";a:6:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:34:\"|^/category/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:16:\"/category/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:8:\"tag_page\";a:6:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:29:\"|^/tag/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/tag/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:11:\"author_page\";a:6:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/author/([0-9]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/author/%s/%s/\";s:6:\"params\";a:2:{i:0;s:3:\"uid\";i:1;s:4:\"page\";}}s:11:\"search_page\";a:6:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:32:\"|^/search/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/search/%s/%s/\";s:6:\"params\";a:2:{i:0;s:8:\"keywords\";i:1;s:4:\"page\";}}s:12:\"archive_year\";a:6:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:19:\"|^/([0-9]{4})[/]?$|\";s:6:\"format\";s:4:\"/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"year\";}}s:13:\"archive_month\";a:6:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:30:\"|^/([0-9]{4})/([0-9]{2})[/]?$|\";s:6:\"format\";s:7:\"/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:5:\"month\";}}s:11:\"archive_day\";a:6:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:41:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})[/]?$|\";s:6:\"format\";s:10:\"/%s/%s/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";}}s:17:\"archive_year_page\";a:6:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/([0-9]{4})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:12:\"/%s/page/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:4:\"page\";}}s:18:\"archive_month_page\";a:6:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:44:\"|^/([0-9]{4})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/%s/%s/page/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:4:\"page\";}}s:16:\"archive_day_page\";a:6:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:55:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"/%s/%s/%s/page/%s/\";s:6:\"params\";a:4:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";i:3;s:4:\"page\";}}s:12:\"comment_page\";a:6:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:36:\"|^(.+)/comment\\-page\\-([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"%s/comment-page-%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:11:\"commentPage\";}}s:4:\"feed\";a:6:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";s:4:\"regx\";s:17:\"|^/feed(.*)[/]?$|\";s:6:\"format\";s:7:\"/feed%s\";s:6:\"params\";a:1:{i:0;s:4:\"feed\";}}s:8:\"feedback\";a:6:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:29:\"|^(.+)/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:5:\"%s/%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:4:\"type\";}}s:4:\"page\";a:6:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/([^/]+)\\.html[/]?$|\";s:6:\"format\";s:8:\"/%s.html\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}}s:5:\"index\";a:3:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:7:\"archive\";a:3:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:2:\"do\";a:3:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";}s:4:\"post\";a:3:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"attachment\";a:3:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"category\";a:3:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:3:\"tag\";a:3:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"author\";a:3:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"search\";a:3:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"index_page\";a:3:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_page\";a:3:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"category_page\";a:3:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"tag_page\";a:3:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"author_page\";a:3:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"search_page\";a:3:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_year\";a:3:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"archive_month\";a:3:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"archive_day\";a:3:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:17:\"archive_year_page\";a:3:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:18:\"archive_month_page\";a:3:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:16:\"archive_day_page\";a:3:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"comment_page\";a:3:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:4:\"feed\";a:3:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";}s:8:\"feedback\";a:3:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";}s:4:\"page\";a:3:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}}');
INSERT INTO `options` VALUES ('actionTable', '0', 'a:0:{}');
INSERT INTO `options` VALUES ('panelTable', '0', 'a:0:{}');
INSERT INTO `options` VALUES ('attachmentTypes', '0', '@image@');
INSERT INTO `options` VALUES ('secret', '0', 'LIpLGm2MMssFWSWk4I$nPkvJxzYa)NHL');

-- ----------------------------
-- Table structure for relationships
-- ----------------------------
DROP TABLE IF EXISTS `relationships`;
CREATE TABLE `relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
);

-- ----------------------------
-- Records of relationships
-- ----------------------------
INSERT INTO `relationships` VALUES ('1', '1');
INSERT INTO `relationships` VALUES ('3', '1');
INSERT INTO `relationships` VALUES ('4', '1');
INSERT INTO `relationships` VALUES ('4', '2');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `screenName` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `group` varchar(16) DEFAULT 'visitor',
  `authCode` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `mail` (`mail`)
);

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '$P$BnkGdvNaOOLM.z9TU9bzJ7sfdCmmB1.', 'nl_zhuce@163.com', 'http://www.typecho.org', 'admin', '1507950419', '1508742765', '1508688072', 'administrator', '59cc766f0a796c5f83d54d57a04c6ff7');
INSERT INTO `users` VALUES ('2', 'pingping', '$P$BEzA/EZGGs3MXTbGgZJzJAw1aYr6TJ/', 'hxp_study@sina.com', null, 'pp', '1508230360', '0', '0', 'administrator', null);
