from random import randint

import factory

from catalogo.model import Person


class FactoryPerson(factory.alchemy.SQLAlchemyModelFactory):
    class Meta:  # type: ignore
        model = Person
        exclude = ('id',)

    id = factory.Faker('uuid4')
    nick = factory.Faker('user_name')
    name = factory.Faker('name')
    birthday = factory.Faker('date')
    stack = factory.Faker('words', nb=randint(0, 10))
