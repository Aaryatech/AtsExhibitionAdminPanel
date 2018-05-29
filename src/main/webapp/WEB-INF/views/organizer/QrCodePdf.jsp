<%@page
contentType="text/html; charset=ISO8859_1"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QrCode PDF</title>

</head>
<body>
						<h6 align="center">Exhibitor List</h6>

      <table width="100%" border="0"  cellpadding="0" cellspacing="0" style="border-top:1px solid #313131;border-right:1px solid #313131">
  <tr>
    <td   width="2%"  style="border-bottom:1px solid #313131; border-bottom:1px solid #313131;border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;">No.</td>
    <td align="left" width="20%"  style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:15px;color:#000; font-size:10px;text-align: left">Exhibitor Name</td>
   <td align="center" width="10%"  style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:0.2px;color:#000; font-size:10px;">Company</td>
  <td align="center" width="10%"  style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:0.2px;color:#000; font-size:10px;">Mobile No.</td>
  
     
 <td align="center" width="25%" style=" border-bottom:1px solid #313131; border-left:1px solid #313131;border-left:1px solid #313131;  padding:10px;color:#000; font-size:10px;">Qr Code</td>
   
  </tr>
 
	<c:forEach items="${exhibitorList}" var="exhList" varStatus="count">
  <tr>
      <td align="left" style="border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:11px;">${count.index+1}</td>
      <td align="left" style="border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:11px;">${exhList.exhName}</td>
          <td align="left" style="border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:11px;">${exhList.exhCompany}</td>
    
      <td align="right" style="border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:11px;">${exhList.userMob}</td>
      <td align="center" style="border-right:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:11px;"><img src="http://exhibition.aaryatechindia.in:12756/uploads/PRODUCT/aa.png" width="120"
																			height="100"
		onerror="this.src='${pageContext.request.contextPath}/resources/img/No_Image_Available.jpg';" /></td>
  </tr>
   </c:forEach> 
</table>

 


</body>
</html>