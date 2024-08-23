CREATE DATABASE TaskManager;

USE TaskManager;

CREATE TABLE Task (
	task_id BIGINT NOT NULL IDENTITY PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	task_description VARCHAR(255),
	task_status VARCHAR(25) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	CONSTRAINT CHK_TaskStatus CHECK (task_status IN ('Pendente', 'Em Andamento', 'Concluída'))
);

INSERT INTO Task (title, task_description, task_status, created_at, updated_at)
Values('Tarefa TaskManager em SpringBoot', 'Descrição da tarefa', 'Em Andamento', GETDATE(), GETDATE());