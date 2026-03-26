-- Создаем таблицу пользователей
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создаем таблицу заказов со связью по user_id
CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Наполняем данными (используем ON CONFLICT, чтобы не было ошибок при повторном запуске)
INSERT INTO users (id, name, email) VALUES 
(1, 'Nikita', 'nikita@yandex.ru'),
(2, 'Natalia', 'nat@gmail.com'),
(3, 'Oleg', 'oleg@mail.ru'),
(4, 'Nikolay', 'nick@yandex.ru'),
(5, 'Alex', 'alex@it.com')
ON CONFLICT (id) DO NOTHING;

INSERT INTO orders (user_id, product_name, price) VALUES 
(1, 'Apple iPhone 15', 99000.00),
(1, 'Case for iPhone', 1500.00),
(2, 'Coffee beans', 1200.00),
(4, 'Laptop Stand', 3500.00);