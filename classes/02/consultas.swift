import Foundation

class Medico {
    var nome: String
    var morada: String
    var especialidade: String
    var contacto: Int
    
    init(nome: String, morada: String, especialidade: String, contacto: Int) {
        self.nome = nome
        self.morada = morada
        self.especialidade = especialidade
        self.contacto = contacto
    }
    
}

class Utente {
    var nome: String
    var morada: String
    var numeroUtente: Int
    var dataNascimento: Date
    
    init(nome: String, morada: String, numeroUtente: Int, dataNascimento: Date) {
        self.nome = nome
        self.morada = morada
        self.numeroUtente = numeroUtente
        self.dataNascimento = dataNascimento
    }
}

class Consulta {
    var data: Date
    var medico: Medico
    var utente: Utente
    var relatorio: String
    
    init(data: Date, medico: Medico, utente: Utente, relatorio: String) {
        self.data = data
        self.medico = medico
        self.utente = utente
        self.relatorio = relatorio
    }
}

class Programa {
    var medicos: [Medico] = []
    var utentes: [Utente] = []
    var consultas: [Consulta] = []
    var dateFormatter = DateFormatter()
    
    init(){
        dateFormatter.dateFormat = "dd-MM-yyyy"
    }
    
    func iniciar(){
        var option = ""
        repeat {
            print("Menu")
            print("1 - criar medico")
            print("2 - criar utente")
            print("3 - agendar consultas")
            print("4 - listar consultas")
            print("0 - sair")
            print("---")
            print("Digite a opção: ")
            option = readLine() ?? "0"
            
            switch option {
            case "1":
                criaMedico()
            case "2":
                criaUtente()
            case "3":
                agendarConsulta()
            case "4":
                listarConsultas()
            default:
                break
            }
        }while option != "0"
    }
    
    func criaUtente(){
        print("Digite o nome")
        let nome = readLine(strippingNewline: true)
        print("Digite a morada")
        let morada = readLine(strippingNewline: true)
        print("Digite o número de utente")
        let numeroUtente = readLine(strippingNewline: true)
        print("Digite a data de nascimento")
        let dataNascimento = readLine(strippingNewline: true)
        
        let novoUtente = Utente(nome: nome!, morada: morada!, numeroUtente: Int(numeroUtente!) ?? 0, dataNascimento: dateFormatter.date(from: dataNascimento!)!)
        utentes.append(novoUtente)
        
    }
    
    func criaMedico(){
        print("Digite o nome")
        let nome = readLine(strippingNewline: true)
        print("Digite a morada")
        let morada = readLine(strippingNewline: true)
        print("Digite a especialidade")
        let especialidade = readLine(strippingNewline: true)
        print("Digite o contacto")
        let contacto = readLine(strippingNewline: true)
        
        let novoMedico = Medico(nome: nome!, morada: morada!, especialidade: especialidade!, contacto: Int(contacto!) ?? 0)
        medicos.append(novoMedico)
        
    }
    
    func agendarConsulta(){
        print("Digite o nome do médico")
        let nomeMedico = readLine(strippingNewline: true)
        let medico = medicos.first(where: {(m: Medico) -> Bool in
            return m.nome == nomeMedico })
        
        
        if medico == nil {
            print("médico não encontrado")
            return
        }
        
        print("Digite o número do utente")
        let numeroUtente = readLine(strippingNewline: true)
        let utente = utentes.first(where: {(u: Utente) -> Bool in
            return u.numeroUtente == Int(numeroUtente!) ?? 0 })
        
        if utente == nil {
            print("médico não encontrado")
            return
        }
        
        print("Digite a data da consulta")
        let dataAgendamentoStr = readLine(strippingNewline: true)
        let dataAgendamento = dateFormatter.date(from: dataAgendamentoStr!)
        
        let novaConsulta = Consulta(data: dataAgendamento!, medico: medico!, utente: utente!, relatorio: "")
        consultas.append(novaConsulta)
    }
    
    func listarConsultas(){
        print("Consultas agendadas")
        print("---")
        consultas.forEach({
            (c: Consulta) -> Void in
            print("---")
            print("nome médico:", c.medico.nome)
            print("nome utente:", c.utente.nome)
            print("data:", c.data)
            print("---")
        })
    }
}


Programa().iniciar()
