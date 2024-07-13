DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
  project_id INT AUTO_INCREMENT NOT NULL,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7, 2),
  actual_hours DECIMAL(7, 2),
  difficulty INT,
  notes TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE category (
  category_id INT AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE step (
  step_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  PRIMARY KEY (step_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
  material_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7, 2),
  PRIMARY KEY (material_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
  UNIQUE KEY (project_id, category_id)
);



insert into project (project_name,estimated_hours,actual_hours,difficulty, notes) values ('Woodwork fun', 2, 4, 3, 'Monday fun')
insert into material (project_id, material_name, num_required, cost) values (3, 'stain', 1, '5.00')
insert into material (project_id, material_name, num_required, cost) values (3, 'screws', 10, '0.10')
insert into step (project_id, step_text, step_order) values (3, 'hang up door', 1)
insert into step (project_id, step_text, step_order) values (3, 'screw door', 10)
insert into category (category_id, category_name) values(3,'Stain')
insert into category (category_id, category_name) values(3,'wood')
insert into category (category_id, category_name) values(3,'screws')
insert into project_category (project_id,category_id) values (3,1)
insert into project_category (project_id,category_id) values (3,2)

