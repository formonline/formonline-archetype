#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ include file="/entete.jsp"%>

<jsp:useBean id="userdata" 	class="formOnLine.msBeans.UserData" 		scope="session" /> 
<jsp:useBean id="stats" 	class="com.triangle.lightfw.ValueBeanList" 	scope="session" />
<jsp:useBean id="params" 	class="java.util.HashMap" 					scope="session" />
	
<% 
com.triangle.lightfw.ValueBeanList listRep2= userdata.getListRep();
formOnLine.msBeans.SubmitForm rep1= userdata.getRep(userdata.getId()); 

//gestion des tests en mode pilote
boolean isTest = false || (new java.lang.Boolean((String)params.get("isTest"))).booleanValue() ; // Test pilotes...
String listeTest = "";
listeTest = (String)params.get("listeTest");
String tabTest = "";
tabTest = (String)params.get("tabTest"); 
boolean testId = false;
if (rep1!=null && listeTest != null) { 
    if (listeTest.indexOf(","+rep1.getS_id()+",")>=0) testId = true;
}

boolean isEvenement = false || (new java.lang.Boolean((String)params.get("isTabEvenement"))).booleanValue() 
|| ( tabTest!=null && tabTest.contains("EV") && isTest && testId ) ; // EV
boolean isServeur = false || (new java.lang.Boolean((String)params.get("isTabServeur"))).booleanValue() 
|| ( tabTest!=null && tabTest.contains("SE") && isTest && testId ) ; // SE
boolean isDemande = false || (new java.lang.Boolean((String)params.get("isTabDemande"))).booleanValue() 
|| ( tabTest!=null && tabTest.contains("DE") && isTest && testId ) ; // DE
boolean isAppli = false || (new java.lang.Boolean((String)params.get("isTabAppli"))).booleanValue() 
|| ( tabTest!=null && tabTest.contains("AP") && isTest && testId ) ; // DE
boolean isDataBase = false || (new java.lang.Boolean((String)params.get("isDataBase"))).booleanValue() 
|| ( tabTest!=null && tabTest.contains("DB") && isTest && testId ) ; // DB


// gestion du paramétrage onglets
String currentTab = null;
currentTab = (String)params.get("defaultTab");
if (currentTab == null) {
	if (isDemande) currentTab = "DE";
	if (isEvenement) currentTab = "EV";
	if (isAppli) currentTab = "AP";
	if (isServeur) currentTab = "SE";
	
}

%>


