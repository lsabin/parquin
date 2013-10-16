
<%@ page import="com.parquin.Parque" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parque.label', default: 'Parque')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parque" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parque">
			
				<g:if test="${parqueInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="parque.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${parqueInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parqueInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="parque.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:fieldValue bean="${parqueInstance}" field="categoria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parqueInstance?.concello}">
				<li class="fieldcontain">
					<span id="concello-label" class="property-label"><g:message code="parque.concello.label" default="Concello" /></span>
					
						<span class="property-value" aria-labelledby="concello-label"><g:fieldValue bean="${parqueInstance}" field="concello"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parqueInstance?.latitud}">
				<li class="fieldcontain">
					<span id="latitud-label" class="property-label"><g:message code="parque.latitud.label" default="Latitud" /></span>
					
						<span class="property-value" aria-labelledby="latitud-label"><g:fieldValue bean="${parqueInstance}" field="latitud"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parqueInstance?.longitud}">
				<li class="fieldcontain">
					<span id="longitud-label" class="property-label"><g:message code="parque.longitud.label" default="Longitud" /></span>
					
						<span class="property-value" aria-labelledby="longitud-label"><g:fieldValue bean="${parqueInstance}" field="longitud"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parqueInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="parque.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${parqueInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${parqueInstance?.id}" />
					<g:link class="edit" action="edit" id="${parqueInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
