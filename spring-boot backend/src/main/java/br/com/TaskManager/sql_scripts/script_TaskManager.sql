CREATE DATABASE TaskManager;

USE TaskManager;

CREATE TABLE Tasks (
	task_id BIGINT NOT NULL IDENTITY PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	task_description VARCHAR(255),
	task_status VARCHAR(25) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	CONSTRAINT CHK_TaskStatus CHECK (task_status IN ('Pendente', 'Em andamento', 'Concluída'))
);

CREATE TABLE TestTable (
    id BIGINT PRIMARY KEY IDENTITY,
    name VARCHAR(50)
);

INSERT INTO Tasks (title, task_description, task_status, created_at, updated_at)
Values('Tarefa TaskManager em SpringBoot', 'Descrição da tarefa', 'Em andamento', GETDATE(), GETDATE());

INSERT INTO TestTable (name) VALUES ('Sample Data');

SELECT * FROM Tasks