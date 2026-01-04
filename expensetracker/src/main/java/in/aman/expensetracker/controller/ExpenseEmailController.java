package in.aman.expensetracker.controller;

import in.aman.expensetracker.service.ExpenseExcelService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/expenses")
public class ExpenseEmailController {

    private final ExpenseExcelService expenseExcelService;

    @GetMapping("/email-excel")
    public ResponseEntity<String> emailExpenseExcel() {
        expenseExcelService.emailExpenseExcel();
        return ResponseEntity.ok("Expense excel emailed successfully");
    }
}
