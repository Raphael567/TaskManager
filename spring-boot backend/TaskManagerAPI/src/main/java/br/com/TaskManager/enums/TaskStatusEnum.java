package br.com.TaskManager.enums;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonFormat(shape = JsonFormat.Shape.STRING)
public enum TaskStatusEnum {

    @JsonProperty("PENDING")
    PENDENTE,
    @JsonProperty("INPROGRESS")
    EM_ANDAMENTO,
    @JsonProperty("COMPLETED")
    CONCLUIDA
}
