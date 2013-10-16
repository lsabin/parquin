package com.parquin

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class ParqueController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [parqueInstanceList: Parque.list(params), parqueInstanceTotal: Parque.count()]
    }

   def parquesJson() {
        def parques = parques(100) 
        render(parques as JSON)
    }

    private def parques(Integer max) {

        params.max = Math.min(max ?: 10, 100) 
        def lista = Parque.list(params)

        def listaCoords =  lista.collect { it ->
                [
                id: it.id,
                nombre: it.nombre,
                coords: [longitud:  it.longitud, latitud: it.latitud]
                ]
        }

        return listaCoords
       
    }

    def create() {
        [parqueInstance: new Parque(params)]
    }

    def save() {
        def parqueInstance = new Parque(params)
        if (!parqueInstance.save(flush: true)) {
            render(view: "create", model: [parqueInstance: parqueInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'parque.label', default: 'Parque'), parqueInstance.id])
        redirect(action: "show", id: parqueInstance.id)
    }

    def show(Long id) {
        def parqueInstance = Parque.get(id)
        if (!parqueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parque.label', default: 'Parque'), id])
            redirect(action: "list")
            return
        }

        [parqueInstance: parqueInstance]
    }

    def edit(Long id) {
        def parqueInstance = Parque.get(id)
        if (!parqueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parque.label', default: 'Parque'), id])
            redirect(action: "list")
            return
        }

        [parqueInstance: parqueInstance]
    }

    def update(Long id, Long version) {
        def parqueInstance = Parque.get(id)
        if (!parqueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parque.label', default: 'Parque'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (parqueInstance.version > version) {
                parqueInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'parque.label', default: 'Parque')] as Object[],
                          "Another user has updated this Parque while you were editing")
                render(view: "edit", model: [parqueInstance: parqueInstance])
                return
            }
        }

        parqueInstance.properties = params

        if (!parqueInstance.save(flush: true)) {
            render(view: "edit", model: [parqueInstance: parqueInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'parque.label', default: 'Parque'), parqueInstance.id])
        redirect(action: "show", id: parqueInstance.id)
    }

    def delete(Long id) {
        def parqueInstance = Parque.get(id)
        if (!parqueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parque.label', default: 'Parque'), id])
            redirect(action: "list")
            return
        }

        try {
            parqueInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'parque.label', default: 'Parque'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'parque.label', default: 'Parque'), id])
            redirect(action: "show", id: id)
        }
    }
}
