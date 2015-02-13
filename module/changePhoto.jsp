<%@page import="java.util.*,
				java.lang.Integer,
				blackboard.base.*,
				blackboard.data.*,
                blackboard.data.user.*,
				blackboard.data.course.*,
                blackboard.persist.*,
                blackboard.persist.user.*,
				blackboard.persist.course.*,
                blackboard.platform.*,
                blackboard.platform.persistence.*,
				blackboard.portal.external.*"
        errorPage="/error.jsp"                
%>
<%@ taglib uri="/bbData" prefix="bbData"%>                
<%@ taglib uri="/bbUI" prefix="bbUI"%>
<bbData:context id="ctx">
<style type="text/css">
<!--
.style1 {color: #FF0000}
.style2 {
	font-size: 12px;
	font-style: italic;
}
-->
</style>
<bbUI:docTemplate title="Change My Photo">
<bbUI:titleBar iconUrl="/images/ci/icons/user_u.gif">Change my photo</bbUI:titleBar>
<%
User thisUser = ctx.getUser();
String strUsername = thisUser.getUserName();

BbPersistenceManager bbPm = BbServiceManager.getPersistenceService().getDbPersistenceManager();

UserDbLoader loader = (UserDbLoader) bbPm.getLoader( UserDbLoader.TYPE );
blackboard.data.user.User userBb = loader.loadByUserName(strUsername);

String email = userBb.getEmailAddress();
%>
<p align="justify">This page will let you submit a request  to change your photo. 
Updating the photo might take several days, as it goes through a screening process.
<p align="justify"><span class="style1">Note:</span>
  Once uploaded, your photo will be scaled down to fit into our display (150 by 150 pixels). 
  If you are not clearly identifiable in the photo, it will be rejected.<br>
  Reasons for rejection include:
<ul>
	<li>photo is too small</li>
    <li>your face is too small in the photo</li>
    <li>excessive distortion in the photo</li>
    <li>faded colors</li>
    <li>low quality of the image</li>
    <li>wearing dark sunglasses</li>
    and others.</ul>
<form action="https://octet1.csr.oberlin.edu/octet/Bb/PhotoRequests/changePhoto.php" method="post" enctype="multipart/form-data" name="photoform">
    <input name="file" type="file" size="50">
    <input name="process" type="hidden" id="process" value="1">
	<input name="uid" type="hidden" id="uid" value="<%=strUsername%>">
	<input name="uemail" type="hidden" id="uemail" value="<%=email%>">
	<br>
	<span class="style2">This tool will only accept photos in the JPEG format. Make sure that your photo's name ends in .jpg or .jpeg before submitting it. </span><br>
<div align="right"><input type="submit" name="Submit" value="Submit"></div>
</form>
</bbUI:docTemplate>
</bbData:context>