UPDATE Client SET cupon_id = 1 WHERE id = 1;

UPDATE Client SET cupon_id = (SELECT id FROM coupon WHERE name='Holiday Offer' ) WHERE id != 1;
select * from client;


INSERT INTO Role (role) values ('mama');
select * from Role;
DELETE FROM Role WHERE id = (SELECT id FROM Role WHERE role='mama');
select * from Role;

SELECT name FROM studygroup WHERE id in (SELECT group_id FROM group_client WHERE client_id = 3);
SELECT name FROM client WHERE id in
        (SELECT client_id FROM group_client WHERE group_id =
                (SELECT id FROM StudyGroup WHERE name='Yoga Group'));

SELECT * FROM coupon ORDER BY end_date DESC;

SELECT c.surname, coupon.code, coupon.description FROM coupon CROSS JOIN client c;
SELECT c.surname, coupon.code, coupon.description FROM coupon JOIN client c on coupon.id = c.cupon_id;

SELECT * FROM account WHERE role_id = (SELECT id FROM Role WHERE role='Instructor');
SELECT * FROM account WHERE role_id in (SELECT id FROM Role WHERE role!='Instructor');

SELECT card.id, card.end_date, cat.name, cat.discount, card.client_id FROM clubcard card JOIN clubcardcategory cat on card.category_id = cat.id;