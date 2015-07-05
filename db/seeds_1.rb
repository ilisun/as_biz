# encoding: utf-8


0.upto(1000) { |number|
    Client.create(category: number+548, type_structure: number, create_by: 1, update_by: 1 )
    p "Created #{number}"
    }

# 30.upto(5000) { |number|
#     ClientIndividual.create(client_id: number, last_name: 'Сергеев', first_name: 'Александр', middle_name: 'Игоревич')
#     }



