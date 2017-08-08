#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<% //  ************ FORMATIONS  *************************** %>


<tr>
	<td colspan="2" class="bigGreyText"><br>
	Demandes serveurs</td>
</tr>
<tr>
	<td colspan="2">&nbsp;</td>
</tr>
<tr>
	<td colspan="2">
	
	
	
        <a href='ServControl?action=QUEST&qid=2&s_id_parent=<%=rep1.getS_id()%>'>
        &gt; Créer un nouveau serveur</a><br>
   
      <br>
      
      <% if (listRep2.size()>=1) { %>

 
        
<%
		int count=0;
		for (int i=0; i<listRep2.size(); i++) {
			SubmitForm sfi = (SubmitForm )listRep2.get(i);
			
			if (sfi.getF_id()!=2) continue;
			
			count++;
			
			out.println("<span class=puce_rouge>"+sfi.getTitre()+"</span>");
			out.println("<div class=${symbol_escape}"text greyBox${symbol_escape}" style=${symbol_escape}"margin-left:20px;${symbol_escape}">");
			
			if (sfi.isLocked()) {
				
				out.println("<a href='ServControl?action=RDET&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"'  class=${symbol_escape}"fleche_orange${symbol_escape}">Consulter</a>");
				out.println(" <a href='ServControl?action=EXPO&sid="+sfi.getS_id()+"&selectExport=HTML&templateId=19&fid=2&direct' class=${symbol_escape}"fleche_orange${symbol_escape}" target=_blank>Fiche Serveur</a> ");
								
			} else {
				
				out.println(" <a href='ServControl?action=RMAJ&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"'>Consulter/Modifier</a>");
				out.println(" <a href='ServControl?action=RSUP&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"' class=${symbol_escape}"fleche_orange greyText${symbol_escape}">Supprimer</a>");
						
				out.println(" <a href='ServControl?action=LOCK&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"' class=${symbol_escape}"fleche_orange redText${symbol_escape}">VALIDER ET TRANSMETTRE</a>");
			}
			out.println("</div>");
		} // for
		if (count==0) out.println("Aucun" );
		%>
		</table>
		
		<% } // if listrep2.size >1 %>
		
	
	</td>
</tr>
<tr>
	<td><br><br><br></td>
	<td>&nbsp;</td>
</tr>