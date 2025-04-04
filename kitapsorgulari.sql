-- T�m kitaplar
SELECT * FROM Books;

-- 2. Yaln�zca Bilgisayar Bilimleri
SELECT * FROM Books WHERE category = 'Bilgisayar Bilimleri';

-- 3. 2020 ve sonras� 
SELECT * FROM Books WHERE publication_year >= 2020;

-- 4. Kitap ad�, kategorisi
SELECT title, category FROM Books;

-- 5. Kitap alan ��rencilerin ad� soyad� kitap ad�
SELECT s.first_name, s.last_name, b.title
FROM Loans l
JOIN Students s ON l.student_id = s.id
JOIN Books b ON l.book_id = b.id;

-- 6. Her kitapla ili�kili yazar ve yay�n y�l�
SELECT title, author, publication_year FROM Books;

-- 7. Hangi kullan�c� hangi kitab� ne zaman alm��
SELECT s.first_name, s.last_name, b.title, l.loan_date
FROM Loans l
JOIN Students s ON l.student_id = s.id
JOIN Books b ON l.book_id = b.id;

-- 8. Geri d�n�� tarihi bo� olan kitaplar
SELECT s.first_name, s.last_name, b.title
FROM Loans l
JOIN Students s ON l.student_id = s.id
JOIN Books b ON l.book_id = b.id
WHERE l.return_date IS NULL;

-- 9. Her kategoriye ait ka� kitap
SELECT category, COUNT(*) AS kitap_sayisi
FROM Books
GROUP BY category;

-- 10. En �ok kitap alan kullan�c�lar (en �oktan aza)
SELECT s.first_name, s.last_name, COUNT(*) AS toplam_odunc
FROM Loans l
JOIN Students s ON l.student_id = s.id
GROUP BY s.first_name, s.last_name
ORDER BY toplam_odunc DESC;



-- A) ALTER TABLE kullan�m�
-- ALTER TABLE Books ADD publisher VARCHAR(100);
-- ALTER TABLE Books ALTER COLUMN title VARCHAR(200);

-- B) UPDATE ve DELETE kullan�m�
-- UPDATE Books SET title = 'Yeni Ad' WHERE id = 1;
-- DELETE FROM Books WHERE id = 1;

-- C) JOIN t�rleri farklar�
-- INNER JOIN: Ortak kay�tlar
-- LEFT JOIN: Sol + e�le�en sa�
-- RIGHT JOIN: Sa� + e�le�en sol
-- FULL JOIN: T�m kay�tlar

-- D) HAVING + GROUP BY
-- SELECT category, COUNT(*) FROM Books GROUP BY category HAVING COUNT(*) > 5;

-- E) �lk 5 kitap
-- SELECT TOP 5 * FROM Books;

-- F) SUBQUERY �rne�i
-- SELECT * FROM Books WHERE category_id = (SELECT id FROM Categories WHERE name = 'Tarih');

-- G) AND / OR �rne�i
-- SELECT * FROM Books WHERE category = 'Fizik' AND publication_year > 2018;

-- H) BETWEEN �rne�i
-- SELECT * FROM Books WHERE publication_year BETWEEN 2020 AND 2023;

-- I) IN �rne�i
-- SELECT * FROM Books WHERE category IN ('Tarih', 'Bilgisayar Bilimleri');

-- J) LIKE �rne�i
-- SELECT * FROM Books WHERE title LIKE '%veri%';
