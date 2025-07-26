
#### Список PRов:

- Отсутствуют

## Мод-пример

ID мода: EVENT_TOOLS

### Описание мода

Мод, добавляющий различные инструменты для проведения ивентов и дебага.

### Изменения *кор кода*

- `/mob/new_player`: `proc/AttemptLateSpawn`
- `/world`: `proc/IsBanned`

### Оверрайды

- `/datum/controller/subsystem/jobs`: `proc/check_general_join_blockers`

### Дефайны

- `isquantum(X)`
- `CONFIG_SERVER_WHITELIST_FILE`
- `GLOB.server_whitelist`
- `GLOB.fdserver_connect_whitelist`

### Используемые файлы, не содержащиеся в модпаке

- Отсутствуют

### Авторы:

Doctor Alex, Maximum123, Danilcus, Tech, Swift
