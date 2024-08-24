package br.com.TaskManager.controllers;

import br.com.TaskManager.entities.TestTable;
import br.com.TaskManager.services.TestTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/test-tables")
public class TestTableController {

    @Autowired
    private TestTableService testTableService;

    @GetMapping
    public List<TestTable> getAllTestTables() {
        return testTableService.getAllTestTables();
    }

    @GetMapping("/{id}")
    public ResponseEntity<TestTable> getTestTableById(@PathVariable Long id) {
        Optional<TestTable> testTable = testTableService.getTestTableById(id);
        return testTable.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public TestTable createTestTable(@RequestBody TestTable testTable) {
        return testTableService.createTestTable(testTable);
    }

    @PutMapping("/{id}")
    public ResponseEntity<TestTable> updateTestTable(@PathVariable Long id, @RequestBody TestTable testTable) {
        TestTable updatedTestTable = testTableService.updateTestTable(id, testTable);
        return ResponseEntity.ok(updatedTestTable);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTestTable(@PathVariable Long id) {
        testTableService.deleteTestTable(id);
        return ResponseEntity.noContent().build();
    }
}