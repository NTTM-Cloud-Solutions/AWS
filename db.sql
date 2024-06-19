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
INSERT INTO episodes (id, name, uri, release_date) VALUES
('1', 'Episode 1: The Beginning', 'http://example.com/episodes/1', '2023-01-01'),
('2', 'Episode 2: The Journey Continues', 'http://example.com/episodes/2', '2023-02-01'),
('3', 'Episode 3: The Climax', 'http://example.com/episodes/3', '2023-03-01'),
('4', 'Episode 4: The Resolution', 'http://example.com/episodes/4', '2023-04-01'),
('5', 'Episode 5: The Finale', 'http://example.com/episodes/5', '2023-05-01');


SELECT * FROM episodes;

exit;