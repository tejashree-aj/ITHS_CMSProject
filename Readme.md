# ITHS_CMS Project

#### _ITHS_CMSProject is a Content Management System Project._

### Time Overview
Start Date - 17/05/20121
End Date - 16/05/2012

### Technologies Required
##### Technical platform:
Windows
##### Server solution:
IIS
##### Project framework version :
- ITHS_CMSProject : .NET 5.0
- CMS_APIProject : .NET 5.0
- DataAccess_CMSProject : .NETCore 3.1
##### List of library / Nuget packages
- Microsoft.AspNet.MVC
- Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore
- Microsoft.AspNetCore.Identity.EntityFrameworkCore
- Microsoft.AspNetCore.Identity.UI
- Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation
- Microsoft.EntityFrameworkCore.SqlServer
- Microsoft.EntityFrameworkCore.Tools
- Microsoft.VisualStudio.Web.CodeGeneration.Design
##### Database solution
MS SQL
#####  Server environment
Azure

### Features
- The project has microservices based implementation.
- ITHS_CMSProject : This is frontend project developed using _Razor Pages_. As I had previously used this technology in the prior project and in order to complete the project and show better and more features in the given time frame, thought of using Razor Pages.
- CMS_APIProject : As using microservices approach, this project is the API containing the controllers(microservices) which is connected to the database.
- DataAccess_CMSProject : This project has the database - including aspnet authorization authentication and the database tables.

### Installation 
Follow the below steps:
- SQL Script i available in SQLScripts folder. Once executed in database, then update database connection string in appsettings.json file.
- All the blog images will be saved in this folder - "BlogImagePath": "images\\BlogImages\\"

### EndPoint
API Project Swagger Link - https://iths-cms-api.azurewebsites.net/swagger/index.html

### Functionality
#####Login:
UserName - admin@cms.se
Password - Admin@123
#####Admin Page : 
Its a content management system project, in the admin section one can add content, edit or delete, which is displayed on the website.



