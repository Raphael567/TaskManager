CREATE DATABASE TaskManager;

USE TaskManager;

CREATE TABLE Tasks (
	task_id BIGINT NOT NULL IDENTITY PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	task_description VARCHAR(255),
	task_status VARCHAR(25) NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	CONSTRAINT CHK_TaskStatus CHECK (task_status IN ('PENDENTE', 'EM_ANDAMENTO', 'CONCLUIDA'))
);

ALTER TABLE Tasks
ADD CONSTRAINT DF_Tasks_CreatedAt
DEFAULT CONVERT(date, GETDATE()) FOR created_at;

INSERT INTO Tasks (title, task_description, task_status, created_at, updated_at)
Values('Tarefa TaskManager em SpringBoot', 'Descrição da tarefa', 'PENDENTE', CONVERT(date, GETDATE()), CONVERT(date, GETDATE()));

INSERT INTO Tasks (title, task_description, task_status, created_at, updated_at)
Values('SampleData', 'Descrição da tarefa', 'EM_ANDAMENTO', CONVERT(date, GETDATE()), CONVERT(date, GETDATE()));

INSERT INTO Tasks (title, task_description, task_status, created_at, updated_at)
Values('Testando', 'Descrição da tarefa', 'CONCLUIDA', CONVERT(date, GETDATE()), CONVERT(date, GETDATE()));

INSERT INTO Tasks (title, task_description, task_status, updated_at)
Values('Testando Alter Table', 'Descrição da tarefa', 'CONCLUIDA', CONVERT(date, GETDATE()));

SELECT * FROM Tasks