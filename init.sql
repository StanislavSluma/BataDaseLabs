CREATE TABLE Role (
    id SERIAL PRIMARY KEY,
    role CHARACTER VARYING(31) UNIQUE
);

CREATE TABLE Coupon (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(31) NOT NULL,
    description TEXT,
    code CHARACTER(5) UNIQUE NOT NULL,
    discount INTEGER DEFAULT 0 CHECK(discount >= 0 AND discount <= 100),
    end_date DATE NOT NULL
);

CREATE TABLE Account (
    id SERIAL PRIMARY KEY,
    username CHARACTER VARYING(31) NOT NULL UNIQUE,
    password CHARACTER VARYING(31) NOT NULL,
    role_id INTEGER NOT NULL REFERENCES Role(id) ON DELETE CASCADE
);

CREATE TABLE Client (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(31) NOT NULL,
    surname CHARACTER VARYING(31) NOT NULL,
    patronymic CHARACTER VARYING(31) NOT NULL,
    age INTEGER CHECK(age > 18 AND age < 120),
    phone_number CHARACTER VARYING(31) NOT NULL,
    expenses MONEY DEFAULT 0,
    account_id INTEGER UNIQUE NOT NULL REFERENCES Account(id) ON DELETE CASCADE,
    cupon_id INTEGER REFERENCES Coupon(id) ON DELETE SET NULL
);

CREATE TABLE Instructor (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(31) NOT NULL,
    surname CHARACTER VARYING(31) NOT NULL,
    patronymic CHARACTER VARYING(31) NOT NULL,
    age INTEGER CHECK(age > 18 AND age < 120),
    phone_number CHARACTER VARYING(31) UNIQUE NOT NULL,
    about TEXT,
    url_photo TEXT,
    account_id INTEGER REFERENCES Account(id) ON DELETE CASCADE
);

CREATE TABLE Hall (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(31) NOT NULL,
    city CHARACTER VARYING(31) NOT NULL,
    street CHARACTER VARYING(31) NOT NULL,
    house_number INTEGER NOT NULL CHECK(house_number > 0)
);

CREATE TABLE StudyGroup (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(31) NOT NULL,
    price MONEY DEFAULT 0,
    max_workouts INTEGER DEFAULT 3 CHECK(max_workouts > 2),
    max_clients INTEGER DEFAULT 3 CHECK(max_clients > 2),
    is_open BOOLEAN DEFAULT TRUE
);

CREATE TABLE WorkoutCategory (
    id SERIAL PRIMARY KEY,
    category_name CHARACTER VARYING(31) UNIQUE NOT NULL,
    category_about TEXT
);

CREATE TABLE Workout (
    id SERIAL PRIMARY KEY,
    day CHARACTER VARYING(10) CHECK(day IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    category_id INTEGER NULL REFERENCES WorkoutCategory(id) ON DELETE SET NULL,
    group_id INTEGER NULL REFERENCES StudyGroup(id) ON DELETE SET NULL,
    hall_id INTEGER NULL REFERENCES Hall(id) ON DELETE SET NULL
);

CREATE TABLE ClubCardCategory (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(31) UNIQUE NOT NULL,
    discount INTEGER DEFAULT 0 CHECK(discount >= 0 AND discount <= 100)
);

CREATE TABLE ClubCard (
    id SERIAL PRIMARY KEY,
    end_date DATE NOT NULL,
    category_id INTEGER NOT NULL REFERENCES ClubCardCategory(id) ON DELETE CASCADE,
    client_id INTEGER NOT NULL REFERENCES Client(id) ON DELETE CASCADE
);

CREATE TABLE Partner (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(31) NOT NULL,
    url TEXT,
    url_logo TEXT
);

CREATE TABLE Review (
    id SERIAL PRIMARY KEY,
    grade INTEGER DEFAULT 5 CHECK(grade > 0 AND grade < 6),
    text TEXT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    client_id INTEGER REFERENCES Client(id) ON DELETE SET NULL
);

-- Промежуточные таблицы для отношений многие ко многим

CREATE TABLE Instructor_Workout (
    instructor_id INTEGER REFERENCES Instructor(id) ON DELETE CASCADE,
    workout_id INTEGER REFERENCES Workout(id) ON DELETE CASCADE,
    PRIMARY KEY (instructor_id, workout_id)
);

CREATE TABLE Group_Client (
    group_id INTEGER REFERENCES StudyGroup(id) ON DELETE CASCADE,
    client_id INTEGER REFERENCES Client(id) ON DELETE CASCADE,
    PRIMARY KEY (group_id, client_id)
);