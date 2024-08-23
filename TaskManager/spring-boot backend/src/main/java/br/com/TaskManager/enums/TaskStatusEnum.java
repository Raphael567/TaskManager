package br.com.TaskManager.enums;

public enum TaskStatusEnum {
    PENDENTE("Pendente"),
    EM_ANDAMENTO("Em andamento"),
    CONCLUÍDA("Concluída");

    private String status;

    TaskStatusEnum(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
