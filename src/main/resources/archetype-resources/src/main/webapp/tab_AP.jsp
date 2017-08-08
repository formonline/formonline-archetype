#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<% //  ************ applis  *************************** %>


<tr>
	<td colspan="2" class="bigGreyText"><br>
	Applications</td>
</tr>
<tr>
	<td colspan="2">&nbsp;</td>
</tr>
<tr>
	<td colspan="2">
	
	
	
        <a href='ServControl?action=QUEST&qid=5&s_id_parent=<%=rep1.getS_id()%>'>
        &gt; Créer une nouvelle application / projet</a><br>
   
      <br>
      
      <% if (listRep2.size()>=1) { 
 
		int count=0;
		for (int i=0; i<listRep2.size(); i++) {
			SubmitForm sfi = (SubmitForm )listRep2.get(i);
			
			if (sfi.getF_id()!=5) continue;
			
			count++;
			
			
			out.println("<span class=puce_rouge>"+sfi.getTitre()+"</span>");
			out.println("<div class=${symbol_escape}"text greyBox${symbol_escape}" style=${symbol_escape}"margin-left:20px;${symbol_escape}">");
			if (sfi.isLocked()) {
				//out.println(" ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)+") "  );
				out.println(" <a href='ServControl?action=RDET&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"' class=${symbol_escape}"fleche_orange${symbol_escape}">Consulter</a>");

				//out.println("<span class=${symbol_escape}"greenText${symbol_escape}">(validé le "+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)+")</span>");
				out.println(" <a href='ServControl?action=EXPO&sid=194&selectExport=HTML&templateId=3&fid=5&direct' class=${symbol_escape}"fleche_orange${symbol_escape}" target=_blank>Fiche application</a> ");
				out.println(" <a href='ServControl?action=EXPO&sid=194&selectExport=HTML&templateId=22&fid=5&direct' class=${symbol_escape}"fleche_orange${symbol_escape}" target=_blank>Dex applicatif</a> ");
				
				
			} else {
				//out.println(" ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null) +")" );
				out.println(" <a href='ServControl?action=RMAJ&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"' class=${symbol_escape}"fleche_orange${symbol_escape}">Consulter/Modifier</a>");
				out.println(" <a href='ServControl?action=RSUP&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"' class=${symbol_escape}"fleche_orange greyText${symbol_escape}">Supprimer</a>");

				
				out.println(" <a href='ServControl?action=LOCK&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id())+"' class=${symbol_escape}"fleche_orange redText${symbol_escape}">VALIDER ET TRANSMETTRE</a>");
			}
			
						
			out.println("</div>");
		} // for
		if (count==0) out.println("Aucun" );
		%>
		
		
		<% } // if listrep2.size >=1 %>
		
	
	</td>
</tr>
<tr>
	<td><br><br><br></td>
	<td>&nbsp;</td>
</tr>