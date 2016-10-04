# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

operators = Operator.create([{ name: 'Default' }, { name: 'Claro' },{ name: 'CTBC' }, { name: 'Nextel' }, { name: 'Oi' }, { name: 'Tim' }, { name: 'Vivo' }])
cities = City.create([name:'Belo Horizonte'])
countries = Country.create([{ name: 'Brasil' }])
states = State.create([{ name: 'AC' },{ name: 'AL' },{ name: 'AP' },{ name: 'AM' },{ name: 'BA' },{ name: 'CE' },{ name: 'DF' },{ name: 'ES' },
                       { name: 'GO' },{ name: 'MA' },{ name: 'MT' },{ name: 'MS' },{ name: 'MG' },{ name: 'PA' },{ name: 'PB' },{ name: 'PR' },
                       { name: 'PI' },{ name: 'RJ' },{ name: 'RN' },{ name: 'RS' },{ name: 'RO' },{ name: 'RR' },{ name: 'SC' },{ name: 'SP' },
                       { name: 'SE' },{ name: 'TO' }])
professions = Profession.create([{ name_m: 'Pintor', name_f: 'Pintora'}, {name_m: 'Pedreiro', name_f: 'Pedreira'}])
account_kind = AccountKind.create([{name: 'Free'},{name: 'Basic'},{name: 'Premium'}])
resource = Resource.create([{name: 'Click', parameterType: 'INT'}, {name: 'Certify', parameterType: 'BOOL'},
                            {name: 'AdNumber', parameterType: 'INT'},{name: 'AdPriority', parameterType: 'INT'}])
account_resources = AccountResource.create([{account_kind_id: 1, resource_id: 1, value: '300'},
                                            {account_kind_id: 2, resource_id: 1, value: '0'},
                                            {account_kind_id: 3, resource_id: 1, value: '0'},
                                            {account_kind_id: 3, resource_id: 2, value: 'NULL'},
                                            {account_kind_id: 1, resource_id: 3, value: '1'},
                                            {account_kind_id: 2, resource_id: 3, value: '2'},
                                            {account_kind_id: 3, resource_id: 3, value: '2'},
                                            {account_kind_id: 1, resource_id: 4, value: '0'},
                                            {account_kind_id: 2, resource_id: 4, value: '0'},
                                            {account_kind_id: 3, resource_id: 4, value: '1000'}])