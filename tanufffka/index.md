---
unpkg:
  - https://unpkg.com/@supabase/supabase-js@2
js: |
  const room = '2f47c09b-57f5-4494-adfa-2bec0aa391a6'
  const uuid = 'f5043712-712b-40b5-8a34-08b621a68c0f'

  const client = supabase.createClient('https://iqpokkogrxcidfvvouaz.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlxcG9ra29ncnhjaWRmdnZvdWF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk1NjUyMDksImV4cCI6MTk4NTE0MTIwOX0.CqEo93msN9MeaCFrCVFtO8AorACl7Cm1rk3rTaGUgbA')

  const women = ['Почему ты мне не поставил лайк?', 'Что это за баба у тебя в друзьях?', 'Ты заметил, что я постриглась?', 'Я потолстела?', 'Тебе на меня плевать!', 'Ты думаешь только о себе!', 'Почему ты мне не даришь цветы?', 'Я обычно так не делаю!', 'Вот и общайся со своим компьютером!', 'Как ты думаешь, на что я обиделась?', 'Ты меня не любишь!', 'Развесели меня!', 'Твой друг уже машину купил!', 'Почему ты не поднимал трубку?', 'Я не обижаюсь, а делаю выводы!', 'Я тебе еще не надоела?', 'Это не смешно!', 'Ты никогда не виноват!', 'Все твои бывшие бл*ди!', 'Ты не понимаешь, что мне нужно!', 'Я не чувствую твоей любви!', 'Ясно, понятно!', 'Я не такая как все!', 'Расскажи мне что-нибудь интересное!', 'Лучше все сама сделаю!', 'Или гуляй со своими друзьями!', 'Все твои друзья алкаши!', 'У меня нормальное настроение!', 'А за что ты меня любишь?', 'Ты всем девушкам такое говоришь?', 'Мне нужна романтика!', 'Почему ты мне не даришь подарки?', 'Правильно мне про тебя говорили!', 'Ты не такой, как был раньше!', 'Мы не тр*х*емся, а занимаемся любовью!', 'Все ясно! Пока!', 'Ты не думаешь о нашем будущем!', 'Почему ты мне не перезвонил?', 'Ты ничего нового во мне не замечаешь?', 'Тебе с друзьями интереснее, чем со мной!', 'Я ноготь сломала!', 'Тебе пора повзрослеть!', 'У тебя есть время только на друзей!', 'Мне скучно! Придумай что-нибудь!', 'Ты с ней спал?', 'Ты выпил пива? Алкаш!', 'Ты не забыл какой сегодня день?', 'Не туда!', 'Ты со мной только ради секса!', 'Ой, все!']

  const random = () => women[Math.floor(Math.random() * women.length)]

  const first = setInterval(
    async () => await client.from('messages')
      .insert({ 
        content: random(), 
        room_id: room, 
        user_id: uuid
      }), 
    30000
  )
  
  const config = {
    config: { presence: { key: uuid } }
  }

  const channel = client.channel(room, config)
    .on('presence', { event: 'sync' }, (event) => {
      console.log(channel.presenceState())
    })
    
  channel.subscribe()

---

Болтовня
========

Инициализация
-------------

50 тупых фраз, которые произносит каждая женщина:

```js
const women = ['Почему ты мне не поставил лайк?', 'Что это за баба у тебя в друзьях?', 'Ты заметил, что я постриглась?', 'Я потолстела?', 'Тебе на меня плевать!', 'Ты думаешь только о себе!', 'Почему ты мне не даришь цветы?', 'Я обычно так не делаю!', 'Вот и общайся со своим компьютером!', 'Как ты думаешь, на что я обиделась?', 'Ты меня не любишь!', 'Развесели меня!', 'Твой друг уже машину купил!', 'Почему ты не поднимал трубку?', 'Я не обижаюсь, а делаю выводы!', 'Я тебе еще не надоела?', 'Это не смешно!', 'Ты никогда не виноват!', 'Все твои бывшие бл*ди!', 'Ты не понимаешь, что мне нужно!', 'Я не чувствую твоей любви!', 'Ясно, понятно!', 'Я не такая как все!', 'Расскажи мне что-нибудь интересное!', 'Лучше все сама сделаю!', 'Или гуляй со своими друзьями!', 'Все твои друзья алкаши!', 'У меня нормальное настроение!', 'А за что ты меня любишь?', 'Ты всем девушкам такое говоришь?', 'Мне нужна романтика!', 'Почему ты мне не даришь подарки?', 'Правильно мне про тебя говорили!', 'Ты не такой, как был раньше!', 'Мы не тр*х*емся, а занимаемся любовью!', 'Все ясно! Пока!', 'Ты не думаешь о нашем будущем!', 'Почему ты мне не перезвонил?', 'Ты ничего нового во мне не замечаешь?', 'Тебе с друзьями интереснее, чем со мной!', 'Я ноготь сломала!', 'Тебе пора повзрослеть!', 'У тебя есть время только на друзей!', 'Мне скучно! Придумай что-нибудь!', 'Ты с ней спал?', 'Ты выпил пива? Алкаш!', 'Ты не забыл какой сегодня день?', 'Не туда!', 'Ты со мной только ради секса!', 'Ой, все!']
```

Источник: <https://mport.ua/mix/760788-50-tupyh-fraz-kotorye-proiznosit-kazhdaja-zhencshina>

Реализация
----------

    curl -X POST https://iqpokkogrxcidfvvouaz.supabase.co/rest/v1/messages \
      -H 'Content-Type: application/json' \
      -H 'ApiKey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlxcG9ra29ncnhjaWRmdnZvdWF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk1NjUyMDksImV4cCI6MTk4NTE0MTIwOX0.CqEo93msN9MeaCFrCVFtO8AorACl7Cm1rk3rTaGUgbA' \
      -d '{"content":"🍪🎅🎄","room_id":"2f47c09b-57f5-4494-adfa-2bec0aa391a6"}'

Документация
------------

Распаковка библиотек в/на файле `_config.yml`:

    unpkg:
      - https://unpkg.com/@supabase/supabase-js@2
    js: console.log(supabase)

И на странице, если это ~~имеет значение~~ Front Matter:

    ---
    unpkg:
      - https://unpkg.com/@supabase/supabase-js@2
    js: console.log(supabase)
    ---

Визуализация
------------

Новогодние подарки:

- [x] Пределы Supabase и иных способов хранения

Нетарифицируемый сервис:

    Up to 500MB database & 1GB file storage
    Up to 2GB bandwidth
    Up to 50MB file uploads
    ...
    50,000 monthly active users
    Up to 500K Edge Function invocations

Источник: <https://supabase.com/pricing>

- [ ] Переписка Евгения Онегина с Татьяной
- [ ] PGP-подписи
- [x] Проза на HTML5 и JavaScript

Реструктуризация
----------------

- [x] Комната объединена со списком участников + поле ввода сообщения. (room+users)+submit
- [ ] ref на поле ввода текста
- [ ] отправка по CTRL+Enter
- [ ] "Татьяна"
- [ ] Состояние "Прочитано"