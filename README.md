# Codex 政务工作台主题

> 面向 Windows + Codex Dream Skin 的政务办公风格主题。

![政务工作台的新建任务效果图](docs/images/new-task-preview.png)

将政务红、暖金色横幅、工作台卡片和可互动的政务助手带入 Codex。主题保留原生的聊天与输入体验，并为不同分辨率自动调整布局。

**最新版本：v1.3.6** — 增加新版 Codex 桌面端的语义界面定位兼容：当内部 CSS 类名更新时，主题会使用页面主区域和导航区域作为安全回退，不再因单个旧类名失效而自动退出。

## 亮点

| 功能 | 说明 |
| --- | --- |
| 政务工作台 | 新建任务页展示“人民的 AI，智慧办公”横幅和四项办公功能卡。 |
| 双场景布局 | 新建任务使用工作台；进入已有聊天后保留政务背景和正常对话空间。 |
| 原生任务宠物 | 保留 Codex 原生的任务状态宠物，不再由皮肤额外叠加第二个宠物。 |
| 自适应界面 | 宽屏完整展示，中等窗口自动缩放；窄屏或矮窗口自动回退 Codex 原生新建任务页，避免遮挡聊天框。 |
| 安全安装 | 安装前会备份当前 Dream Skin 引擎和主题，方便恢复。 |

## 工作台视觉

![工作台横幅与四项功能卡](theme/new-task-dashboard-compact.png)

## 环境要求

- Windows 电脑
- 已安装 **Codex Dream Skin**
- 已安装 Codex 桌面端

## 安装

1. 在右侧 [Releases](../../releases) 下载最新 ZIP 文件并解压。
2. 双击 `Install-CodexGovernmentWorkbench.cmd`。
3. 安装器会备份现有 Dream Skin 文件，导入主题并重启 Codex。
4. 点击 Codex 左侧的“新建任务”，即可看到政务工作台。

> 若 Windows 弹出脚本安全提示，请确认 ZIP 来自本仓库的 Releases 页面后再运行。

## 宠物显示

主题不再创建额外的悬浮宠物。Codex 任务运行时会按应用自身规则显示原生宠物和状态气泡，因此不会出现两个相同角色重叠的情况。

## 自适应策略

| 窗口条件 | 显示方式 |
| --- | --- |
| 宽屏桌面 | 展示完整工作台。 |
| 中等窗口 | 等比缩小，保持工作台与聊天输入框之间的安全间距。 |
| 宽度不超过 900px 或高度不超过 640px | 回退到 Codex 原生新建任务页，保证输入框可用。 |

## 备份与恢复

安装器把旧版本备份到：

`%LOCALAPPDATA%\CodexDreamSkin\backups\government-workbench-时间戳`

如需恢复，可关闭 Codex 后将备份中的 `active-theme` 与引擎文件复制回对应目录。

## 目录说明

```text
theme/         主题配置、背景和工作台图片
engine-patch/  与主题配套的 Dream Skin 兼容补丁
Install-*.cmd  双击安装入口
Install-*.ps1  安装与备份脚本
```

## 说明

这是独立的社区主题包，不是 OpenAI、GitHub 或 Codex 的官方产品。仓库不包含 Codex 本体、账号信息、对话记录、日志或本机运行状态；详见 [NOTICE.md](NOTICE.md)。使用或二次分享素材前，请确认你拥有相应的使用权。
