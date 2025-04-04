-- Tüm kitaplar
SELECT * FROM Books;

-- 2. Yalnýzca Bilgisayar Bilimleri
SELECT * FROM Books WHERE category = 'Bilgisayar Bilimleri';

-- 3. 2020 ve sonrasý 
SELECT * FROM Books WHERE publication_year >= 2020;

-- 4. Kitap adý, kategorisi
SELECT title, category FROM Books;

-- 5. Kitap alan öðrencilerin adý soyadý kitap adý
SELECT s.first_name, s.last_name, b.title
FROM Loans l
JOIN Students s ON l.student_id = s.id
JOIN Books b ON l.book_id = b.id;

-- 6. Her kitapla iliþkili yazar ve yayýn yýlý
SELECT title, author, publication_year FROM Books;

-- 7. Hangi kullanýcý hangi kitabý ne zaman almýþ
SELECT s.first_name, s.last_name, b.title, l.loan_date
FROM Loans l
JOIN Students s ON l.student_id = s.id
JOIN Books b ON l.book_id = b.id;

-- 8. Geri dönüþ tarihi boþ olan kitaplar
SELECT s.first_name, s.last_name, b.title
FROM Loans l
JOIN Students s ON l.student_id = s.id
JOIN Books b ON l.book_id = b.id
WHERE l.return_date IS NULL;

-- 9. Her kategoriye ait kaç kitap
SELECT category, COUNT(*) AS kitap_sayisi
FROM Books
GROUP BY category;

-- 10. En çok kitap alan kullanýcýlar (en çoktan aza)
SELECT s.first_name, s.last_name, COUNT(*) AS toplam_odunc
FROM Loans l
JOIN Students s ON l.student_id = s.id
GROUP BY s.first_name, s.last_name
ORDER BY toplam_odunc DESC;



-- A) ALTER TABLE kullanýmý
-- ALTER TABLE Books ADD publisher VARCHAR(100);
-- ALTER TABLE Books ALTER COLUMN title VARCHAR(200);

-- B) UPDATE ve DELETE kullanýmý
-- UPDATE Books SET title = 'Yeni Ad' WHERE id = 1;
-- DELETE FROM Books WHERE id = 1;

-- C) JOIN türleri farklarý
-- INNER JOIN: Ortak kayýtlar
-- LEFT JOIN: Sol + eþleþen sað
-- RIGHT JOIN: Sað + eþleþen sol
-- FULL JOIN: Tüm kayýtlar

-- D) HAVING + GROUP BY
-- SELECT category, COUNT(*) FROM Books GROUP BY category HAVING COUNT(*) > 5;

-- E) Ýlk 5 kitap
-- SELECT TOP 5 * FROM Books;

-- F) SUBQUERY örneði
-- SELECT * FROM Books WHERE category_id = (SELECT id FROM Categories WHERE name = 'Tarih');

-- G) AND / OR örneði
-- SELECT * FROM Books WHERE category = 'Fizik' AND publication_year > 2018;

-- H) BETWEEN örneði
-- SELECT * FROM Books WHERE publication_year BETWEEN 2020 AND 2023;

-- I) IN örneði
-- SELECT * FROM Books WHERE category IN ('Tarih', 'Bilgisayar Bilimleri');

-- J) LIKE örneði
-- SELECT * FROM Books WHERE title LIKE '%veri%';
