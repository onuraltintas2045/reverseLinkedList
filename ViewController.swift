//
//  ViewController.swift
//  Layout
//
//  Created by Onur Altıntas on 7.07.2023.
//

import UIKit
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class ViewController: UIViewController {
    
    var control: Int = 0
    
    var resultAppend: Int = 0
    
    var head: ListNode?
    
    @IBOutlet weak var fLabel: UITextField!
    
    @IBOutlet weak var leftLabel: UITextField!
    
    @IBOutlet weak var rightLabel: UITextField!
    
    @IBOutlet weak var sonucLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LinkedListEkle(_ sender: Any) {
        var textInt: Int = Int(fLabel?.text ?? "") ?? 0
        if control == 0 {
            head = ListNode(textInt)
            control = 1
        }
        else{
            appendToList(head, textInt)
        }
    }
    
    
    @IBAction func tersiniBul(_ sender: Any) {
        var left: Int = Int(leftLabel?.text ?? "") ?? 0
        var right: Int = Int(rightLabel?.text ?? "") ?? 0
        let reversedHead = reverseBetween(head, left, right)
        if let reversedList = reversedHead {
            var stringRepresentation = ""
            var current: ListNode? = reversedList
            while current != nil {
                stringRepresentation += "\(current!.val) -> "
                current = current?.next
            }
            if stringRepresentation.count >= 3 {
                let endIndex = stringRepresentation.index(stringRepresentation.endIndex, offsetBy: -3)
                stringRepresentation = String(stringRepresentation[..<endIndex])
            }
            sonucLabel.text = stringRepresentation
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        head = nil
        control = 0
    }
    
        
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == right {
            return head
        }
        
        let dummy: ListNode = ListNode(0, head)
        var leftPrev: ListNode? = dummy
        var cur: ListNode? = head
        
        for _ in 0..<left-1 {
            leftPrev = leftPrev?.next
            cur = cur?.next
        }
        
        var prev: ListNode? = nil
        for _ in 0..<right-left+1 {
            let tempNext = cur?.next
            cur?.next = prev
            prev = cur
            cur = tempNext
        }
        
        leftPrev?.next?.next = cur
        leftPrev?.next = prev
        
        return dummy.next
    }
    func appendToList(_ head: ListNode?, _ value: Int){

        
        var current: ListNode? = head
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = ListNode(value)
        
    }
}

