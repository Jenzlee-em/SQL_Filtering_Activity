-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2026 at 11:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bullanday_jenalee`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `membership_level` varchar(20) DEFAULT NULL,
  `join_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `city`, `membership_level`, `join_date`) VALUES
(1, 'Alice', 'Cebu', 'Gold', '2025-01-10'),
(2, 'Bob', 'Bohol', 'Silver', '2025-01-15'),
(3, 'Charlie', 'Cebu', 'Bronze', '2025-02-10'),
(4, 'Diana', 'Tagbilaran', 'Gold', '2025-02-12'),
(5, 'Ethan', 'Bohol', 'Silver', '2025-03-01'),
(6, 'Fiona', 'Cebu', 'Gold', '2025-03-05'),
(7, 'George', 'Tagbilaran', 'Bronze', '2025-03-08'),
(8, 'Hannah', 'Cebu', 'Silver', '2025-04-01'),
(9, 'Ian', 'Bohol', 'Gold', '2025-04-10'),
(10, 'Julia', 'Cebu', 'Bronze', '2025-04-15');

--
-- 1.List all customers from Cebu.
SELECT * FROM Customers WHERE City = 'Cebu';

--2. Find all Gold membership customers.
SELECT * FROM Customers WHERE Membership = 'Gold';


--3. List customers whose names start with “A” or “D”.
SELECT * FROM Customers WHERE CustomerName LIKE 'A%' OR CustomerName LIKE 'D%';


--4. Find customers from Cebu who have Silver or Gold membership.
SELECT * FROM Customers WHERE City = 'Cebu' AND (Membership = 'Silver' OR Membership = 'Gold');


--5. Select customers who joined between 2025-02-01 and 2025-03-31.
SELECT * FROM Customers WHERE JoinDate BETWEEN '2025-02-01' AND '2025-03-31';


--6. Find customers from either Bohol or Tagbilaran with Bronze membership.
SELECT * FROM Customers WHERE City IN ('Bohol', 'Tagbilaran') AND Membership = 'Bronze';


--7. List all customers whose names contain the letter “a” (case-insensitive).
SELECT * FROM Customers WHERE CustomerName LIKE '%a%';


--8. Find all customers from Cebu who are Gold members and joined before March 2025.
SELECT * FROM Customers WHERE City = 'Cebu' AND Membership = 'Gold' AND JoinDate < '2025-03-01';


--9. List all customers from Bohol or Tagbilaran who joined on or before February 2025 and have
--Silver or Bronze membership.

SELECT * FROM Customers 
WHERE City IN ('Bohol', 'Tagbilaran') 
AND JoinDate <= '2025-02-28' 
AND Membership IN ('Silver', 'Bronze');


--10. Select all customers except those whose customer_id is 1, 4, or 6, and who joined after
--February 2025.
SELECT * FROM Customers 
WHERE CustomerID NOT IN (1, 4, 6) 
AND JoinDate > '2025-02-28';


--11. List customers who joined in April 2025, are from Cebu or Bohol, and are not Bronze members.
SELECT * FROM Customers 
WHERE JoinDate BETWEEN '2025-04-01' AND '2025-04-30'
AND City IN ('Cebu', 'Bohol')

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
