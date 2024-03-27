# Journal任务规划项目

## 使用技术

- C++
- Qml
- Mysql

## 项目历程

#### 2024-01-28

完成初始界面布局，规划

![image-20240129010040853](https://gitee.com/renmale-sztu/image/raw/master/202401290100187.png)

#### 2024-02-07

实现Tabview顶部导航栏效果，了解QML多组件鼠标穿透问题

![image-20240208011710211](https://gitee.com/renmale-sztu/image/raw/master/202402080117436.png)

#### 2024-02-10

- 完成重构项目结构，改变qrc方式为自定义模组块
- Tabview导航栏反复点击出现颜色bug

#### 2024-02-11

- 修改Tabview bug
- 完成Taskview大致布局

![image-20240211170447557](https://gitee.com/renmale-sztu/image/raw/master/202402111704851.png)

#### 2024-02-23

- 完成数据库设计
- 初步实现目标管理展示界面
- 通过信号实现Tabview页面大小变化

![image-20240327144152334](https://gitee.com/renmale-sztu/image/raw/master/202403271442540.png)

---

数据库初步规划

- 任务表

| 关键字 |     类型     |                      含义                      |     约束      |
| :----: | :----------: | :--------------------------------------------: | :-----------: |
|   id   |     INT      |                      序号                      |  主键，自增   |
|  name  | VARCHAR(100) |                    任务名称                    |     非空      |
|  plan  |    JSON?     | 利用JSON存放数组，以标识该任务属于**哪些计划** |               |
| start  |     DATA     |           任务开始时间/可精确到时分            |    非空？     |
|  end   |     DATA     |                  任务结束时间                  |               |
| state  |   TINYINT    |                    任务状态                    | 非空，默认为0 |
| delete |   TINYINT    |                   是否被删除                   |               |

- 计划表/目标管理/小目标表

| 关键字 |     类型     | 含义 | 约束 |
| :----: | :----------: | :--: | :--: |
|   id   |     INT      |      |      |
|  name  | VARCHAR(100) |      |      |
|  plan  |     INT      |      |      |
| start  |     DATA     |      |      |
|  end   |     DATA     |      |      |
| state  |   TINYINT    |      |      |
| delete |   TINYINT    |      |      |

- 大目标表
- 习惯表