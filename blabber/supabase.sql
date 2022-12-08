--
-- Users
--
-- Table
create table if not exists users (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  bio text default null,
  avatar_url text default null,
  ts timestamptz default now() not null
);

-- Realtime
alter table
  users replica identity full;

-- Data
insert into
  users (id, name, bio, avatar_url)
values
  (
    '29ffbaf6-200e-4383-a024-23b795afee3b',
    'Евгений',
    'Евгений Онегин
--------------

В космос летал — Бога видел.

Из дома не выходил.

',
    'https://sun9-84.userapi.com/s/v1/ig2/HyqKo7E3GrHloPJHgO5nWs3ZTlAaUOLeUOIDYwc4aJLTuHlVAsVqgnxl_cCCourfdHpTNA4AKfGrqiYdFU4HKRB0.jpg?size=200x200&quality=95&crop=72,191,576,576&ava=1'
  ),
  (
    'f5043712-712b-40b5-8a34-08b621a68c0f',
    'Татьяна',
    null,
    null
  ) on conflict on constraint users_pkey do nothing;

--
-- Rooms
--
-- Table
create table if not exists rooms (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  description text default null,
  priest uuid references users (id) on delete cascade null,
  ts timestamptz default now()
);

-- Realtime
alter table
  rooms replica identity full;

-- Data
insert into
  rooms (id, name, description, priest)
values
  (
    '2f47c09b-57f5-4494-adfa-2bec0aa391a6',
    'Евгений Онегин',
    'Вымышленный персонаж. Татьяне написал.',
    '29ffbaf6-200e-4383-a024-23b795afee3b'
  ) on conflict on constraint rooms_pkey do nothing;

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
insert into
  messages (id, room_id, user_id, content, ts)
values
  (
    '7bc03aed-a095-4e0f-9866-d7964b3f3d4c',
    '2f47c09b-57f5-4494-adfa-2bec0aa391a6',
    '29ffbaf6-200e-4383-a024-23b795afee3b',
    'Хотел бы я тебе представить',
    '2022-12-07 20:02:42.000000+00'
  ),
  (
    '92143dc0-0657-4478-ac4b-f7c19541c373',
    '2f47c09b-57f5-4494-adfa-2bec0aa391a6',
    '29ffbaf6-200e-4383-a024-23b795afee3b',
    'Святой исполненной мечты',
    '2022-12-07 20:02:43.000000+00'
  ),
  (
    '353e915a-8dc3-4c1d-bf8b-46297805bf02',
    '2f47c09b-57f5-4494-adfa-2bec0aa391a6',
    '29ffbaf6-200e-4383-a024-23b795afee3b',
    'Поэзии живой и ясной',
    '2022-12-07 20:02:44.000000+00'
  ),
  (
    'a98e59d7-9d71-4015-b411-9c31035d237b',
    '2f47c09b-57f5-4494-adfa-2bec0aa391a6',
    'f5043712-712b-40b5-8a34-08b621a68c0f',
    'Что?',
    '2022-12-07 20:02:45.000000+00'
  ),
  (
    'eb468085-be2e-41a5-b564-edb9fd7c275f',
    '2f47c09b-57f5-4494-adfa-2bec0aa391a6',
    '29ffbaf6-200e-4383-a024-23b795afee3b',
    'Бытописания Земли',
    '2022-12-07 20:02:46.000000+00'
  ),
  (
    '0e5b5f9d-130d-4676-9e3f-83348647bfc2',
    '2f47c09b-57f5-4494-adfa-2bec0aa391a6',
    'f5043712-712b-40b5-8a34-08b621a68c0f',
    'Давай просто останемся друзьями)',
    '2022-12-07 20:02:47.000000+00'
  ) on conflict on constraint messages_pkey do nothing;

--
-- Storage
--
-- Bucket
insert into
  storage.buckets (id, name, public)
values
  ('uploads', 'uploads', true) on conflict on constraint buckets_pkey do nothing;

-- See https://supabase.com/docs/guides/storage#policy-examples for more details.