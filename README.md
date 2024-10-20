# BataDaseLabs
# Система управления фитнес-клубом

### Студент: Бекарев Станислав Сергеевич  
### Группа: 253505

## Тема проекта:
Разработка системы управления фитнес-клубом. Система предназначена для управления клиентами, инструкторами, тренировками, групповыми занятиями, а также клубными картами. В системе будет поддерживаться авторизация, управление пользователями, а также система ролей.

## Стек технологий
PostgreSQL + django + psycopg2 lib driver for python raw sql queries

## Функциональные требования:
### Обязательные функции:
1. **Авторизация и аутентификация пользователей**:
    - Пользователи (администраторы, клиенты, инструкторы) могут входить в систему через систему логина и пароля.
    - Разные роли пользователей: администратор, инструктор, клиент.
  
2. **Управление пользователями (CRUD)**:
    - Администратор может создавать, редактировать и удалять пользователей.
    - Каждый пользователь привязан к определённой роли
    - - Пользователи с ролью клиента или инструктора связаны с дополнительной информацией (профиль клиента или инструктора).

3. **Система ролей**:
    - Роли определяют доступ пользователей к функционалу системы:
      - **Администратор**: Управление пользователями, инструкторами, группами, тренировками, клубными картами.
      - **Инструктор**: Управление тренировками, создание групповых занятий.
      - **Клиент**: Запись на тренировки, просмотр своих занятий и клубных карт.

4. **Журналирование действий пользователя**:
    - Система должна фиксировать действия пользователей: авторизация, регистрация на тренировки, изменение данных профиля и др.

5. **Управление группами и тренировками**:
    - Инструкторы могут создавать тренировки и групповые занятия.
    - Клиенты могут записываться на групповые занятия и тренировки.
    - Система должна учитывать максимальное количество клиентов в группе и доступные тренировки для клиентов.

6. **Управление клубными картами**:
    - Администраторы могут управлять клубными картами, назначать их клиентам, задавать сроки действия и скидки.
    - Клубные карты дают клиентам скидки на тренировки и имеют срок действия.

## Описание таблиц базы данных:

### 1. Таблица `Role`:
   - **id** (PK): Уникальный идентификатор роли.
   - **role**: Роль пользователя (администратор, клиент, инструктор).

### 2. Таблица `User`:
   - **id** (PK): Уникальный идентификатор пользователя.
   - **username**: Имя пользователя.
   - **password**: Пароль.
   - **role_id**: Роль пользователя (администратор, клиент, инструктор).

### 3. Таблица `Client`:
   - **id** (PK): Уникальный идентификатор клиента.
   - **fullname**: Полное имя клиента.
   - **age**: Возраст клиента.
   - **phone_number**: Номер телефона клиента.
   - **expenses**: Затраты клиента на тренировки.
   - **cupon_id** (FK): Купон, предоставляющий скидку.
   - **user_id** (FK): Связь с таблицей пользователей (один к одному).
   
### 4. Таблица `Instructor`:
   - **id** (PK): Уникальный идентификатор инструктора.
   - **fullname**: Полное имя инструктора.
   - **age**: Возраст инструктора.
   - **phone_number**: Номер телефона инструктора.
   - **about**: Дополнительная информация об инструкторе.
   - **photo**: Фото инструктора.
   - **user_id** (FK): Связь с таблицей пользователей (один к одному).
   - **workouts**: Связь с таблицей занятий (многие ко многим).

### 5. Таблица `WorkoutCategory`:
   - **id** (PK): Уникальный идентификатор категории.
   - **category_name**: Название категории.
   - **category_about**: Подробнее о категории.

### 6. Таблица `Workout`:
   - **id** (PK): Уникальный идентификатор тренировки.
   - **start_time**: Время начала тренировки.
   - **end_time**: Время окончания тренировки.
   - **price**: Стоимость тренировки.
   - **category_id** (FK): Категория тренировки (многие к одному).
   - **group_id** (FK): Связь с таблицей групп (многие к одному).
   - **hall_id** (FK): Связь с таблицей залов (многие к одному).

### 7. Таблица `Group`:
   - **id** (PK): Уникальный идентификатор группы.
   - **name**: Название группы.
   - **all_price**: Общая стоимость всех тренировок группы.
   - **max_workouts**: Максимальное количество тренировок для группы.
   - **max_clients**: Максимальное количество клиентов в группе.
   - **is_open**: Флаг, открыта ли группа для записи.
   - **is_edit**: Флаг, можно ли редактировать группу.
   - **clients**: Связь с таблицей клиентов (многие ко многим).

### 8. Таблица `GroupSchedule`:
   - **id** (PK): Уникальный идентификатор расписания группы.
   - **description**: Описание расписания.
   - **group_id** (FK): Связь с таблицей групп (один к одному).

### 9. Таблица `Hall`:
   - **id** (PK): Уникальный идентификатор зала.
   - **name**: Название зала.
   - **address**: Адрес зала.

### 10. Таблица `ClubCard`:
   - **id** (PK): Уникальный идентификатор клубной карты.
   - **name**: Название клубной карты.
   - **end_date**: Дата окончания действия карты.
   - **discount**: Скидка по карте в процентах.
   - **client_id** (FK): Связь с таблицей клиентов (один к одному).

### 11. Таблица `Partner`:
   - **id** (PK): Уникальный идентификатор партнера.
   - **name**: Название партнера.
   - **url**: Ссылка на сайт партнера.
   - **logo**: Логотип партнера.

### 12. Таблица `Review`:
   - **id** (PK): Уникальный идентификатор отзыва.
   - **grade**: Оценка(от 1 до 5).
   - **text**: Текст отзыва пользователя.
   - **date**: Дата, когда был оставлен отзыв.
   - **client_id** (FK): Клиент, оставивший отзыв (многие к одному).
   
### 13. Таблица `Coupon`:
   - **id** (PK): Уникальный идентификатор купона.
   - **name**: Название купона.
   - **description**: Описание купона.
   - **code**: Уникальный код купона.
   - **discount**: Скидка, предоставляемая купоном.
   - **end_date**: Дата, до которой работает купон.
   
## Схема базы данных:
На изображении ниже представлена схематическая модель базы данных с основными связями и типами полей.
![Пропала картинка(](./3nf_data_base.png)
