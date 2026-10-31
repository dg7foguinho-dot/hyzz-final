import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let logLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.0)
        
        setupUI()
    }
    
    func setupUI() {
        // Scroll View Principal
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(scrollView)
        
        contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 800)
        scrollView.addSubview(contentView)
        
        var yPos: CGFloat = 40
        
        // 1. System Log (Topo)
        let logView = UIView(frame: CGRect(x: 16, y: yPos, width: view.bounds.width - 32, height: 80))
        logView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        logView.layer.cornerRadius = 8
        logView.layer.borderWidth = 1
        logView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).cgColor
        contentView.addSubview(logView)
        
        let logTitle = UILabel(frame: CGRect(x: 12, y: 10, width: 200, height: 16))
        logTitle.text = "EXTERNAL CHEATS // SYSTEM LOG"
        logTitle.textColor = .white
        logTitle.font = UIFont.monospacedSystemFont(ofSize: 10, weight: .bold)
        logView.addSubview(logTitle)
        
        logLabel.frame = CGRect(x: 12, y: 30, width: logView.bounds.width - 24, height: 40)
        logLabel.text = "Catálogo carregado • Selecione um recurso"
        logLabel.textColor = .lightGray
        logLabel.font = UIFont.systemFont(ofSize: 12)
        logLabel.numberOfLines = 2
        logView.addSubview(logLabel)
        
        yPos += 100
        
        // 2. Abas (Avatar, Cache, External)
        let tabsStack = UIStackView(frame: CGRect(x: 16, y: yPos, width: view.bounds.width - 32, height: 60))
        tabsStack.axis = .horizontal
        tabsStack.distribution = .fillEqually
        tabsStack.spacing = 10
        contentView.addSubview(tabsStack)
        
        tabsStack.addArrangedSubview(createTab(title: "AVATAR", subtitle: "4 funções", isSelected: true))
        tabsStack.addArrangedSubview(createTab(title: "CACHE", subtitle: "6 funções", isSelected: false))
        tabsStack.addArrangedSubview(createTab(title: "EXTERNAL", subtitle: "0 funções", isSelected: false))
        
        yPos += 80
        
        // 3. Título da Seção
        let sectionTitle = UILabel(frame: CGRect(x: 16, y: yPos, width: 200, height: 20))
        sectionTitle.text = "AVATAR"
        sectionTitle.textColor = .white
        sectionTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        contentView.addSubview(sectionTitle)
        
        let sectionCount = UILabel(frame: CGRect(x: view.bounds.width - 60, y: yPos, width: 44, height: 20))
        sectionCount.text = "4 ITENS"
        sectionCount.textColor = .gray
        sectionCount.textAlignment = .right
        sectionCount.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        contentView.addSubview(sectionCount)
        
        yPos += 30
        
        // 4. Botões de Toggle (HS Alto, Peito, etc)
        contentView.addSubview(createToggleRow(title: "HS ALTO AVATAR", subtitle: "AVATAR • referência: alto", y: yPos)); yPos += 70
        contentView.addSubview(createToggleRow(title: "HS PEITO AVATAR", subtitle: "AVATAR • referência: peito", y: yPos)); yPos += 70
        contentView.addSubview(createToggleRow(title: "HS ALTO + ANTENA", subtitle: "AVATAR • referência: alto + antena", y: yPos)); yPos += 70
        contentView.addSubview(createToggleRow(title: "HS ALTO + PESCOÇO", subtitle: "AVATAR • referência: pescoço + alto", y: yPos)); yPos += 70
        
        // 5. Barra Inferior Falsa
        let bottomBar = UIView(frame: CGRect(x: 16, y: view.bounds.height - 100, width: view.bounds.width - 32, height: 70))
        bottomBar.backgroundColor = UIColor(white: 0.1, alpha: 0.95)
        bottomBar.layer.cornerRadius = 20
        view.addSubview(bottomBar)
        
        let injectIcon = UIImageView(frame: CGRect(x: bottomBar.bounds.midX - 15, y: 10, width: 30, height: 30))
        injectIcon.image = UIImage(systemName: "syringe")
        injectIcon.tintColor = .red
        bottomBar.addSubview(injectIcon)
        
        let injectLabel = UILabel(frame: CGRect(x: 0, y: 45, width: bottomBar.bounds.width, height: 15))
        injectLabel.text = "Injetor"
        injectLabel.textColor = .white
        injectLabel.textAlignment = .center
        injectLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        bottomBar.addSubview(injectLabel)
        
        contentView.frame.size.height = yPos + 100
        scrollView.contentSize = contentView.frame.size
    }
    
    // Funções auxiliares de UI
    func createTab(title: String, subtitle: String, isSelected: Bool) -> UIView {
        let view = UIView()
        view.backgroundColor = isSelected ? UIColor(white: 0.15, alpha: 1.0) : UIColor(white: 0.08, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = isSelected ? UIColor(white: 0.3, alpha: 1.0).cgColor : UIColor.clear.cgColor
        
        let lbl = UILabel(frame: CGRect(x: 8, y: 10, width: view.bounds.width, height: 15))
        lbl.text = title
        lbl.textColor = isSelected ? .white : .gray
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        view.addSubview(lbl)
        
        let sub = UILabel(frame: CGRect(x: 8, y: 30, width: view.bounds.width, height: 15))
        sub.text = subtitle
        sub.textColor = .gray
        sub.font = UIFont.systemFont(ofSize: 9)
        view.addSubview(sub)
        
        return view
    }
    
    func createToggleRow(title: String, subtitle: String, y: CGFloat) -> UIView {
        let row = UIView(frame: CGRect(x: 16, y: y, width: view.bounds.width - 32, height: 60))
        row.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        row.layer.cornerRadius = 12
        row.layer.borderWidth = 1
        row.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).cgColor
        
        let icon = UIImageView(frame: CGRect(x: 12, y: 20, width: 20, height: 20))
        icon.image = UIImage(systemName: "antenna.radiowaves.left.and.right")
        icon.tintColor = .white
        row.addSubview(icon)
        
        let lbl = UILabel(frame: CGRect(x: 44, y: 15, width: row.bounds.width - 120, height: 18))
        lbl.text = title
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        row.addSubview(lbl)
        
        let sub = UILabel(frame: CGRect(x: 44, y: 32, width: row.bounds.width - 120, height: 14))
        sub.text = subtitle
        sub.textColor = .gray
        sub.font = UIFont.systemFont(ofSize: 10)
        row.addSubview(sub)
        
        let toggle = UISwitch(frame: CGRect(x: row.bounds.width - 60, y: 15, width: 50, height: 30))
        toggle.onTintColor = .red
        toggle.addTarget(self, action: #selector(toggleChanged), for: .valueChanged)
        row.addSubview(toggle)
        
        return row
    }
    
    @objc func toggleChanged(_ sender: UISwitch) {
        if sender.isOn {
            logLabel.text = "Injetando recurso... aguarde a barra chegar a 40%."
            logLabel.textColor = .red
        } else {
            logLabel.text = "Catálogo carregado • Selecione um recurso"
            logLabel.textColor = .lightGray
        }
    }
}
