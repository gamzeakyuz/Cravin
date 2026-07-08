//
//  DusunSeliVC.swift
//  ZihninOkyanusu
//
//  Created by Gamze Akyüz on 6.04.2023.
//

import UIKit

class DusunSeliVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
        DataModel.shared.loadData()
        
        touchScreen()
        
    }
    private func touchScreen () {
        let touch = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(touch)
    }
    @IBAction func button(_ sender: Any) {
        guard let note = textField.text, textField.text != nil, textField.text != "" else {return}
        DataModel.shared.save(note)
        tableView.reloadData()
        view.endEditing(true)
    }
    @objc private func addNoteButtonClick(_ sender: UITapGestureRecognizer) {
        addNote()
    }
    
    private func addNote() {
        guard let note = textField.text, textField.text != nil, textField.text != "" else {return}
        DataModel.shared.save(note)
        tableView.reloadData()
        view.endEditing(true)
    }
    
    func alert (tableView: UITableView, indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Uyarı", message: "Notu Silmek İstediğinize Emin Misiniz?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel))
        alert.addAction(UIAlertAction(title: "Evet", style: .destructive) {_ in
            DataModel.shared.delete(indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
            self.tableView.reloadData()
        })
        self.present(alert, animated: true)
    }


}
extension DusunSeliVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.shared.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let notes = DataModel.shared.notes[indexPath.row]
        cell?.textLabel?.text = String(describing: indexPath.row + 1) + " " + ((notes.value(forKey: "note") as? String) ?? " ")
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.minimumScaleFactor = 20
        cell?.textLabel?.font = UIFont(name: "STIX Two Text", size: 15)
        return cell ?? UITableViewCell()
    }
}

extension DusunSeliVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trashNote = UIContextualAction(style: .destructive, title: nil) { _, _, boolAction in
            self.alert(tableView: tableView, indexPath: indexPath)
            boolAction(true)
        }
        trashNote.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [trashNote])
    }
}
extension DusunSeliVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNote()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