<!-- ******************* Bloc  identification *************** -->
<% if (rep1==null) { %>
<table width="100%" id=blocNonIdent>

	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>

	<tr>
		<td width="3%" class="border1">&nbsp;</td>
		<td width="97%" class="etape1">Identification agent</td>
	</tr>
	<tr bgcolor="${symbol_pound}FFFFFF">
		<td width="3%" class="border1">&nbsp;</td>
		<td>
		<form name=form1
			action='<%=response.encodeURL(request.getContextPath()+"/ServControl") %>'
			method='post'>
		<table width="100%" border="0" cellpadding="0" cellspacing="10"
			class="text">
			<tr>


				<td valign=top><br>
				Merci de vous authentifier ci-dessous.<br>
				(utilisez votre compte réseau)

				<table width="100%" border="0" cellpadding="3" cellspacing="0"
					class="text">
					<tr>
						<td align="right">Identifiant :</td>
						<td><input name='login' size="10"></td>
					</tr>
					<tr>
						<td align="right">Mot de passe :</td>
						<td><input name='pwd' type=password size="10"></td>
					</tr>
					<tr>
						<td align="center">&nbsp;</td>
						<td><input type='submit' name='bok' value=' OK '></td>
					</tr>
					<tr>
						<td align="right" colspan=2>
						<input type='hidden' name='action' value='LOGIN'> 
						<input name="loginPid" type="hidden" value="82"> 
						<input name="roleQid" type="hidden" value="39">
						<input name="ldapSource" type="hidden" value="novell">
						
						
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<% } else { 
    
    if (request.getParameter("currentTab")!= null)
        session.setAttribute("currentTab", request.getParameter("currentTab"));
			    
    if ( session != null && session.getAttribute("currentTab")!=null) 
			        currentTab = (String)session.getAttribute("currentTab");	

    
    
    // ******************* AFFICHAGE identifié *******************     
%><table width="100%" id=blocIdent>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr bgcolor="${symbol_pound}FFFFFF">
		<td width="3%" class="border1">&nbsp;</td>
		<td class="etape1">Fiche agent</td>
		<td rowspan=3><%	// affichage messages	 style="background-color: ${symbol_pound}F5F5F5;" 
	for (int i=0; i<listRep2.size(); i++) {
		SubmitForm sfi = (SubmitForm )listRep2.get(i);
		if (sfi.getF_id()!=4  ) continue;
		%>
		<div class=greyBox id="msg<%=i%>"><%=sfi.getTitre() %></div>
		<%   } %></td>
	</tr>
	<tr bgcolor="${symbol_pound}FFFFFF">
		<td width="3%" class="">&nbsp;</td>
		<td align="left"><%=rep1.getTitre() + " (id: "+rep1.getS_id()+")"%> <%  if (rep1.isLocked()) { %>
		<a
			href='<%=response.encodeURL(request.getContextPath()+"/ServControl?action=RDET&qid="+rep1.getF_id()+"&sid="+rep1.getS_id())%>'>Afficher</a>
		<%  } else { %> <a
			href='<%=response.encodeURL(request.getContextPath()+"/ServControl?action=RMAJ&qid="+rep1.getF_id()+"&sid="+rep1.getS_id())%>'>Afficher / Modifier</a>
		<%  }   %> <br>
		
		
		<!-- br>
		<a href=ServControl?action=QUEST&qid=17&s_id_parent=<%=rep1.getS_id()%>>
		&gt;Créer une délégation</a -->
		
		<br>
		
		<%for (int i=0; i<listRep2.size(); i++) {
		   SubmitForm sfi = (SubmitForm )listRep2.get(i);
		   if (sfi.getF_id()!=17  ) continue;    %> 
			Délégation : [<a href="ServControl?action=RDET&qid=17&sid=<%=sfi.getS_id() %>"
			><%=sfi.getPropVal(1148) %></a>] 
		<% } %> 
		
		
		</td>



	</tr>
</table>


<!--  ONGLETS  ------------------------ -->
<table class="tabSize" id=blocOnglet>
	<tr>
		<td colspan="2">
		<ul id="tabnav"  class=tabnav>
			<% 		
	if (isAppli) { 
	     	out.print("<li");
	     	if (currentTab.equals("AP")) out.print(" class='active'");
	     	out.println("><a href='");
	     	if (currentTab.equals("AP")) { out.println("${symbol_pound}"); 
	     	} else { out.println("ServControl?currentTab=AP"); }
		    out.println("'>Applications</a></li>");
	}	
			
	if (isServeur) { 
	     	out.print("<li");
	     	if (currentTab.equals("SE")) out.print(" class='active'");
	     	out.println("><a href='");
	     	if (currentTab.equals("SE")) { out.println("${symbol_pound}"); 
	     	} else { out.println("ServControl?currentTab=SE"); }
		    out.println("'>Serveurs</a></li>");
	}	
			
	 if (isDataBase) { 
	     	out.print("<li");
	     	if (currentTab.equals("DB")) out.print(" class='active'");
	     	out.println(" id=tabDB><a href='");
	     	if (currentTab.equals("DB")) { out.println("${symbol_pound}"); } 
	     	else { out.println("ServControl?currentTab=DB"); }
		    out.println("'>Bases</a></li>");
	 }
			
	if (isEvenement) { 
		     	out.print("<li  ");
		     	if (currentTab.equals("EV")) out.print(" class='active'");
		     	out.println(" id=${symbol_pound}tabEV><a href='");
		     	if (currentTab.equals("EV")) { out.println("${symbol_pound}"); } 
		     	else { out.println("ServControl?currentTab=EV"); }
			    out.println("'>Evènements</a></li>");
	 }		
	 
	 if (isDemande) { 
	     	out.print("<li");
	     	if (currentTab.equals("DE")) out.print(" class='active'");
	     	out.println(" id=tabDE><a href='");
	     	if (currentTab.equals("DE")) { out.println("${symbol_pound}"); } 
	     	else { out.println("ServControl?currentTab=DE"); }
		    out.println("'>Demandes</a></li>");
	 }
  
	
  
       
     
    
%>
		</ul>
		</td>
	</tr>
	<!--  ONGLETS  ------------------------ -->

</table>
<table width="100%" >



<%
//  ************ evenemetns ***************************
if (isEvenement && currentTab.equals("EV")) { %>
	<%@ include file="/tab_EV.jsp"%>
<% } 

//  ************ serveurs ***************************
if (isServeur && currentTab.equals("SE")) { %>
	<%@ include file="/tab_SE.jsp"%>
<% } 

//  ************ demandes ***************************
if (isDemande && currentTab.equals("DE")) { %>
	<%@ include file="/tab_DE.jsp"%>
<% } 

//  ************ demandes ***************************
if (isAppli && currentTab.equals("AP")) { %>
	<%@ include file="/tab_AP.jsp"%>
<% } 

//  ************ demandes ***************************
if (isDataBase && currentTab.equals("DB")) { %>
	<%@ include file="/tab_DB.jsp"%>
<% } %>



</table>

<% } %>
<% if (rep1!=null && currentTab!=null && !currentTab.equals("SF") && !currentTab.equals("FT")) { %>
<table class=tabSize id=blocAttention>
	<tr>
		<td colspan=2 align="center"><span class="redText">Attention !<br>
		Il est nécessaire de VALIDER & TRANSMETTRE vos formulaires <br>
		pour que ceux-ci soient pris en compte.</span></td>
	</tr>
</table>
<% } %>


