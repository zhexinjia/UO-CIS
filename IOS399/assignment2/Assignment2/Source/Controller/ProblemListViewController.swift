//
//  ProblemListViewController.swift
//  Assignment2
//
//  Created by Charles Augustine on 7/5/15.
//
//


import UIKit


class ProblemListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	// UITableViewDataSource
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ProblemListRow.Rows.count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("ProblemCell", forIndexPath: indexPath) 
		cell.textLabel?.text = ProblemListRow.Rows[indexPath.row].cellText

		return cell
	}

	// UITableViewDelegate
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier(ProblemListRow.Rows[indexPath.row].segue, sender: self)
	}

	// MARK: View Management
	override func viewWillAppear(animated: Bool) {
		problemListTable.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: .Top)
	}

	// MARK: View Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()

		preferredContentSize = CGSize(width: 320.0, height: 600.0)
	}

	// MARK: Properties (IBOutlet)
	@IBOutlet private weak var problemListTable: UITableView!


	// MARK: ProblemListRow
	private enum ProblemListRow {
		case ProblemOne
		case ProblemTwo
		case ProblemThree
		case ProblemFour
		case ProblemFive
		case ProblemSix

		var cellText: String {
			let text: String
			switch self {
			case .ProblemOne:
				text = "Problem One"
			case .ProblemTwo:
				text = "Problem Two"
			case .ProblemThree:
				text = "Problem Three"
			case .ProblemFour:
				text = "Problem Four"
			case .ProblemFive:
				text = "Problem Five"
			case .ProblemSix:
				text = "Problem Six"
			}

			return text
		}

		var segue: String {
			let text: String
			switch self {
			case .ProblemOne:
				text = "ProblemOneSegue"
			case .ProblemTwo:
				text = "ProblemTwoSegue"
			case .ProblemThree:
				text = "ProblemThreeSegue"
			case .ProblemFour:
				text = "ProblemFourSegue"
			case .ProblemFive:
				text = "ProblemFiveSegue"
			case .ProblemSix:
				text = "ProblemSixSegue"
			}

			return text
		}

		private static let Rows: Array<ProblemListRow> = [.ProblemOne, .ProblemTwo, .ProblemThree, .ProblemFour, .ProblemFive, .ProblemSix]
	}
}
