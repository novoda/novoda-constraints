import UIKit

class TableViewController: UITableViewController {

    let tableCellIdentifier = "tableCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableCell.self, forCellReuseIdentifier: tableCellIdentifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! TableCell
        cell.setup()
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

class TableCell: UITableViewCell {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()

    func setup() {
        backgroundColor = .gray
        addViews()
        setupViews()
        addConstraints()
    }

    private func addViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }

    private func setupViews() {
        titleLabel.text = "My Title"
        subtitleLabel.text = "My subtitle"
    }

    private func addConstraints() {
        titleLabel.pin(toSuperview: .top, .leading)
        subtitleLabel.pin(.top, to: .bottom, of: titleLabel)
        subtitleLabel.pin(toSuperview: .leading, .bottom)
    }
}
