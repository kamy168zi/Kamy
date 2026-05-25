# gongzhonghao-typeset 用户使用手册

这是一个把 Markdown 文章排成微信公众号 HTML 的 Skill。你可以先写文章，再用它生成一个可预览、可微调、可复制到公众号后台的 HTML 页面。

当前默认品牌名是 **佳敏在折腾**，默认主题是 **温暖棕**。

## 1. 日常使用流程

1. 准备一篇 Markdown 文章，例如：

```text
D:\codexword\公众号排版\my-article.md
```

2. 在 `D:\codexword\公众号排版` 目录运行：

```powershell
$env:PYTHONUTF8='1'
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --out preview.html
```

3. 打开生成的 `preview.html`。

4. 在右侧控制面板调整品牌名、主色、字号、行高、图片圆角、图片边框等。

5. 点击页面右侧的 **复制公众号 HTML**。

6. 打开微信公众号后台编辑器，直接粘贴。

## 2. 三套配色主题

目前有三套主题：

| 主题 | 文件 | 适合内容 |
| --- | --- | --- |
| 温暖棕 | `themes\brown.json` | 生活方式、读书笔记、手作、个人随笔 |
| 沉稳绿 | `themes\editorial.json` | 深度文章、经验总结、知识型内容 |
| 清新蓝 | `themes\fresh.json` | 轻科普、工具分享、日常记录 |

默认不指定主题时，使用温暖棕。

## 3. 如何切换主题

### 温暖棕，默认主题

```powershell
$env:PYTHONUTF8='1'
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --out preview.html
```

也可以显式指定：

```powershell
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --theme vantasma-toolkit\skills\gongzhonghao-typeset\themes\brown.json --out preview-brown.html
```

### 沉稳绿

```powershell
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --theme vantasma-toolkit\skills\gongzhonghao-typeset\themes\editorial.json --out preview-green.html
```

### 清新蓝

```powershell
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --theme vantasma-toolkit\skills\gongzhonghao-typeset\themes\fresh.json --out preview-blue.html
```

## 4. 推荐的文章格式

建议文章开头写 frontmatter，方便自动生成标题区：

```markdown
---
标题: 文章标题
副标题: 一句话说明这篇文章的价值
创建时间: 2026.05.25
标签:
  - 公众号
  - 读书笔记
  - 个人成长
---
```

正文示例：

```markdown
**1. 第一部分标题**

这是正文段落。可以使用 **加粗**、==高亮==、`inline code`，也可以写「按钮胶囊」。

### 小标题

- 列表项一
- 列表项二

> 这里是一段引用。

![图片说明](https://example.com/image.jpg)

---

## 写在最后

这里写结尾。
```

## 5. Markdown 对应效果

| 写法 | 效果 |
| --- | --- |
| `**1. 标题**` | 章节标题，左侧大编号，编号颜色跟随主题主色 |
| `## 标题` | 章节标题；`## 写在最后` 会使用结尾段落样式 |
| `### 标题` | 小标题，前面带主题色斜杠 |
| `**粗体**` | 加粗强调 |
| `==高亮==` | 浅色高亮 |
| `` `代码` `` | 行内代码样式 |
| `「文字」` | 胶囊按钮样式 |
| `- 列表项` | 无序列表 |
| `1. 列表项` | 有序列表 |
| `> 引用` | 左侧细线引用 |
| `![说明](图片地址)` | 图片 + 图注 |
| `---` | 分割线 |

## 6. 图片使用建议

网络图片可以直接写：

```markdown
![封面图](https://example.com/cover.jpg)
```

本地图片建议和 Markdown 放在同一个目录，然后写文件名：

```markdown
![封面图](cover.jpg)
```

如果图片文件名包含 `全图`、`长图`、`scrollbox` 或 `longshot`，会自动使用长图滚动框。

## 7. 右侧控制面板怎么用

预览页右侧可以直接调：

| 控件 | 作用 |
| --- | --- |
| 品牌名 | 修改页首和页尾的品牌文字 |
| 章节小戳 | 修改章节编号旁边的小字，默认留空，需要时再填写 |
| 期号 | 修改 `VOL.` 后面的数字 |
| 主色 | 影响章节编号、小标题、列表点、按钮等 |
| 高亮色 | 影响 `==高亮==` 的底色 |
| 辅助色 | 影响局部装饰色 |
| 正文字色 | 影响正文文字 |
| 字号 / 行高 | 调整正文阅读节奏 |
| 图片圆角 / 边框 / 阴影 | 调整图片展示风格 |

调完以后，点击 **复制公众号 HTML**，再粘贴到微信公众号后台。

## 8. 常用命令

生成默认温暖棕预览：

```powershell
$env:PYTHONUTF8='1'
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --out preview.html
```

不自动打开浏览器：

```powershell
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --no-open --out preview.html
```

指定期号：

```powershell
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --vol 12 --out preview.html
```

生成没有右侧控制面板的裸 HTML：

```powershell
python vantasma-toolkit\skills\gongzhonghao-typeset\scripts\cli.py my-article.md --no-panel --out article.html
```

## 9. 和 Claude 或 Codex 对话时怎么说

你可以直接这样说：

```text
帮我把 my-article.md 排版成公众号，使用默认温暖棕主题。
```

```text
把 my-article.md 用清新蓝主题生成公众号预览。
```

```text
帮我把这篇文章改成适合公众号发布的 Markdown，然后用沉稳绿主题排版。
```

## 10. 常见问题

### 运行后中文乱码怎么办？

先执行：

```powershell
$env:PYTHONUTF8='1'
```

再运行排版命令。

### 生成后没有自动打开浏览器怎么办？

直接手动打开生成的 HTML 文件即可，例如 `preview.html`。

### 粘贴到公众号后样式不完整怎么办？

优先使用预览页右侧的 **复制公众号 HTML** 按钮，不要直接复制浏览器地址或复制源代码。

### 想改默认主题怎么办？

默认主题文件是：

```text
vantasma-toolkit\skills\gongzhonghao-typeset\theme.json
```

现在它已经设为温暖棕。以后要改默认品牌名、主色、字号、行高，都可以改这个文件。

### 想新增第四套主题怎么办？

复制现有主题文件，例如：

```text
themes\brown.json
```

改名为：

```text
themes\my-theme.json
```

然后修改里面的 `brand`、`colors` 和 `typography`。使用时加上：

```powershell
--theme vantasma-toolkit\skills\gongzhonghao-typeset\themes\my-theme.json
```
