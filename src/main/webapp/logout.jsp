<!--
  Copyright (C) 2011  Adam Hocek. Contact: ahocek@gmail.com,  Udaya K Ghattamaneni. 
  Contact: ghattamaneni.uday@gmail.com 
  
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.
  
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.
  
  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="edu.maristit.xmppwebchat.*,java.util.*" %>
<body>
<%
String userName = request.getParameter("userName");
		//xmppManager.init("", "");
	 List<edu.maristit.xmppwebchat.XmppManager> XMPPConnections= null;
	

		if(session.getAttribute("xmppConns")!=null){
			try{
	 		XMPPConnections = (List<edu.maristit.xmppwebchat.XmppManager>) session.getAttribute("xmppConns");
			int size=XMPPConnections.size();
			for(int i =0;i<size;i++){
				edu.maristit.xmppwebchat.XmppManager connection = XMPPConnections.get(i);
					//connection.disconnect();
				if(userName.equals(connection.getConnection().getUser())){
					//connection.getConnection().disconnect();
					XMPPConnections.remove(connection);
					//connection.destroy();
					//break;
					i--;
				}
			}
			}catch(Exception e){
			}
			session.setAttribute("xmppConns",  XMPPConnections);
			out.println("Logged out user "+userName+" !");
		}
		
		

%>
<br/><br/>
Click <a href="login.html">here</a> to login again..
</body>
</html>
