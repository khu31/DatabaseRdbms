
# ERP-CRM Database Project (SQL Server)

## Project Overview
This project is a **complete ERP–CRM backend database system** developed using **Microsoft SQL Server (T-SQL)**.  
It models real-world business operations including **customers, products, orders, payments, accounts, employees, payroll, and CRM leads**.

The project demonstrates strong knowledge of:
- Relational database design
- Stored procedures and business logic
- Reporting and analytics queries
- SQL Server Agent jobs
- Financial and payroll calculations

---

## Database Architecture
**Database Name:** `Erp-Crm`

### Core Modules
- **Customer Management**
- **Category & Sub-Category Management**
- **Product & Inventory Management**
- **Orders & Sales Orders**
- **Customer Payments & Accounts**
- **Expense Management**
- **Employee Management**
- **Attendance Tracking**
- **Payroll Processing**
- **CRM Leads & Feedback**
- **Reports & Analytics**
- **User Role & Permission Management (RBAC)**

---

## Tables Included
- `Customer`
- `Category`
- `SubCategoryProducts`
- `Products`
- `Orders`
- `SalesOrders`
- `CustomerPaymentDetails`
- `AccountDetails`
- `ExpenseManaging`
- `CustomerFeedback`
- `Employees`
- `EmployeeDailyAttendence`
- `PayrollManagement`
- `Leads`

- `UserMst` (User Master)
- `RoleMst` (Role Master)
- `ModuleMst` (Module Master)
- `RoleModule` (Role-Module Mapping)
- `USerRole` (User-Role Mapping)
- `ModuleMst2` (Recursive Module Hierarchy)

All tables use:
- Primary keys
- Foreign keys with cascade rules
- Default values
- Constraints and validations

---

## Stored Procedures
This project contains **30+ stored procedures** including:

### Insert Operations
- `insertCustomer`
- `insertCategory`
- `insertSubCategory`
- `insertProducts`
- `insertOrders`
- `insertSalesOrders`
- `insertCustomerPaymentDetails`
- `insertEmployees`
- `insertEmployeeDailyAttendence`
- `insertPayrollManagement`
- `insertLeads`
- `insertUserMaster`
- `insertRoleMst`
- `insertModuleMst`
- `insertRoleModule`
- `insertUserRole`
- `insertdataalltable` (Bulk insert wrapper)

### Business Logic Procedures
- Payroll calculation based on attendance
- Account balance computation
- Monthly order & sales archival
- Automated sub-category insertion
- Dynamic update procedures (`update_table` using Dynamic SQL)
- Monthly status update jobs
- `updatealltable` (Universal update procedure)
- `get_listUserRole` (Retrieves user roles)
- `get_listOfModule` (Retrieves user modules)

---

## Functions & Views
### Scalar & Table-Valued Functions
- Customer order details
- Total payment by customer
- Highest selling product
- Employee payroll summary
- Lead score filtering
- `findMaxSaleOfProduct` (Table-valued)

### Views
- `MaxProduct` – identifies most sold products

---

## Reporting & Analytics
Complex reporting queries include:
- Customer purchase history
- Sales vs orders comparison
- Payment success/failure analysis
- Account balance tracking
- Payroll summaries
- Monthly and category-wise reports
- `get_detailed_order_report`: Advanced reporting using **CTEs** to filter by:
    - Customer Name
    - Date Range
    - Minimum Payment Amount
    - Category Name

Temporary tables and CTEs are used for:
- Performance optimization
- Readable analytical queries

---

## SQL Server Agent Jobs
This project demonstrates **job automation**, including:
- **erpcrm job1**: Automates order updates.
- **insert subcategory / insertDataSubCat**: Automated data insertion simulations.
- **PastOrderStatusUpdate**: Monthly maintenance job to archive past orders and sales orders.
- Notification-based jobs with email alerts.

---

## Data Integrity & Validation
- `CHECK` constraints for attendance status
- Unique constraints on emails & phone numbers
- Cascading deletes to maintain consistency
- NULL validation using `ISNULL` and conditional logic
- Secure execution using `EXECUTE AS USER`
- **Dynamic SQL**: Used in `update_table` for flexible updates.
- **Recursive CTEs/Logic**: Used in `ModuleMst2` for handling parent-child module hierarchies.

---

##  How to Run the Project

### Prerequisites
- Microsoft SQL Server (2019 or higher recommended)
- SQL Server Management Studio (SSMS)

### Steps
1. Create database:
   ```sql
   CREATE DATABASE [Erp-Crm];
=======
# DatabaseRdbms
>>>>>>> cdb2f1b0c48754ae4311312b427f5d6ed9a807b4
