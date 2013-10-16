<%@ page import="com.parquin.Parque" %>



<div class="fieldcontain ${hasErrors(bean: parqueInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="parque.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${parqueInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parqueInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="parque.categoria.label" default="Categoria" />
		
	</label>
	<g:textField name="categoria" value="${parqueInstance?.categoria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parqueInstance, field: 'concello', 'error')} ">
	<label for="concello">
		<g:message code="parque.concello.label" default="Concello" />
		
	</label>
	<g:textField name="concello" value="${parqueInstance?.concello}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parqueInstance, field: 'latitud', 'error')} required">
	<label for="latitud">
		<g:message code="parque.latitud.label" default="Latitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitud" value="${fieldValue(bean: parqueInstance, field: 'latitud')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: parqueInstance, field: 'longitud', 'error')} required">
	<label for="longitud">
		<g:message code="parque.longitud.label" default="Longitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitud" value="${fieldValue(bean: parqueInstance, field: 'longitud')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: parqueInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="parque.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${parqueInstance?.nombre}"/>
</div>

