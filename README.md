# District-Based Database Management System

A comprehensive database solution designed to organize, manage, and analyze regional data at the division and district levels. Built as part of the **CSE 212: Database Systems Lab** course at the **University of Asia Pacific**.

---

## 📋 Project Overview

The District-Based Management System addresses the needs of administrative bodies, tourism boards, and urban developers by centralizing relational data across various sectors:

* **Administrative & Demographic:** Divisions, districts, land types, population, and area.
* **Culture & Tourism:** Famous places, local delicacies, events, and notable personalities.
* **Transport & Infrastructure:** Route maps, transport modes, distances, and fare structures.
* **Services:** Healthcare facility capacities and educational institution breakdowns.

---

## 👥 Target Users

1. **District Administrators:** Resource distribution and operational management.
2. **Department Heads:** Budget tracking across healthcare, education, and infrastructure.
3. **Field Officers:** Data collection and regional verification.
4. **Public Agencies:** Emergency services and utility planning.

---

## 🛠️ Relational Model & Architecture

### Entity-Relationship (ER) Diagram
<img width="1928" height="1448" alt="er_diagram" src="https://github.com/user-attachments/assets/6d21eb42-980e-4b29-8881-466602e4b745" />

### Database Schema
<img width="1408" height="784" alt="image" src="https://github.com/user-attachments/assets/aa16f24f-60d0-4767-86b2-470e3d3b7127" />


### Key Entities
* `Division` (1:M) `District`
* `District` (1:1) `LocalLanguages`
* `District` (1:M) `Education_Type`, `District_Famous_Person`, `Famous_Food`, `District_Health_Facilities`, `Cultural_Event`, `Famous_Places`
* `Transport_Type` (1:M) `Transport_Route` (M:M with `District`)

---

## 💻 Sample SQL Queries

### High-Education Districts (>75%)
```sql
SELECT District_Name, Education_Percentage
FROM District
WHERE Education_Percentage > 75;
```

### High-Fare Transport Routes
```sql
SELECT tr.Route_ID, tr.Start_Point, tr.End_Point, tr.Fare
FROM Transport_Route tr
WHERE tr.Fare > (SELECT AVG(Fare) FROM Transport_Route);
```

### Famous Food Count by Division
```sql
SELECT d.Division_ID, COUNT(ff.Food_ID) AS Total_Foods
FROM District d
INNER JOIN Famous_Food ff ON d.District_Name = ff.District_Name
GROUP BY d.Division_ID
HAVING COUNT(ff.Food_ID) > 3
ORDER BY Total_Foods DESC;
```

---

## 👥 Team & Acknowledgments

* **Course:** CSE 212 - Database Systems Lab
* **Instructor:** Alif Ruslan (Lecturer, Department of CSE, UAP)
* **Team Members (Team Rahman):**
  * Sanjida Rahman (ID: 22201187)
  * Nazia Rahman (ID: 22201188)
  * Sajid Shahan Rahman (ID: 22201186)
