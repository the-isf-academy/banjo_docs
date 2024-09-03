Views
----------------


Each view is a function which receives a dictonary, called ``args``,
and must return a dictionary. 

Use the ``banjo.urls.route_get`` and ``banjo.urls.route_post``
decorators to route URLs to your view functions.

Be sure to import the route decorators and model::

        # app/views.py
        from banjo.urls import route_get, route_post
        from .models import Person


**All view functions must:**

- include ``args`` as a funciton parameter, regardless if the endpoint requires a payload
- return a dictionary to ensure propert ``JSON`` formatting

----

.. py:function:: @route_get(endpoint,args)

    Creates a GET API at the specified endpoint

    :endpoint: must include a string to denote the endpoint
    :args (optional): can include a payload in the format of a dictionary 
        - the ``key`` must be a string and the ``value`` must be the expected ``data type``

    *example*::

        # app/views.py
        from banjo.urls import route_get, route_post
        from .models import Person

        @route_get('all')
        
    *example* ``GET`` *function with no* ``args``::

        @route_get('all')
        def all_persons(args):
            if Person.objects.exists():
                all_persons = []

                for person in Person.objects.all():
                    all_persons.append(person.json_response())

                return {'all persons': all_persons}

            else:
                return {'error': 'no persons exisit'}

    *example* ``GET`` *function with* ``args``::

        @route_get('one', args={'id': int})
        def one_person(args):
            if Person.objects.filter(id=args['id']).exists():
                one_person = Person.objects.get(id=args['id'])

                return {'person': one_person.json_response()}

            else:
                return {'error': 'no person exists'}

.. py:function:: @route_post(endpoint,args)

    Creates a POST API at the specified endpoint

    :endpoint: must include a string to denote the endpoint
    :args (optional): can include a payload in the format of a dictionary 
        - the ``key`` must be a string and the ``value`` must be the expected ``data type``

    *example*:: 

        # app/views.py
        from banjo.urls import route_get, route_post
        from models import Person

        @route_post('add_person', args={'name': str, 'email_address': str})


    *example* ``POST`` *function with* ``args``::

        @route_post('add_person', args={'name': str, 'email_address': str})
        def add_person(args):
            new_person = Person.from_dict(args)
            new_person.save()

            return new_person.json_response()

----



