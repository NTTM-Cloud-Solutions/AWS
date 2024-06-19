-- Create the database
CREATE DATABASE db;

-- Use the newly created database
USE db;

-- Create the episodes table
CREATE TABLE episodes (
  id VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  uri VARCHAR(255) NOT NULL,
  release_date DATE NOT NULL,
  PRIMARY KEY (id)
);

-- Insert sample data into the episodes table
INSERT INTO episodes (id, name, uri, release_date) VALUES ('2TDaMJTgHvYKr4zY70KPjy', 'פרק 0 - ברוכים הבאים לפודקאסט תם ונשלם הקונדס', 'spotify:episode:2TDaMJTgHvYKr4zY70KPjy', '2020-08-06');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('5ibNqIJGm7upBJ5CDlAyzm', 'ספר 1 - פרק 1 - הילד שנשאר בחיים', 'spotify:episode:5ibNqIJGm7upBJ5CDlAyzm', '2020-08-10');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('4vZlqbX7qCD4bCqn2EXYfa', 'ספר 1 - פרק 2 - הזכוכית הנעלמת', 'spotify:episode:4vZlqbX7qCD4bCqn2EXYfa', '2020-08-13');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('1jQCuDjOD4UWbQq3F7E9DJ', 'ספר 1 - פרק 3 - המכתבים מאף אחד', 'spotify:episode:1jQCuDjOD4UWbQq3F7E9DJ', '2020-08-17');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('5razqvUQakH7zmUFMkZPMb', 'ספר 1 - פרק 4 - שומר המפתחות', 'spotify:episode:5razqvUQakH7zmUFMkZPMb', '2020-08-20');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('3JRgk7jC68cmqvbmJvHrRP', 'ספר 1 - פרק 5 - סמטת דייגון', 'spotify:episode:3JRgk7jC68cmqvbmJvHrRP', '2020-08-24');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('40KenWaC1HfEcBdM2Zyi6C', 'ספר 1 - פרק 6 - המסע מרציף 9 ושלושה רבעים', 'spotify:episode:40KenWaC1HfEcBdM2Zyi6C', '2020-08-27');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('4F9VZwddQ2rIT1z4v8YTKo', 'ספר 1 - פרק 7 - מצנפת המיון', 'spotify:episode:4F9VZwddQ2rIT1z4v8YTKo', '2020-08-31');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('3p79kxhhsPcP8B4QX8DHfW', 'ספר 1 - פרק 8 - המורה לשיקויים', 'spotify:episode:3p79kxhhsPcP8B4QX8DHfW', '2020-09-03');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('0N7QNclEp2PjKb4KT3asor', 'ספר 1 - פרק 9 - דו קרב בחצות', 'spotify:episode:0N7QNclEp2PjKb4KT3asor', '2020-09-07');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('6ljyQ8Eh3xtcQE5pLcVrdw', 'פרק מיוחד - חייה של ג'יי.קיי ראולינג ומקור ההשראה להארי פוטר', 'spotify:episode:6ljyQ8Eh3xtcQE5pLcVrdw', '2020-09-08');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('3NYR3YAyxZRRM2kubvy10T', 'ספר 1 - פרק 10 - הלוואין', 'spotify:episode:3NYR3YAyxZRRM2kubvy10T', '2020-09-10');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('06dRNnRXULPhSaX9BeBkqU', 'ספר 1 - פרק 11 - קווידיץ'', 'spotify:episode:06dRNnRXULPhSaX9BeBkqU', '2020-09-14');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('1w389NiDYIyYk81kNIvul4', 'ספר 1 - פרק 12 - הראי של ינפתא', 'spotify:episode:1w389NiDYIyYk81kNIvul4', '2020-09-17');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('6MCFWsnFUo2mrqYPrxYIUi', 'ספר 1 - פרק 13 - ניקולס פלאמל', 'spotify:episode:6MCFWsnFUo2mrqYPrxYIUi', '2020-09-21');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('4IzTFBHykB4wFQNArHWjop', 'פרק מיוחד #2 - תיאוריית הארי פוטר - פרופ' דמבלדור והקשר לאוצרות המוות', 'spotify:episode:4IzTFBHykB4wFQNArHWjop', '2020-09-22');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('3FtWzyYXK8nYLYr6xYP1Ot', 'ספר 1 - פרק 14 - נורברט הנורווגי המנוקד', 'spotify:episode:3FtWzyYXK8nYLYr6xYP1Ot', '2020-09-24');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('7DYSiqBQ12mNqDR46AxINS', 'ספר 1 - פרק 15 - היער האסור', 'spotify:episode:7DYSiqBQ12mNqDR46AxINS', '2020-09-28');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('7BygjobBPIMJK3ajdyZz6X', 'ספר 1 - פרק 16 - דרך דלת הסתרים', 'spotify:episode:7BygjobBPIMJK3ajdyZz6X', '2020-10-01');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('57pzAbnRU9bXrYO2Z7Hb1c', 'ספר 1 - פרק 17 - הגבר בעל שני הפרצופים', 'spotify:episode:57pzAbnRU9bXrYO2Z7Hb1c', '2020-10-05');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('5Lo3Dqk9xECN3gCgcsiy3X', 'פרק מיוחד #3 - מייסדי הוגוורטס וארבעת הבתים', 'spotify:episode:5Lo3Dqk9xECN3gCgcsiy3X', '2020-10-06');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('4WwPlu7BQJLmHDOu7jqhOm', 'ספר 1 - פרק סיכום הספר', 'spotify:episode:4WwPlu7BQJLmHDOu7jqhOm', '2020-10-08');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('6bTtonmZKN1ADyHvKQ3mMg', 'סיכום סרט - הארי פוטר ואבן החכמים - חלק א', 'spotify:episode:6bTtonmZKN1ADyHvKQ3mMg', '2020-10-12');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('6YnFghak4aqOkFGcmabTAd', 'סיכום סרט - הארי פוטר ואבן החכמים - חלק ב', 'spotify:episode:6YnFghak4aqOkFGcmabTAd', '2020-10-15');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('0VePIdtZvXM68fi3J5lxVh', 'ספר 2 - פרק 1 - יום ההולדת הכי גרוע', 'spotify:episode:0VePIdtZvXM68fi3J5lxVh', '2020-10-19');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('5EvCDTZPUdui97BIpOqssa', 'ספר 2 - פרק 2 - אזהרתו של דובי', 'spotify:episode:5EvCDTZPUdui97BIpOqssa', '2020-10-22');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('50E26loLhjRop1yO3luPqb', 'ספר 2 - פרק 3 - המחילה', 'spotify:episode:50E26loLhjRop1yO3luPqb', '2020-10-26');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('2UKsA1rOdj25CtWJPWon1L', 'פרק מיוחד #4 - פיבס רוח הרפאים של הוגוורטס', 'spotify:episode:2UKsA1rOdj25CtWJPWon1L', '2020-10-27');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('1y1YCFYDGjicNSP0OfYtj5', 'ספר 2 - פרק 4 - אצל כרך ודף בע"מ', 'spotify:episode:1y1YCFYDGjicNSP0OfYtj5', '2020-10-29');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('6528z1XY6HfXLk5ifL3UqK', 'ספר 2 - פרק 5 - הערבה המפליקה', 'spotify:episode:6528z1XY6HfXLk5ifL3UqK', '2020-11-02');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('3RmwKH07MWkaZ6R6YiVSLu', 'ספר 2 - פרק 6 - גילדרוי לוקהארט', 'spotify:episode:3RmwKH07MWkaZ6R6YiVSLu', '2020-11-05');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('32mjqq5te0Cg7y1aEGZV2W', 'ספר 2 - פרק 7- בוצדמים וקולות מוזרים', 'spotify:episode:32mjqq5te0Cg7y1aEGZV2W', '2020-11-08');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('3rVbNbQWxzFxHukE9uKdJI', 'ספר 2 - פרק 8 - מסיבת יום המוות', 'spotify:episode:3rVbNbQWxzFxHukE9uKdJI', '2020-11-12');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('7aRDjKXnC0CM3T7AqRJXUG', 'פרק מיוחד #6 - למה הארי פוטר בלתי מנוצח', 'spotify:episode:7aRDjKXnC0CM3T7AqRJXUG', '2020-11-17');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('0KxdbMlXLpIiQ9oJ6zj1CR', 'ספר 2 - פרק 9 - הכתובת על הקיר', 'spotify:episode:0KxdbMlXLpIiQ9oJ6zj1CR', '2020-11-18');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('58g8bd1lSIDvvBbFtu0jWX', 'פרק מיוחד #5 - הורוקרוקסים', 'spotify:episode:58g8bd1lSIDvvBbFtu0jWX', '2020-11-18');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('1Mv2jUWxbH2gnnRZDG6Vl0', 'ספר 2 - פרק 10 - המרביצן האלים', 'spotify:episode:1Mv2jUWxbH2gnnRZDG6Vl0', '2020-11-19');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('7oItRmaoDA1kviTgkf5B2s', 'ספר 2 - פרק 11 - מועדון הדו קרב', 'spotify:episode:7oItRmaoDA1kviTgkf5B2s', '2020-11-23');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('116umtBTrel1VyCzdYgtaQ', 'ספר 2 - פרק 12 - שיקוי הפולימיצי', 'spotify:episode:116umtBTrel1VyCzdYgtaQ', '2020-11-26');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('698N9TDek5zhDYq4jntJ7B', 'ספר 2 -פרק 13 - היומן הסודי ביותר', 'spotify:episode:698N9TDek5zhDYq4jntJ7B', '2020-11-30');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('08Zu3qDgbvOZhfzsUROo0j', 'ספר 2 - פרק 14 - קורניליוס פאדג'', 'spotify:episode:08Zu3qDgbvOZhfzsUROo0j', '2020-12-03');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('64bYTF6Cb7QNBFHY7bIzw4', 'ספר 2 - פרק 15 - הרעגוג', 'spotify:episode:64bYTF6Cb7QNBFHY7bIzw4', '2020-12-07');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('1UNMRoxIMLRQNvFxQQZaiO', 'פרק מיוחד #6 - חדר הסודות', 'spotify:episode:1UNMRoxIMLRQNvFxQQZaiO', '2020-12-07');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('2YhPms21c8oBDC6N6nPXDJ', 'ספר 2 - פרק 16 - חדר הסודות', 'spotify:episode:2YhPms21c8oBDC6N6nPXDJ', '2020-12-10');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('5VIpRWmV9m774d4852Z8VQ', 'ספר 2 - פרק 17 - היורש של סלית'רין', 'spotify:episode:5VIpRWmV9m774d4852Z8VQ', '2020-12-14');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('25BXosCK4mbwr4WsKxGrIw', 'ספר 2 - פרק 18 - הפרס של דובי', 'spotify:episode:25BXosCK4mbwr4WsKxGrIw', '2020-12-17');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('4rfGXQMapJ8cbPycIzHMuJ', 'סיכום ספר 2 - הארי פוטר וחדר הסודות', 'spotify:episode:4rfGXQMapJ8cbPycIzHMuJ', '2020-12-21');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('0wEI4Goaldysl11FNoEq1C', 'פרק מיוחד #7 - חייו של גדול המנהלים - אלבוס דמבלדור', 'spotify:episode:0wEI4Goaldysl11FNoEq1C', '2020-12-23');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('3397DAtEqBRYjDv0TvaZeL', 'סרט 2 - הארי פוטר וחדר הסודות - חלק א', 'spotify:episode:3397DAtEqBRYjDv0TvaZeL', '2020-12-24');
INSERT INTO episodes (id, name, uri, release_date) VALUES ('5HlyLWoB3q2kBBObk02sLb', 'סרט 2 - הארי פוטר וחדר הסודות - חלק ב', 'spotify:episode:5HlyLWoB3q2kBBObk02sLb', '2020-12-28');


SELECT * FROM episodes;

exit;
