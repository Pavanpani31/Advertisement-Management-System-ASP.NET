# Advertisement-Management-System-ASP.NET
An ASP.NET web application for managing advertisements. Built with C#, ASP.NET, MySQL, Xampp it allows users to register/login, post ads, and manage them. Admin can approve/reject users and ads through a dashboard.

# 📢 Advertisement Management System (ASP.NET + C# + MySQL)

This is a **full-stack web application** built using **ASP.NET Web Forms, C#, and MySQL**.  
It provides a platform for users to register, login, and post advertisements.  
Admins can approve/reject users and ads through a dedicated dashboard.  

---

# Features  

# User Module  
- Register and login with session handling  
- Post advertisements (title, description, image/video)  
- Manage (edit/delete) own ads  

# Admin Module  
- Approve or reject user accounts  
- Approve, reject, or delete ads  
- Manage users & ads using **GridView** dashboards
- Download in Excel or World format both User's list and Ads list

# UI & Functionality  
- Built with **ASP.NET Web Forms + Bootstrap**  
- Authentication handled via ASP.NET sessions  
- Database integration using **MySQL**  

# Tech Stack  

- Frontend & Backend: ASP.NET Web Forms, C#  
- Database:  MySQL or Xampp  
- UI Framework:  Bootstrap  
- IDE/Tools: Visual Studio, NuGet, GitHub  

---
# Suggested Repository Structure
Advertisement-Management-System-ASP.NET/
│
├── App_Code/                  # Utility classes, DB connection

├── App_Data/                  # SQL scripts or local DB if used

├── Models/                    # C# Classes (User, Ads)

├── Pages/                     # ASPX pages (Login, Register, AddAds, AdminDashboard)

│   ├── Login.aspx

│   ├── Register.aspx

│   ├── AddAds.aspx

│   ├── AdminDashboard.aspx

│   └── MasterPage.master      # Common layout

├── Scripts/                   # JS, jQuery, Bootstrap

├── Styles/                    # CSS

├── Web.config                 # App configuration

├── README.md

└── LICENSE

# 📂Project Structure  
Advertisement-Management-System/
│
├── images/ # Images used in UI (home.jpg, login.jpg, logo.png, register.png)

├── Scripts/ # JavaScript, jQuery, Bootstrap

├── addAds.aspx # Page for adding ads

├── AdManagement.aspx # Page for managing ads (user side)

├── admindashboard.aspx # Admin dashboard for user/ad approval

├── login.aspx # User login page

├── register.aspx # User registration page

├── logout.aspx # Logout with session clear

├── home.aspx # Homepage

├── Site.Master # Master layout page

├── Web.config # App configuration (connection string, session settings)

├── Global.asax # Application-level events

└── Default.aspx # Default start page
# 1. Setup Database (MySQL)  
- Create a database `advertisementdb` (or your own name).  
- Add tables for **Users** and **Ads**. Example schema:  

```sql
CREATE TABLE Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255),
    Status VARCHAR(50), -- Pending/Approved
    CreatedOn DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Ads (
    AdId INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200),
    Description TEXT,
    MediaPath VARCHAR(255),
    Status VARCHAR(50), -- Pending/Approved
    PostedOn DATETIME DEFAULT CURRENT_TIMESTAMP,
    UserEmail VARCHAR(100),
    FOREIGN KEY (UserEmail) REFERENCES Users(Email)
);

2. Configure Web.config

Update the connection string:

<connectionStrings>
  <add name="cons" 
       connectionString="server=localhost;user id=root;password=yourpassword;database=advertisementdb" 
       providerName="MySql.Data.MySqlClient"/>
</connectionStrings>

3. Run in Visual Studio

Open the project in Visual Studio

Press F5 or run with IIS Express

The project will launch in your browser

📸 Screenshots (Add Later)
✅ Home Page
![1](https://github.com/user-attachments/assets/72943271-6ff2-4339-b4a2-545e08d4c218)
✅ Login Page
![Untitled3](https://github.com/user-attachments/assets/ccacb830-b637-4b8a-8fe6-a5776cae427a)
✅ Register Page
![Untitled](https://github.com/user-attachments/assets/f5197b10-86bd-498f-8d0f-3a3914beae8e)
✅ User Dashboard
![Untitled2](https://github.com/user-attachments/assets/6b771935-9a71-4fbd-945b-edab3c6ebe56)
✅ Admin Dashboard

📌 Future Improvements

Add password encryption (Hash + Salt)

Implement role-based authentication

Improve UI with modern Bootstrap theme

Add export (CSV/PDF) for ads management 

