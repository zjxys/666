# Supabase 留言板 + 点赞

一个纯静态网页,接入 Supabase 实现留言板和点赞功能,适合部署到 GitHub Pages。

## 使用步骤

### 1. 创建 Supabase 项目

- 去 [supabase.com](https://supabase.com) 注册并新建项目
- 进入 Project Settings → API,拿到:
  - **Project URL** (如 `https://xxxx.supabase.co`)
  - **anon public key** (一长串 `eyJ...`)

### 2. 建表

在 Supabase SQL Editor 中运行 `supabase-schema.sql` 里的 SQL。

### 3. 修改代码

打开 `index.html`,找到这两行,替换成你自己的密钥:

```js
const SUPABASE_URL = "https://YOUR_PROJECT.supabase.co";
const SUPABASE_ANON_KEY = "YOUR_ANON_KEY";
```

### 4. 部署到 GitHub Pages

```bash
git add .
git commit -m "添加留言板和点赞功能"
git push
```

然后在 GitHub 仓库 → Settings → Pages → Source 选 main 分支,几分钟后即可访问。

## 功能

- 留言板:发留言、实时显示新留言、历史留言加载
- 点赞:计数显示、防重复点击(localStorage 去重)
- 防 XSS:用户输入自动转义
