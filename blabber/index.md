Болтовня
========

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
