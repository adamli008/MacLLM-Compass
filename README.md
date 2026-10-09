# MacModel Guide (Mac 模型指南)

**MacModel Guide** 是一款专门针对 Apple Silicon（M1 至 M6 芯片系列）Mac 统一内存架构而设计的端侧本地大模型智能选型与推荐指南。

该系统基于 **Python/Flask** 精心重构，完全剥离了原版在线版本的 Email 收集与人机验证（CAPTCHA）机制，是一款 100% 保护隐私、开箱即用的离线端侧助手。

---

## 🌟 核心特色与功能设计

### 1. 极致利用：最大规格 512GB 支持与大参数模型推荐
* **支持 512GB 顶奢统一内存**：完美支持并匹配 Mac 全系列（包括 Ultra 与多芯片互联规格）的 512GB 统一内存选项。
* **千亿巨无霸模型推荐**：针对 96GB 至 512GB 物理内存，重磅引入了 **Qwen 3.6 400B**、**Llama 4 400B**、**Llama 4 130B** 等超大尺寸的本地模型。
* **硬件占满与降序排列**：模型候选按照权重大小（GB 体积）**从大到小（Top 10）降序排列**，首要保障发挥 Mac 顶级统一内存的高带宽吞吐极限！

### 2. 阿里旗舰首选：Qwen 3.6 完美推荐
* 在同一或相近的硬件尺寸分组内，**Qwen 3.6 系列旗舰**（110B, 72B, 32B, 14B, 7B）享有**最高优先级推荐**。
* 同级内 Qwen 模型自动置顶，小模型自动优雅沉底，视野极其开阔。

### 3. Apple 官方评估标准合规
* 推荐范围严格锁定在 **Apple Careers AIML Data Scientist Evaluation** 招聘页面推荐的开放模型家族：
  * **Llama** (3 / 3.1 / 3.2 / 3.3 / 4)
  * **Gemma** (2 / 3 / 4)
  * **Mistral** (Mistral, Ministral, Magistral)
  * **Phi** (Phi-3 / Phi-4)
  * **OpenELM / ELM**, **DCLM**, **AFM** (Apple 原生模型)

### 4. 100% 根除 404 错误与动态重定向
* 集成智能 URL 重定向映射器，自动拦截未来新型号占位符，无缝映射至当前 Hugging Face Hub 上真实可用的官方旗舰活跃仓库，保障所有链接 **100% 顺畅秒开**！

### 5. 双重严苛发布日期过滤（半年内发布）
* 设定了严格的 **6 个月发布期过滤**。所有过往老型号模型均已被严格阻断，仅展示最具前沿性能的最新大作。

### 6. 100% 离线数据管理（管理我的需求）
* 全新开发了 **“管理我的需求”** 本地仪表盘。可读取本地 `local_requests.txt` 请求历史并渲染为优雅的 Badge 卡片。
* 提供一键全毁式清除，数据绝对不出本地，零网络上传，完全保障隐私。

### 7. 本地模型对话沙箱 (Playground)
* 内置交互式 Chat Playground，可无缝代理并测试您在本地运行的 API 服务（如 LM Studio, MLX-LM 等在 `http://192.168.1.5:8000/v1` 运行的 Qwen 3.6 模型）。

---

## 🛠 依赖条件与环境准备

项目推荐在 **macOS** 平台下本地加载，需要满足以下极简环境：

1. **Python 运行环境**：
   * Python 3.9 或更高版本（推荐 Python 3.11+）
2. **三方核心库依赖**：
   * `Flask` (轻量级 Web 容器)
   * `requests` (用于 Hugging Face 实时 API 请求)
3. **极简依赖一键安装**：
   ```bash
   pip3 install flask requests
   ```

---

## 🚀 启动与运行步骤

1. **进入发布目录**：
   ```bash
   cd outputs/
   ```
2. **运行服务程序**：
   可以使用提供的 shell 脚本一键拉起：
   ```bash
   chmod +x run.sh
   ./run.sh
   ```
   或者直接使用 Python 启动：
   ```bash
   python3 app.py
   ```
3. **本地访问**：
   打开浏览器，访问：
   * 选模型主页面：[http://127.0.0.1:5001/start/](http://127.0.0.1:5001/start/)
   * 结果范例展示：[http://127.0.0.1:5001/example/](http://127.0.0.1:5001/example/)
   * 离线需求管理：[http://127.0.0.1:5001/manage-request/](http://127.0.0.1:5001/manage-request/)
   * 本地对话沙箱：[http://127.0.0.1:5001/playground/](http://127.0.0.1:5001/playground/)

---

## 📁 目录结构树

```text
outputs/
├── app.py                  # 核心 Flask 后端控制引擎、智能排序算法与重定向映射器
├── run.sh                  # 运行服务的快捷一键启动脚本
├── models_db.json          # 95 款合规离线候选模型的高阶备份数据库
├── local_requests.txt      # 安全存储在用户本地的筛选请求日志（用于需求管理）
├── static/
│   └── _astro/             # 主流前端 Astro CSS 渲染与 JS 组件压缩包
└── templates/
    ├── index.html          # 系统着陆欢迎页
    ├── start_page.html     # 主线：芯片、内存及用途筛选主界面
    ├── example.html        # 简体汉化高精结果效果范例展示页
    ├── playground.html     # 端侧 LM 本地 API 代理对话 Playground
    └── manage_request.html # “管理我的需求”离线本地需求控制面板
```

---

## 🔒 隐私合规声明

作为完全私有化部署的产品：
1. 我们**不收集**任何您的电子邮件（已完全剔除填写邮箱逻辑）。
2. 我们**不使用**任何第三方跟踪与人机校验 API（已完全剔除 Turnstile 等第三方验证机制）。
3. 网页底部已被彻底精简，**删除了所有带有第三方收集和溯源的数据链接**，所有的请求和对话均在您的本机的私有内存中流转！

# MacLLM-Compass
