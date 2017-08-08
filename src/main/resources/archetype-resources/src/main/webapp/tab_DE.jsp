#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<% //  ************ FORMATIONS  *************************** %>

<script>
/* Comportements jQUERY accord�on */
	${symbol_dollar}(document).ready(function() {
		${symbol_dollar}('.accordion2').addClass('ui-accordion').addClass('ui-widget').addClass('ui-helper-reset').addClass('ui-accordion-icons');
		${symbol_dollar}('.accordion2 .head').addClass('ui-accordion-header').addClass('ui-helper-reset').addClass('ui-state-default').addClass('ui-corner-top');
		${symbol_dollar}('.accordion2 .head').next().addClass('ui-accordion-content').addClass('ui-helper-reset').addClass('ui-widget-content').addClass('ui-corner-bottom').addClass('ui-accordion-content-active');

		${symbol_dollar}('.accordion2 .head')
		.hover(
				function () {${symbol_dollar}(this).addClass('ui-state-hover');},
				function () {${symbol_dollar}(this).removeClass('ui-state-hover');  }
		)
		.click(function() {
			${symbol_dollar}(this).find('span').toggleClass('ui-icon-triangle-1-s').toggleClass('ui-icon-triangle-1-e');
			${symbol_dollar}(this).next().slideToggle('normal');
			${symbol_dollar}(this).toggleClass('ui-state-active');
			return false;
		}).next().hide();
		
	    //${symbol_dollar}( '.accordion2' ).sortable({ axis: "y", handle: "h3"  });

		//ouverture du premier
		//${symbol_dollar}('.accordion2 .head:first-child').click();
	});
</script>

<tr>
	<td colspan="2" class="bigGreyText"><br>
	Demandes d'évolution</td>
</tr>
<tr>
	<td colspan="2">&nbsp;</td>
</tr>
<tr>
	<td colspan="2">
	
	
	
				
<!-- ******************* AFFICHAGE DEMANDES (TODO) ******************* -->
   
    
 
        <a href='ServControl?action=QUEST&qid=10&s_id_parent=<%=rep1.getS_id()%>' class=orangeButton>
        &gt; Créer un nouvelle demande d'évolution</a>
        
        &nbsp; &nbsp; &nbsp; 
   
      
      <a href='ServControl?action=EXPO&sid=0&selectExport=HTML&templateId=25&fid=10&direct' class=sheet  target=_blank>
      Récapitulatif demandes EN ATTENTE</a><br>
      <br>
      
      <% if (listRep2.size()>=1) { %> 
 Liste de mes demandes 
 <a href='ServControl?action=EXPO&sid=<%=rep1.getS_id()%>&selectExport=HTML&templateId=27&fid=10&direct' class=sheet target=_blank>A TRAITER</a>  : <br>
 
 
 <div class="accordion2 ">
 
      
<%
		int count=0;
		for (int i=0; i<listRep2.size(); i++) {
			SubmitForm sfi = (SubmitForm )listRep2.get(i);
			
			if (sfi.getF_id()!=10 || !"1".equals(sfi.getPropVal(92)) || sfi.getS_id_parent()!= rep1.getS_id() ) continue;

			count++;

			out.println("<h3 class=${symbol_escape}"head${symbol_escape}"><span class=${symbol_escape}"ui-icon ui-icon-triangle-1-e${symbol_escape}"></span>"
			        +"<a href=${symbol_escape}"${symbol_pound}section_biac_"+count+"${symbol_escape}">"   
			        +"<span class=greyText>"+String.valueOf(sfi.getS_id())+"</span> "
					+ sfi.getTitre()
			        +"</a></h3>");
			out.println("<div class=${symbol_escape}"text${symbol_escape}" style=${symbol_escape}"padding:15px;${symbol_escape}">");
		
			
			out.println(formOnLine.BasicTools.htmlConvert( sfi.getPropVal(95)));
			
			
			
			if (sfi.isLocked()) {
				out.println(" ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null) );
				out.println(") &gt;  <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RDET&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=btlink>Afficher</a>");

				out.println("<span> class=${symbol_escape}"greenText${symbol_escape}">");			
				out.println("(validé le "+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)+") </span>");
					
			} else {
				
				out.println("<br><span class=greyText> ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)  );
				out.println(")</span> <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RDET&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"'  class=orangeButton style='float:right'>Consulter</a> &nbsp; ");
				
				out.println(" <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RMAJ&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=orangeButton style='float:right'>Modifier</a>");
				
				out.println(" &nbsp; <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=LOCK&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=orangeButton style='float:right'>Valider</a> &nbsp; ");
				
			}

			
			out.println("</div>");
		} // for
		

		if (count==0) out.println("Aucune" );
		        
		        %>
		        
		        </div>
		        <br>
		        <br><br>
		Liste des demandes A TESTER  :<br>
		 
		 <div class="accordion2 ">
		 
		      
		<%
				count=0;
				for (int i=0; i<listRep2.size(); i++) {
					SubmitForm sfi = (SubmitForm )listRep2.get(i);
					
					if (sfi.getF_id()!=10 || !"1".equals(sfi.getPropVal(193)) || sfi.getS_id_parent()!= rep1.getS_id() ) continue;

					count++;

					out.println("<h3 class=${symbol_escape}"head${symbol_escape}"><span class=${symbol_escape}"ui-icon ui-icon-triangle-1-e${symbol_escape}"></span>"
					        +"<a href=${symbol_escape}"${symbol_pound}section_biac_"+count+"${symbol_escape}">"   
					        + sfi.getTitre()+"</a></h3>");
					out.println("<div class=${symbol_escape}"text${symbol_escape}" style=${symbol_escape}"padding:15px;${symbol_escape}">");
				
					out.println(formOnLine.BasicTools.htmlConvert( sfi.getPropVal(95)));
					
					
					
					if (sfi.isLocked()) {
						out.println(" ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null) );
						out.println(") &gt;  <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RDET&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=btlink>Afficher</a>");

						out.println("<span> class=${symbol_escape}"greenText${symbol_escape}">");			
						out.println("(validé le "+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)+") </span>");
							
					} else {
						
						out.println("<br><span class=greyText> ("+BasicType.formatDateIsoToLocal(sfi.getS_date(),null)  );
						out.println(")</span> <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RDET&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"'  class=orangeButton style='float:right'>Consulter</a> &nbsp; ");
						
						out.println(" <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=RMAJ&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=orangeButton style='float:right'>Modifier</a>");
						
						out.println(" &nbsp; <a href='"+response.encodeURL(request.getContextPath()+"/ServControl?action=LOCK&sid="+sfi.getS_id()+"&qid="+String.valueOf(sfi.getF_id()))+"' class=orangeButton style='float:right'>Valider</a> &nbsp; ");
						
					}
					
					out.println("</div>");
				} // for
				

				if (count==0) out.println("Aucune" );
				

		%>
		



		
		<% } // if listrep2.size >1 %>
	
	

	</td>
</tr>
<tr>
	<td><br><br><br></td>
	<td>&nbsp;</td>
</tr>