<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="org.gsm.oneapi.foundation.JSPUtils"%>    
<%@ page import="org.gsm.oneapi.mms.MMSRetrieve"%>
<%@ page import="org.gsm.oneapi.endpoints.LocalSandboxEndpoints"%>
<%@ page import="org.gsm.oneapi.endpoints.ServiceEndpoints"%>
<%@ page import="org.gsm.oneapi.foundation.JSONRequest"%>

<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", 0); 

	String submit=JSPUtils.nullOrTrimmed(request.getParameter("submit"));
	String username=JSPUtils.nullOrTrimmed(request.getParameter("username"));
	String password=JSPUtils.nullOrTrimmed(request.getParameter("password"));
	String endpoint=JSPUtils.nullOrTrimmed(request.getParameter("endpoint"));
	
	String subscriptionId=JSPUtils.nullOrTrimmed(request.getParameter("subscriptionId"));
	
	LocalSandboxEndpoints sandboxEndpoints=new LocalSandboxEndpoints();

	int responseCode=0;
	
	if (submit==null) {
		
		subscriptionId="sub789";
		
		username="Fred.Jones";
		password="1234";
		endpoint=sandboxEndpoints.getServiceEndpoints().getCancelMMSReceiptSubscriptionEndpoint();

	} else {
		sandboxEndpoints.setCancelMMSDeliverySubscription(endpoint);

		ServiceEndpoints serviceEndpoints=sandboxEndpoints.getServiceEndpoints();
		
		String authorisationHeader=JSONRequest.getAuthorisationHeader(username, password);
		
		MMSRetrieve me=new MMSRetrieve(serviceEndpoints, authorisationHeader);
	
		responseCode=me.cancelReceiptNotifications(subscriptionId);
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>    
    <title>
      GSM World | OneAPI Toolkit
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="GSM, GSMA, GSM Association, Mobile, Mobile World Congress, Mobile Asia Congress, Mobile Awards, Global Mobile Awards, 3GSM, Mobile Broadband, Spectrum, Development Fund, Mobile Money, Mobile Innovation, Pathfinder, Open Connectivity, Fraud" />
    <meta name="description" content="The GSMA represents the interests of the worldwide mobile communications industry. Spanning 219 countries, the GSMA unites more than 750 of the world&rsquo;s mobile operators, as well as 200 companies in the broader mobile ecosystem." />
    <link rel="stylesheet" href="screen.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="toolkit.css" type="text/css" media="screen" />

    <link rel="shortcut icon" href="#" />
</head>

  <body id="home">

    <div id="container">

      <div id="masthead">
        <p id="logo">
          <a href="index.html">GSM World</a>
        </p>
        <p id="strap-line">
          <strong>Connecting the World</strong>
        </p>
      </div>
      
<div id="content">

	<%@ include file="mainmenu.inc" %>
        
        <div class="col-760">
        

        <div id="other-main">
          <div class="other-top"></div>
          <div class="other-bottom">
            <div class="left">
          <h3>
            Inbound MMS API - Cancel MMS Receipt Notifications Subscription
          </h3>
          <p>
      
		</p>
		
		<form method="post" action="mmsstopsubscriptionmessagereceipts.jsp">
			<div class="ParameterGroupHeading"><strong>Mandatory Parameters</strong></div>
			<div class="ParameterRow">
				<div class="ParameterLabel">subscriptionId</div>
				<div class="ParameterValue"><input type="text" name="subscriptionId" value="<%if (subscriptionId!=null) out.print(subscriptionId); %>"/></div>
			</div>
			<div class="ParameterGroupHeading"><strong>Optional Parameters</strong></div>
			<div class="ParameterRow">
				<div class="ParameterLabel">&nbsp;</div>
				<div class="ParameterValue"><em>None</em></div>
			</div>
			<div class="ParameterGroupHeading"><strong>Service Endpoint Information</strong></div>
			<div class="ParameterRow">
				<div class="ParameterLabel">Username</div>
				<div class="ParameterValue"><input type="text" name="username" value="<%if (username!=null) out.print(username); %>"/></div>
			</div>
			<div class="ParameterRow">
				<div class="ParameterLabel">Password</div>
				<div class="ParameterValue"><input type="text" name="password" value="<%if (password!=null) out.print(password); %>"/></div>
			</div>
			<div class="ParameterRow">
				<div class="ParameterLabel">Service Endpoint</div>
				<div class="ParameterValue"><textarea name="endpoint" style="width:400px;height:80px;"><%if (endpoint!=null) out.print(endpoint); %></textarea></div>
			</div>
			<div class="ParameterRow">
				<div class="ParameterLabel">&nbsp;</div>
				<div class="ParameterValue"><hr width="50%"/></div>
			</div>
			<div class="ParameterRow">
				<div class="ParameterLabel">&nbsp;</div>
				<div class="ParameterValue"><input type="submit" name="submit" value="Submit"/></div>
			</div>

		</form>
          
          <% if (submit!=null) { %>
          	<div class="ParameterGroupHeading"><strong>Response Code</strong></div>          
          	<div class="ParameterRow">
				<div class="ParameterLabel">httpResponseCode</div>
				<div class="ParameterValue"><%=responseCode%></div>
			</div>
          <% } %>

		    <div class="ParameterRow">
				<div class="ParameterLabel">&nbsp;</div>
				<div class="ParameterValue">&nbsp;</div>				
			</div>

        </div></div></div>
        
			</div>

			

      </div>
      
		<%@ include file="footer.inc" %>

    </div>
      


</body>
</html>
