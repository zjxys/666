-- ====== 留言板表 ======
create table if not exists guestbook (
  id bigint primary key generated always as identity,
  name text not null,
  message text not null,
  created_at timestamptz not null default now()
);

-- ====== 点赞表 ======
create table if not exists article_like (
  id bigint primary key generated always as identity,
  article text not null unique,
  like_count bigint not null default 0
);

-- ====== 开启 RLS (行级安全) ======
alter table guestbook enable row level security;
alter table article_like enable row level security;

-- ====== 留言板策略:允许匿名读取和插入 ======
create policy "guestbook public read" on guestbook
  for select using (true);

create policy "guestbook public insert" on guestbook
  for insert with check (true);

-- ====== 点赞策略:允许匿名读取、插入、更新 ======
create policy "likes public read" on article_like
  for select using (true);

create policy "likes public insert" on article_like
  for insert with check (true);

create policy "likes public update" on article_like
  for update using (true);

-- ====== 开启 Realtime (实时订阅) ======
-- 在 Supabase Dashboard → Database → Replication 里,
-- 确认 guestbook 和 article_like 表的 INSERT 事件已开启
