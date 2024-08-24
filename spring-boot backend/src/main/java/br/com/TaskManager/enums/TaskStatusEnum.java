package br.com.TaskManager.enums;

import lombok.Getter;

@Getter
public enum TaskStatusEnum {
    PENDENTE("Pendente"),
    EM_ANDAMENTO("Em Andamento"),
    CONCLUÍDA("Concluída");

    private String status;

    TaskStatusEnum(String status) {
        this.status = status;
    }

    public static TaskStatusEnum fromString(String status) {
        for (TaskStatusEnum taskStatusEnum : TaskStatusEnum.values()) {
            if (taskStatusEnum.status.equalsIgnoreCase(status)) {
                return taskStatusEnum;
            }
        }
        throw new IllegalArgumentException("Status inválido: " + status);
    }
}
