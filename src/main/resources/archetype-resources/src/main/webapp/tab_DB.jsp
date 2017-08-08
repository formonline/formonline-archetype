#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<% //  ************ db  *************************** %>


<tr>
	<td colspan="2" class="bigGreyText"><br>
	Bases / instances</td>
</tr>
<tr>
	<td colspan="2">&nbsp;</td>
</tr>
<tr>
	<td colspan="2">
	
	
	
        <a href='ServControl?action=QUEST&qid=12&s_id_parent=<%=rep1.getS_id()%>'>
        &gt; Créer une nouvelle base</a><br>
   
      <br> 
      
      <% if (listRep2.size()>=1) { %>
 liste bases :<br>
 
        <table style="width:100%" border="0" cellpadding="2">
<%
		int count=0;
		for (int i=0; i<listRep2.size(); i++) {
			SubmitForm sfi = (SubmitForm )listRep2.get(i);
			
			if (sfi.getF_id()!=12) continue;
			
			count++;
			out.println("<tr><td>");
			out.println("&gt; N° "+String.valueOf(sfi.getS_id())+": "+sfi.getTitre() );
			
			if (sfi.isLocked()) {
				out.println(" ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)+") "  );
				out.println(" <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RDET&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"'>Afficher</a>");

				out.println("</td><td nowrap valign=${symbol_escape}"middle${symbol_escape}" class=${symbol_escape}"greenText${symbol_escape}">");			
				out.println("(validé le "+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)+")");
					
			} else {
				out.println(" ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null) +")" );
				out.println(" <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RMAJ&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"'>Consulter/Modifier</a>");
				out.println(" <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RSUP&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=greyText>Supprimer</a>");

				out.println("</td><td nowrap valign=${symbol_escape}"middle${symbol_escape}">");			
				out.println(" <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=LOCK&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=${symbol_escape}"redText${symbol_escape}">VALIDER ET TRANSMETTRE</a>");
			}
			out.println("</td></tr>");
		} // for
		if (count==0) out.println("<tr><td>Aucun</td></tr>" );
		%>
		</table>
		
		<% } // if listrep2.size >1 %>
		
	
	</td>
</tr>
<tr>
	<td><br><br><br></td>
	<td>&nbsp;</td>
</tr>