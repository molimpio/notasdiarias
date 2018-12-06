//
//  AnotacaoViewController.swift
//  notasdiarias
//
//  Created by Moises Olimpio on 03/12/18.
//  Copyright © 2018 Moises Olimpio. All rights reserved.
//

import UIKit
import CoreData

class AnotacaoViewController: UIViewController {
    
    
    @IBOutlet weak var texto: UITextView!
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuracoes iniciais
        self.texto.becomeFirstResponder()
        self.texto.text = ""
        
        // criando as referencias para acessar bd
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext

    }
    
    @IBAction func salvar(_ sender: Any) {
        self.salvarAnotacao()
        
        // retorna para tela principal
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func salvarAnotacao() {
        // cria obj para anotacao
        let novaAnotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: context)
        
        // seta os valores
        novaAnotacao.setValue(self.texto.text, forKey: "texto")
        novaAnotacao.setValue(Date(), forKey: "data")
        
        // salva anotacao
        do {
            try context.save()
            print("Sucesso ao salvar anotacao!")
        } catch let erro as Error {
            print("Erro ao salvar anotacao: " + erro.localizedDescription)
        }
        
    }

}
