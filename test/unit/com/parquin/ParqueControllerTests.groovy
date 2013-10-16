package com.parquin



import org.junit.*
import grails.test.mixin.*

@TestFor(ParqueController)
@Mock(Parque)
class ParqueControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parque/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parqueInstanceList.size() == 0
        assert model.parqueInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parqueInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parqueInstance != null
        assert view == '/parque/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parque/show/1'
        assert controller.flash.message != null
        assert Parque.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parque/list'

        populateValidParams(params)
        def parque = new Parque(params)

        assert parque.save() != null

        params.id = parque.id

        def model = controller.show()

        assert model.parqueInstance == parque
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parque/list'

        populateValidParams(params)
        def parque = new Parque(params)

        assert parque.save() != null

        params.id = parque.id

        def model = controller.edit()

        assert model.parqueInstance == parque
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parque/list'

        response.reset()

        populateValidParams(params)
        def parque = new Parque(params)

        assert parque.save() != null

        // test invalid parameters in update
        params.id = parque.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parque/edit"
        assert model.parqueInstance != null

        parque.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parque/show/$parque.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parque.clearErrors()

        populateValidParams(params)
        params.id = parque.id
        params.version = -1
        controller.update()

        assert view == "/parque/edit"
        assert model.parqueInstance != null
        assert model.parqueInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parque/list'

        response.reset()

        populateValidParams(params)
        def parque = new Parque(params)

        assert parque.save() != null
        assert Parque.count() == 1

        params.id = parque.id

        controller.delete()

        assert Parque.count() == 0
        assert Parque.get(parque.id) == null
        assert response.redirectedUrl == '/parque/list'
    }
}
