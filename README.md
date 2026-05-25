# Kamy

佳敏的个人工具集。

这里会整理我自己日常使用的 Claude / Codex Skills、写作工具、排版模板和自动化脚本。

## Skills

### gongzhonghao-typeset

公众号排版 Skill。把 Markdown 文章一键排成可以粘贴到微信公众号后台的 HTML。

当前特性：

- 默认品牌名：佳敏在折腾
- 默认主题：温暖棕
- 主题：温暖棕 / 沉稳绿 / 清新蓝
- 支持 Markdown 转公众号 HTML
- 支持右侧控制面板实时调色
- 支持字号、行高、图片圆角、图片边框等微调
- 支持一键复制公众号 HTML

源码目录：

```text
skills/gongzhonghao-typeset
```

可下载压缩包：

```text
releases/gongzhonghao-typeset-skill-20260525.zip
```

## 安装方式

### 一键安装口令

Windows PowerShell 安装到 Claude / Codex：

```powershell
irm https://raw.githubusercontent.com/kamy168zi/Kamy/main/install.ps1 | iex
```

Windows PowerShell 安装到 OpenClaw：

```powershell
irm https://raw.githubusercontent.com/kamy168zi/Kamy/main/install.ps1 | iex -Target openclaw
```

Windows PowerShell 安装到自定义工具目录：

```powershell
irm https://raw.githubusercontent.com/kamy168zi/Kamy/main/install.ps1 | iex -SkillRoot "$HOME\.你的工具名\skills"
```

Mac / Linux 安装到 Claude / Codex：

```bash
curl -fsSL https://raw.githubusercontent.com/kamy168zi/Kamy/main/install.sh | bash
```

Mac / Linux 安装到 OpenClaw：

```bash
curl -fsSL https://raw.githubusercontent.com/kamy168zi/Kamy/main/install.sh | bash -s openclaw
```

Mac / Linux 安装到自定义工具目录：

```bash
curl -fsSL https://raw.githubusercontent.com/kamy168zi/Kamy/main/install.sh | bash -s custom "$HOME/.你的工具名/skills"
```

安装完成后，重启 Claude / Codex / OpenClaw。

### 手动安装

下载或复制 `skills/gongzhonghao-typeset` 文件夹到：

```text
~/.claude/skills/gongzhonghao-typeset
```

Windows 示例：

```text
C:\Users\你的用户名\.claude\skills\gongzhonghao-typeset
```

安装后重启 Claude / Codex，或重新打开会话。

## 使用方式

默认温暖棕主题：

```powershell
$env:PYTHONUTF8='1'
python skills\gongzhonghao-typeset\scripts\cli.py my-article.md --out preview.html
```

沉稳绿主题：

```powershell
python skills\gongzhonghao-typeset\scripts\cli.py my-article.md --theme skills\gongzhonghao-typeset\themes\editorial.json --out preview-green.html
```

清新蓝主题：

```powershell
python skills\gongzhonghao-typeset\scripts\cli.py my-article.md --theme skills\gongzhonghao-typeset\themes\fresh.json --out preview-blue.html
```

更多说明见：

```text
skills/gongzhonghao-typeset/USER_GUIDE.md
```
