<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

  <body>
  <!-- Theme Loader -->
  <jsp:include page="theme-loader.jsp"></jsp:include> 
  
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">  
  
  <!-- Navbar --> 
  <jsp:include page="navbar.jsp"></jsp:include>
      

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
              
   <!-- NavBarMenu -->           
   <jsp:include page="navbarmainmenu.jsp"></jsp:include>
                  
                  <div class="pcoded-content">
                  
   <!-- Page Header -->                   
   <jsp:include page="page-header.jsp"></jsp:include>       
                
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                        
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">
                                        <h1>Conteúdo das páginas base do sistemas</h1>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Java File -->   
<jsp:include page="javafile.jsp"></jsp:include>    
   
</body>

</html>
