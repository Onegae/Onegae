Болтовня
========

Процесс создания клиента:

    import { createClient } from '@supabase/supabase-js'

    const supabaseUrl = process.env.REACT_APP_SUPABASE_URL
    const supabaseAnonKey = process.env.REACT_APP_SUPABASE_ANON_KEY

    export const supabase = createClient(supabaseUrl, supabaseAnonKey)

Источник: https://supabase.com/docs/guides/with-react