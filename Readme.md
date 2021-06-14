# ITHS_CMS Project

#### _ITHS_CMSProject is a Content Management System Project._

### Project framework version -
- ITHS_CMSProject : .NET 5.0
- CMS_APIProject : .NET 5.0
- DataAccess_CMSProject : .NETCore 3.1

### Features
- The project has microservices based implementation.
- ITHS_CMSProject : This is frontend project developed using _Razor Pages_. As I had previously used this technology in the prior project and in order to complete the project and show better and more features in the given time frame, thought of using Razor Pages.
- CMS_APIProject : As using microservices approach, this project is the API containing the controllers(microservices) which is connected to the database.
- DataAccess_CMSProject : This project has the database - including aspnet authorization authentication and the database tables.

### Installation 
Follow the below steps:
- Initially execute the command in Package manager Console : Add-migration create and update-database in ITHS_CMSProject to create the authorization and authentication tables. 
- Again execute the command in Package manager Console : Add-migration initialcreate and update-database in CMS_APIProject and DataAccess_CMSProject to create the project tables.
- All the blog images will be saved in this folder - "BlogImagePath": "images\\BlogImages\\"