<% // ************************************
   // LOGIN + MOT DE PASSE si accès direct  
   // ************************************
   
if ( sessionInfos != null 
        && !sessionInfos.isInJahia() 
        && sessionInfos.getRole()==0 
        && rep1 == null
        && request.getParameter("admin")!=null ) 
{ %>
<table class=tabSize id=blocAdminIdent>
	<tr>
		<td colspan=2 align="center"><br>
		<br>
		<br>
		<br>
		<br>

		<form name=form2
			action='<%=response.encodeURL(request.getContextPath()+"/ServControl") %>'
			method='post'>
		<table border="0" align="center" cellpadding="2" cellspacing="1"
			bgcolor="${symbol_pound}F2F2DA">
			<tr>
				<td colspan="2" align="center" bgcolor="${symbol_pound}006699" class="bigWhite">
				Connexion ADMIN</td>
			</tr>
			<tr bgcolor="${symbol_pound}F2F2DA">
				<td align="right" class="text">Nom :</td>
				<td><input name="adm_login" size="15"></td>
			</tr>
			<tr bgcolor="${symbol_pound}F2F2DA">
				<td align="right" class="text">Mot de passe :</td>
				<td><input name="adm_pwd" size="15" type="password"></td>
			</tr>
			<tr bgcolor="${symbol_pound}F2F2DA">
				<td align="right" class="text">&nbsp;</td>
				<td align="left" class="text"><input name="ok" type="submit"
					value="OK"> <input name="loginPid" type="hidden" value="32"> <input
					name="roleQid" type="hidden" value="32"> <input name="ldapSource"
					type="hidden" value=""> <!--  input type='hidden' name='action' value='LOGIN' -->

				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<% } // fin if isinjahia %>
<%@ include file="/footer.jsp"%>


