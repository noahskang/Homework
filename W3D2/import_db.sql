CREATE TABLE plays (
  id INTEGER PRIMARY KEY,
  -- INDICATE that title can never be null:
  title TEXT NOT NULL,
  year INTEGER NOT NULL,
  -- foreign key pointing to playwrights table:
  -- USE FOREIGN KEY to indicate...
  playwright_id INTEGER NOT NULL

  FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
);

CREATE TABLE playwrights (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
  birth_year INTEGER
);

-- Now use DML to add data.
-- start with playwrights bc plays has "foreign key" sntax -- can't start until we have something to reference

INSERT INTO
  playwrights (name, birth_year)
VALUES
  ('A Miller', 1915),
  -- use two single quotes for one quote. not backslash for escape
  ('E O''Neill', 1888),

INSERT INTO
  plays(title, year, playwright_id)
VALUES
-- embed a query to select id of arthur miller from playwrights table
  ('All my Sons'. 1947, (SELECT id FROM playwrights WHERE name = 'A Miller'))
  ('Long day''s journey'. 1947, (SELECT id FROM playwrights WHERE name = 'A E O''Neill'))
