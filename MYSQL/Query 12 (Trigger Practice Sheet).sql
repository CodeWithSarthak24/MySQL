use DB5;

-- Question 1 — Prevent Invalid Salary Updates ⭐

/*

Requirement: Create a trigger with the following rules:

When someone updates an employee's salary, check the new salary_per_hour.
If the new salary is less than 1000, reject the update.

Display the error message: Salary per hour cannot be less than 1000

Otherwise, allow the update.

Make sure total_salary is recalculated using: salary_per_hour × total_work_hour

*/

-- Solution:

DELIMITER //

CREATE TRIGGER account_update_trigger
BEFORE UPDATE ON UserDetail
FOR EACH ROW
BEGIN
    IF NEW.salary_per_hour < 1000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary per hour cannot be less than 1000';
    END IF;

    SET NEW.total_salary = NEW.salary_per_hour * NEW.total_work_hour;
END //

DELIMITER ;

-- Problem 2 Suppose you have an Account table linked to UserDetail.

/*
Requirement: When an account's balance is updated, prevent the update if the new balance is negative.

Without writing the full SQL yet, tell me:

Which trigger event and timing will you use?
Will you check OLD.balance or NEW.balance?
Which statement will you use to reject a negative balance?

*/

-- Solution:

DELIMITER //

CREATE TRIGGER account_update_trigger
BEFORE UPDATE ON Account
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Balance cannot be negative';
    END IF;
END//

DELIMITER ;

-- Problem 3. Your next challenge — Intermediate ⭐

/*

Let's increase the difficulty slightly.

Suppose your Account table has these columns:

account_id
name
id
balance
Requirement

Create a trigger that prevents a user's account balance 
from being reduced by more than ₹10,000 in a single update.

*/

-- Solution:

DELIMITER //

CREATE TRIGGER account_update_trigger
BEFORE UPDATE ON Account
FOR EACH ROW
BEGIN
    IF OLD.balance - NEW.balance > 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Balance reduction cannot exceed 10000';
    END IF;
END//

DELIMITER ;