/* STATEMENTS ORDER
FROM
JOIN
WHERE
GROUP BY
HAVING
SORT BY
ORDER BY desc
SELECT *
DISTINCT
LIMIT 10
*/

-- Вставка ролей
INSERT INTO Role (role) VALUES
('Administrator'),
('Client'),
('Instructor');

-- Вставка купонов
INSERT INTO Coupon (name, description, code, discount, end_date) VALUES
('Summer Sale', 'Discount for summer training', 'SUM01', 20, '2024-08-31'),
('New Year Promo', 'Discount for new year', 'NY202', 15, '2025-01-01'),
('Holiday Offer', 'Special discount during holidays', 'HOLID', 10, '2024-12-31');

-- Вставка пользователей
INSERT INTO Account (username, password, role_id) VALUES
('admin', 'adminpass', 1),
('client1', 'client1pass', 2),
('client2', 'client2pass', 2),
('client3', 'client3pass', 2),
('instructor1', 'instructor1pass', 3),
('instructor2', 'instructor2pass', 3);

-- Вставка клиентов
INSERT INTO Client (name, surname, patronymic, age, phone_number, expenses, account_id) VALUES
('Ivan', 'Ivanov', 'Ivanovich', 25, '1234567890', 1000, 2),
('Petr', 'Petrov', 'Petrovich', 30, '0987654321', 500, 3),
('Anna', 'Sidorova', 'Andreevna', 28, '1122334455', 800, 4);

-- Вставка инструкторов
INSERT INTO Instructor (name, surname, patronymic, age, phone_number, about, account_id) VALUES
('Svetlana', 'Svetlova', 'Sergeevna', 35, '2233445566', 'Experienced instructor', 5),
('Alexey', 'Alexeev', 'Alekseevich', 40, '3344556677', 'Fitness expert', 6);

-- Вставка залов
INSERT INTO Hall (name, city, street, house_number) VALUES
('Fitness Hall 1', 'Moscow', 'Lenina', 10),
('Fitness Hall 2', 'Saint Petersburg', 'Nevsky', 5);

-- Вставка групп
INSERT INTO StudyGroup (name, price, max_workouts, max_clients, is_open) VALUES
('Yoga Group', 3000, 4, 10, TRUE),
('Pilates Group', 3500, 3, 8, TRUE),
('Dance Group', 4000, 5, 12, TRUE);

-- Вставка категорий тренировок
INSERT INTO WorkoutCategory (category_name, category_about) VALUES
('Cardio', 'High-intensity cardio workouts'),
('Strength', 'Strength training sessions'),
('Flexibility', 'Flexibility and stretching exercises');

-- Вставка тренировок
INSERT INTO Workout (day, start_time, end_time, category_id, group_id, hall_id) VALUES
('Monday', '10:00', '11:00', 1, 1, 1),
('Tuesday', '11:00', '12:00', 2, 1, 2),
('Wednesday', '12:00', '13:00', 3, 2, 1);

-- Вставка категорий клубных карт
INSERT INTO ClubCardCategory (name, discount) VALUES
('Basic', 5),
('Premium', 10),
('VIP', 15);

-- Вставка клубных карт
INSERT INTO ClubCard (end_date, category_id, client_id) VALUES
('2025-01-01', 1, 1),
('2025-06-01', 2, 2),
('2025-12-31', 3, 3);

-- Вставка партнеров
INSERT INTO Partner (name, url, url_logo) VALUES
('Fitness Pro', 'http://fitnesspro.com', 'http://fitnesspro.com/logo.png'),
('Healthy Life', 'http://healthylife.com', 'http://healthylife.com/logo.png');

-- Вставка отзывов
INSERT INTO Review (grade, text, date, time, client_id) VALUES
(5, 'Great workouts!', '2024-10-01', '10:00', 1),
(4, 'I enjoyed the classes.', '2024-10-02', '11:00', 2);

-- Вставка отношений многие ко многим
INSERT INTO Instructor_Workout (instructor_id, workout_id) VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO Group_Client (group_id, client_id) VALUES
(1, 1),
(1, 2),
(2, 3);