#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<% //  ************ FORMATIONS  *************************** %>

<script>
/* Comportements jQUERY accordéon */
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

		//ouverture du premier
		//${symbol_dollar}('.accordion2 .head:first-child').click();
	});
</script>

<tr>
	<td colspan="2" class="bigGreyText"><br>
	Liste évènements</td>
</tr>
<tr>
	<td colspan="2">&nbsp;</td>
</tr>
<tr>
	<td colspan="2">
	
	   <a href='ServControl?action=QUEST&qid=11&s_id_parent=<%=rep1.getS_id()%>'>
        &gt; Créer un nouvel évènement</a><br>
   
	<br>
	<div class="accordion2 ">
		<%
		
		// **** Affichage liste ev
		int count=0; 
		String today = com.triangle.lightfw.BasicType.getTodaysDateIso();
		
		for (int i=0; i<listRep2.size(); i++) {
			SubmitForm sfi = (SubmitForm )listRep2.get(i);
			
			if ( sfi.getF_id()!=11 ) continue;
			
			String datEv = "";
			try {
			    datEv = com.triangle.lightfw.BasicType.parseDateIsoFromLocal(sfi.getPropVal(110), null);
			}catch (Exception e) {}
			
			// session déjà passée
			if (datEv==null || com.triangle.lightfw.BasicType.compareDateIso(today,datEv)>0) continue;
			
			
			count++;
			out.println("<h3 class=${symbol_escape}"head${symbol_escape}"><span class=${symbol_escape}"ui-icon ui-icon-triangle-1-e${symbol_escape}"></span>"
			        +"<a href=${symbol_escape}"${symbol_pound}section_biac_"+count+"${symbol_escape}">" + sfi.getPropVal(110) +" : " 
			        + sfi.getTitre()+"</a></h3>");
			out.println("<div class=${symbol_escape}"text${symbol_escape}" style=${symbol_escape}"padding:15px;${symbol_escape}">");
		
			out.println(sfi.getPropVal(112));
		    		out.println("</div>");
			
		}
%>
	
	</td>
</tr>
<tr>
	<td><br><br><br></td>
	<td>&nbsp;</td>
</tr>