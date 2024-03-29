<%@ taglib uri="/tags/cit" prefix="cit"%>
<%@page import="br.com.centralit.citcorpore.util.WebUtil"%>
<%@page import="br.com.centralit.citcorpore.bean.UsuarioDTO"%>
<%@page import="br.com.citframework.dto.Usuario"%>
<%@ taglib uri="/tags/i18n" prefix="i18n"%>

<!doctype html public "✰">
<html>
<head>
<%
    response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", -1);
			String iframe = "";
			iframe = request.getParameter("iframe");
%>
<%@include file="/include/security/security.jsp"%>
<html lang="en-us" class="no-js">
<!--<![endif]-->
<title><i18n:message key="citcorpore.comum.title"/></title>
<%@include file="/include/noCache/noCache.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/javaScriptsComuns/javaScriptsComuns.jsp"%>
<script>
	var objTab = null;

	addEvent(window, "load", load, false);
	function load() {
		document.form.afterRestore = function() {
			$('.tabs').tabs('select', 0);
		}
	}

	function LOOKUP_JUSTIFICATIVAPARECER_select(id, desc) {
		document.form.restore({
			idJustificativa : id
		});
	}
	
	function excluir() {
		if (document.getElementById("idJustificativa").value != "") {
			if (confirm(i18n_message("citcorpore.comum.deleta"))) {
				document.form.fireEvent("delete");
			}
		}
	}

</script>
<%//se for chamado por iframe deixa apenas a parte de cadastro da p�gina
			if (iframe != null) {%>
<style>
div#main_container {
	margin: 10px 10px 10px 10px;
}
</style>
<%}%>
</head>
<body>
	<div id="wrapper">
		<%if (iframe == null) {%>
		<%@include file="/include/menu_vertical.jsp"%>
		<%}%>
		<div id="main_container" class="main_container container_16 clearfix">
		<%if (iframe == null) {%>
			<%@include file="/include/menu_horizontal.jsp"%>
			<%}%>

			<div class="flat_area grid_16">
				<h2>
					<i18n:message key="justificativaParecer.justificativaParecer" />
				</h2>
			</div>
			<div class="box grid_16 tabs">
				<ul class="tab_header clearfix">
					<li><a href="#tabs-1"><i18n:message key="justificativaParecer.justificativaParecer" />
					</a></li>
					<li><a href="#tabs-2" class="round_top"><i18n:message key="justificativaParecer.pesquisaJustificativaParecer" />
					</a></li>
				</ul>
				<a href="#" class="toggle">&nbsp;</a>
				<div class="toggle_container">
					<div id="tabs-1" class="block">
						<div class="section">
							<form name='form'
								action='<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/pages/justificativaParecer/justificativaParecer'>
								<input type='hidden' name='idJustificativa' id="idJustificativa" /> 
								<div class="columns clearfix">
									<div class="col_40">
										<fieldset style="height: 70px;">
											<label class="campoObrigatorio"><i18n:message key="citcorpore.comum.descricao" /></label>
											<div>
											<input type="text" maxlength="100" id="descricaoJustificativa" name="descricaoJustificativa" class="Valid[Required] Description[citcorpore.comum.descricao]" />
											</div>
										</fieldset>
									</div>
                                    <div class="col_20" >
                                        <fieldset style="height: 70px;">
                                             <div style="padding:20px">
                                                <label style='cursor:pointer'><input type='checkbox' value='S' name='aplicavelRequisicao'/><b><i18n:message key="justificativaParecer.aplicavelRequisicao"/></b></label>
                                             </div>
                                        </fieldset>
                                    </div>
                                    <div class="col_20" >
                                        <fieldset style="height: 70px;">
                                             <div style="padding:20px">
                                                <label style='cursor:pointer'><input type='checkbox' value='S' name='aplicavelCotacao'/><b><i18n:message key="justificativaParecer.aplicavelCotacao"/></b></label>
                                             </div>
                                        </fieldset>
                                    </div>
                                    <div class="col_20" >
                                        <fieldset style="height: 70px;">
                                             <div style="padding:20px">
                                                <label style='cursor:pointer'><input type='checkbox' value='S' name='aplicavelInspecao'/><b><i18n:message key="justificativaParecer.aplicavelInspecao"/></b></label>
                                             </div>
                                        </fieldset>
                                    </div>
                                    <div class="col_100">
                                        <fieldset>
                                            <label class="campoObrigatorio"><i18n:message key="citcorpore.comum.situacao" /></label>
                                            <div  class="inline clearfix">
                                            <label><i18n:message key="citcorpore.comum.ativo" /><input type="radio"  name="situacao" value="A" checked="checked" /></label>
                                            <label><i18n:message key="citcorpore.comum.inativo" /><input type="radio"  name="situacao" value="I" /></label>
                                            </div>
                                        </fieldset>
                                    </div>
								</div>
								<br>
								<br>
								<button type='button' name='btnGravar' class="light"
									onclick='document.form.save();'>
									<img
										src="<%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/template_new/images/icons/small/grey/pencil.png">
									<span><i18n:message key="citcorpore.comum.gravar" />
									</span>
								</button>
								<button type='button' name='btnLimpar' class="light"
									onclick='document.form.clear();'>
									<img
										src="<%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/template_new/images/icons/small/grey/clear.png">
									<span><i18n:message key="citcorpore.comum.limpar" />
									</span>
								</button>
								<button type='button' name='btnExcluir' id="btnExcluir"
									class="light" onclick='excluir();'>
									<img
										src="<%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/template_new/images/icons/small/grey/trashcan.png">
									<span><i18n:message key="citcorpore.comum.excluir" />
									</span>
								</button>
							</form>
						</div>
					</div>
					<div id="tabs-2" class="block">
						<div class="section">
							<i18n:message key="citcorpore.comum.pesquisa" />
							<form name='formPesquisa'>
								<cit:findField formName='formPesquisa'lockupName='LOOKUP_JUSTIFICATIVAPARECER' id='LOOKUP_JUSTIFICATIVAPARECER' top='0'left='0' len='550' heigth='400' javascriptCode='true' htmlCode='true' />
							</form>
						</div>
					</div>
					<!-- ## FIM - AREA DA APLICACAO ## -->
				</div>
			</div>
		</div>
		<!-- Fim da Pagina de Conteudo -->
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>
