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
<SCRIPT LANGUAGE="JavaScript">
function imageError(theImage)
{
theImage.src="http://octet1.csr.oberlin.edu/octet/Bb/Faculty/img/noimage.jpg";
theImage.onerror = null;
}
</script>
 <style type="text/css">
<!--
.style1 {
	color: black;
	font-weight: bold;
}
.style2{
	color: #280000 ;
	font-weight: 300;
	font-size: 50%;
	text-shadow: 1px 1px #DCDCDC;
}
.style3 {
	color: #5D725F;
	font-weight: bold;
	//background-color:#993300;
	border-bottom:dashed;
	text-shadow:#330066;
	
}
-->
 </style>

<%@ taglib uri="/bbData" prefix="bbData"%>                
<%@ taglib uri="/bbUI" prefix="bbUI"%>
<bbData:context id="ctx">
<%
User thisUser = ctx.getUser();

String strUsername = thisUser.getUserName();
String strFirstName = thisUser.getGivenName();
String strLastName = thisUser.getFamilyName();

String userDept = thisUser.getDepartment();
String userLocation = thisUser.getJobTitle();
String userPosition = thisUser.getCompany();
String userWebsite = thisUser.getWebPage();
String userPhone = thisUser.getBusinessPhone1();
%>

<div align="left" class="style3">
<span class="style1">Name:</span> <%=strFirstName %> &nbsp <%=strLastName%> <br/></div>
<table border="0">
<tr>
<td width="80">
<p>
<img src="https://octet1.csr.oberlin.edu/octet/Bb/Photos/expo/<%=strUsername%>/profileImage" alt=""  width="69"  onError="imageError(this)"/>
</p>
<br/>
<i>
<%
if (thisUser.getWebPage() != null && 
                       thisUser.getWebPage() != "") {%><a href="<%=userWebsite%>" target="_blank" >Website</a><%}
else {%>no website listed <%}
%>
</i><br/>
<a href="https://blackboard.oberlin.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_61_1&forwardUrl=edit_module/_803_1/changePhoto.jsp">Change Photo<a/><br/>
<a href="/webapps/blackboard/execute/launcher?type=PersonalInfo&id=_1_1&url=">Check Info</a>

</td>
<td>
<span class="style1">Position:</span><br/>
 <span  style="font-size:x-small;"><i>&nbsp <%=userPosition%>
</i></span><br/>
<span class="style1">Dept:</span><br/>
 <span style="font-size:x-small;"><i>&nbsp <%=userDept%>
</i></span><br/>
<span class="style1">Location:</span><br/>
 <span  style="font-size:x-small;"><i>&nbsp <%=userLocation%>
</i></span><br/><span class="style1">Phone:</span><br/>
 <span  style="font-size:x-small;"><i>&nbsp <%=userPhone%>
</i></span><br/>


</td></tr>
</table>
</i> 
</div>
</bbData:context>
