package br.com.TaskManager.services;

import br.com.TaskManager.entities.TestTable;
import br.com.TaskManager.repositories.TestTableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TestTableService {

    @Autowired
    private TestTableRepository testTableRepository;

    public List<TestTable> getAllTestTables() {
        return testTableRepository.findAll();
    }

    public Optional<TestTable> getTestTableById(Long id) {
        return testTableRepository.findById(id);
    }

    public TestTable createTestTable(TestTable testTable) {
        return testTableRepository.save(testTable);
    }

    public TestTable updateTestTable(Long id, TestTable testTable) {
        testTable.setId(id);
        return testTableRepository.save(testTable);
    }

    public void deleteTestTable(Long id) {
        testTableRepository.deleteById(id);
    }
}
