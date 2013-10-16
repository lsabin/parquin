
<%@ page import="com.parquin.Parque" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parque.label', default: 'Parque')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-parque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="map-canvas" style="height:400px;width:600px;"></div>
		<div id="list-parque" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="calle" title="${message(code: 'parque.calle.label', default: 'Calle')}" />
					
						<g:sortableColumn property="categoria" title="${message(code: 'parque.categoria.label', default: 'Categoria')}" />
					
						<g:sortableColumn property="concello" title="${message(code: 'parque.concello.label', default: 'Concello')}" />
					
						<g:sortableColumn property="latitud" title="${message(code: 'parque.latitud.label', default: 'Latitud')}" />
					
						<g:sortableColumn property="longitud" title="${message(code: 'parque.longitud.label', default: 'Longitud')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'parque.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${parqueInstanceList}" status="i" var="parqueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${parqueInstance.id}">${fieldValue(bean: parqueInstance, field: "calle")}</g:link></td>
					
						<td>${fieldValue(bean: parqueInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: parqueInstance, field: "concello")}</td>
					
						<td>${fieldValue(bean: parqueInstance, field: "latitud")}</td>
					
						<td>${fieldValue(bean: parqueInstance, field: "longitud")}</td>
					
						<td>${fieldValue(bean: parqueInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${parqueInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
