---
unpkg:
  - https://unpkg.com/@supabase/supabase-js@2
js: |
  const room = '2f47c09b-57f5-4494-adfa-2bec0aa391a6'
  const uuid = 'f5043712-712b-40b5-8a34-08b621a68c0f'

  const client = supabase.createClient('https://iqpokkogrxcidfvvouaz.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlxcG9ra29ncnhjaWRmdnZvdWF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk1NjUyMDksImV4cCI6MTk4NTE0MTIwOX0.CqEo93msN9MeaCFrCVFtO8AorACl7Cm1rk3rTaGUgbA')

  const women = ['Почему ты мне не поставил лайк?', 'Что это за баба у тебя в друзьях?', 'Ты заметил, что я постриглась?', 'Я потолстела?', 'Тебе на меня плевать!', 'Ты думаешь только о себе!', 'Почему ты мне не даришь цветы?', 'Я обычно так не делаю!', 'Вот и общайся со своим компьютером!', 'Как ты думаешь, на что я обиделась?', 'Ты меня не любишь!', 'Развесели меня!', 'Твой друг уже машину купил!', 'Почему ты не поднимал трубку?', 'Я не обижаюсь, а делаю выводы!', 'Я тебе еще не надоела?', 'Это не смешно!', 'Ты никогда не виноват!', 'Все твои бывшие бл*ди!', 'Ты не понимаешь, что мне нужно!', 'Я не чувствую твоей любви!', 'Ясно, понятно!', 'Я не такая как все!', 'Расскажи мне что-нибудь интересное!', 'Лучше все сама сделаю!', 'Или гуляй со своими друзьями!', 'Все твои друзья алкаши!', 'У меня нормальное настроение!', 'А за что ты меня любишь?', 'Ты всем девушкам такое говоришь?', 'Мне нужна романтика!', 'Почему ты мне не даришь подарки?', 'Правильно мне про тебя говорили!', 'Ты не такой, как был раньше!', 'Мы не тр*х*емся, а занимаемся любовью!', 'Все ясно! Пока!', 'Ты не думаешь о нашем будущем!', 'Почему ты мне не перезвонил?', 'Ты ничего нового во мне не замечаешь?', 'Тебе с друзьями интереснее, чем со мной!', 'Я ноготь сломала!', 'Тебе пора повзрослеть!', 'У тебя есть время только на друзей!', 'Мне скучно! Придумай что-нибудь!', 'Ты с ней спал?', 'Ты выпил пива? Алкаш!', 'Ты не забыл какой сегодня день?', 'Не туда!', 'Ты со мной только ради секса!', 'Ой, все!']

  const first = setInterval(
    async () => {
      const { data, error } = await client.from('messages')
        .insert({ 
          content: women[
            Math.floor(Math.random() * 50)
          ], 
          room_id: room, 
          user_id: uuid
        })
        .select()
        .single()

      setTimeout(
        async () => {
          const { error } = await client
            .from('messages')
            .delete()
            .eq('room_id', room)
            .eq('id', data.id)
        },
        10000
      )
    }, 
    15000
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

50 тупых фраз, которые произносит каждая женщина
------------------------------------------------

Источник: <https://mport.ua/mix/760788-50-tupyh-fraz-kotorye-proiznosit-kazhdaja-zhencshina>

```js
Array.from(
  document.querySelectorAll('.article_in > p')
).filter(
  n => n.textContent.match(/^\d+\.\s/i)
).map(
  n => n.textContent.replace(/^\d+\.\s/i, '')
)
```

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

Инициализация
-------------

Процесс создания клиента:

    import { createClient } from '@supabase/supabase-js'

    const supabaseUrl = process.env.REACT_APP_SUPABASE_URL
    const supabaseAnonKey = process.env.REACT_APP_SUPABASE_ANON_KEY

    export const supabase = createClient(supabaseUrl, supabaseAnonKey)

Источник: <https://supabase.com/docs/guides/with-react>

Визуализация
------------

Новогодних подарков нам:

- [ ] Коллективная болтовня с Евгением Онегиным
- [x] Ключи от квартиры «где деньги лежат» и/или PGP-подписей
- [ ] Обмолвиться с Анной Романовой о царских ароматах той поры
- [ ] Написать прозу на HTML5 и JavaScript

Цифровизация
------------

Голограмма бортового журнала:

    -----BEGIN PGP PUBLIC KEY BLOCK-----

    mDMEY4c73xYJKwYBBAHaRw8BAQdA9+N7jMkSKbXC2rC30g1XffuQObFgWngURgrB
    P0vBsaO0K9CV0LLQs9C10L3QuNC5INCe0L3QtdCz0LjQvSA8b25lZ2FlQHZrLmNv
    bT6IkAQTFggAOBYhBNxzn4U1qbMW3lF1co0VvHpuBXcbBQJjhzvfAhsDBQsJCAcC
    BhUKCQgLAgQWAgMBAh4BAheAAAoJEI0VvHpuBXcbO8wA/1XYoqou1nJFqJJfQez4
    DEAWOyd/XEvWWDNw9M5ILxP4AP0bkxefdALVglLkyigg2x0s6PGXwz2g6zBF8Zq6
    ofuuDw==
    =va7x
    -----END PGP PUBLIC KEY BLOCK-----

Материализация
--------------

- [x] Встреча с Машиной Времени (сервисное обслуживание)
- [ ] Встреча с Татьяной
- [ ] Встреча с Анной Карениной
- [ ] Встреча с Анастрасией Романовой
- [x] Встреча с Кириллом и/или Мефодием

Реализация
----------

    <script src="https://unpkg.com/@supabase/supabase-js@2" crossorigin></script>
    <script>
      const client = supabase.createClient(
        'https://iqpokkogrxcidfvvouaz.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlxcG9ra29ncnhjaWRmdnZvdWF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk1NjUyMDksImV4cCI6MTk4NTE0MTIwOX0.CqEo93msN9MeaCFrCVFtO8AorACl7Cm1rk3rTaGUgbA'
      )
    </script>


    curl -X POST https://iqpokkogrxcidfvvouaz.supabase.co/rest/v1/messages \
      -H 'Content-Type: application/json' \
      -H 'ApiKey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlxcG9ra29ncnhjaWRmdnZvdWF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk1NjUyMDksImV4cCI6MTk4NTE0MTIwOX0.CqEo93msN9MeaCFrCVFtO8AorACl7Cm1rk3rTaGUgbA' \
      -d '{"content":"Привет!","room_id":"2f47c09b-57f5-4494-adfa-2bec0aa391a6","user_id":"29ffbaf6-200e-4383-a024-23b795afee3b"}' 

Реструктуризация
----------------

Компоненты:

- Сообщения
- Набор и отправка
- Сервисная строка (набор, скопировано, отправка)
- Комната (информация)
- Панель (настройки, информация)
- Авторы


const {
  room,
  users,
  messages
} = useChat(service)

const { theme, permissions = { notifications, audio, video }, handleOffline, handleOnline, serviceWorker } = useState(storage)

service: Supabase|WebRTC = {
  fetchRoom,
  updateRoom,
  fetchUsers, auth: {signIn, signUp, updateProfile},
  fetchMessages, submitMessage, updateMessage, deleteMessage,
  broadcast|channel|subscrpition
}

Комната объединена со списком участников + поле ввода имени. (room+users)+signUp

ref + lastMessageTimestamp

лицензиянашрифт интер