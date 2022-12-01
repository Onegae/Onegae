--
-- Rooms
--

-- Table
create table if not exists rooms (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  content text default null,
  ts timestamptz default now()
);

-- Realtime
alter table
  rooms replica identity full;

-- Data
insert into rooms 
  (id, name, content)
values
  ('2f47c09b-57f5-4494-adfa-2bec0aa391a6', 'Евгений Онегин', 'Вымышленный персонаж. Татьяне написал.'),
on conflict on constraint rooms_pkey 
do nothing;

--
-- Users
--

-- Table
create table if not exists users (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  ts timestamptz default now() not null
);

-- Realtime
alter table
  users replica identity full;

-- Data
insert into users 
  (id, name)
values
  ('29ffbaf6-200e-4383-a024-23b795afee3b', 'Евгений'),
  ('f5043712-712b-40b5-8a34-08b621a68c0f', 'Татьяна'),
on conflict on constraint users_pkey 
do nothing;

--
-- Messages
--

-- Table
create table if not exists messages (
  id uuid default uuid_generate_v4() primary key,
  room_id uuid references rooms (id) on delete cascade not null,
  user_id uuid references users (id) on delete cascade not null,
  content text not null,
  ts timestamptz default now() not null
);

-- Realtime
alter table
  messages replica identity full;

-- Data
insert into messages 
  (room_id, user_id, content)
values  
  ('2f47c09b-57f5-4494-adfa-2bec0aa391a6', '29ffbaf6-200e-4383-a024-23b795afee3b', 'Хотел бы я тебе представить'),
  ('2f47c09b-57f5-4494-adfa-2bec0aa391a6', '29ffbaf6-200e-4383-a024-23b795afee3b', 'Святой исполненной мечты'),
  ('2f47c09b-57f5-4494-adfa-2bec0aa391a6', '29ffbaf6-200e-4383-a024-23b795afee3b', 'Поэзии живой и ясной'),
  ('2f47c09b-57f5-4494-adfa-2bec0aa391a6', 'f5043712-712b-40b5-8a34-08b621a68c0f', 'Что?'),
  ('2f47c09b-57f5-4494-adfa-2bec0aa391a6', '29ffbaf6-200e-4383-a024-23b795afee3b', 'Бытописания Земли'),
  ('2f47c09b-57f5-4494-adfa-2bec0aa391a6', 'f5043712-712b-40b5-8a34-08b621a68c0f', 'Давай просто останемся друзьями)');


--
-- Storage
--

-- Bucket
insert into
  storage.buckets (id, name)
values
  ('avatars', 'avatars'),
  ('uploads', 'uploads')
on conflict on constraint buckets_pkey 
do nothing;

-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
