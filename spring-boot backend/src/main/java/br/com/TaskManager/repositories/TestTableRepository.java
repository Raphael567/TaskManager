package br.com.TaskManager.repositories;

import br.com.TaskManager.entities.TestTable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestTableRepository extends JpaRepository<TestTable, Long> {
}
