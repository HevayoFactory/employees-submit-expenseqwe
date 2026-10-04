# Domain model

The core entities behind expense claims: employees (in a manager hierarchy),
the claims they submit, and the in-app notifications that keep everyone
informed.

```mermaid
erDiagram
    EMPLOYEE {
        string id
        string name
        string email
        string managerId
    }
    EXPENSE_CLAIM {
        string id
        string employeeId
        decimal amount
        date expenseDate
        string merchant
        string category
        string receiptUrl
        string status
        string rejectionReason
        datetime exportedAt
        datetime createdAt
    }
    NOTIFICATION {
        string id
        string userId
        string type
        string message
        boolean read
        datetime createdAt
    }

    EMPLOYEE ||--o{ EXPENSE_CLAIM : submits
    EMPLOYEE ||--o{ EMPLOYEE : "manages (direct reports)"
    EMPLOYEE ||--o{ NOTIFICATION : receives
    EXPENSE_CLAIM ||--o{ NOTIFICATION : triggers
```

An `EXPENSE_CLAIM.status` is one of `pending`, `approved`, `rejected`.
`rejectionReason` is set only when `status` is `rejected`. `exportedAt` is set
once finance includes the claim in a payroll export, and stays null until
then — an approved claim with `exportedAt` null is what payroll export lists.
`EMPLOYEE.managerId` is the self-relation a manager's "my team" queries use.