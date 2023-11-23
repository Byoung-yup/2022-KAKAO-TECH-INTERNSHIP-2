//
//  main.swift
//  2022 KAKAO TECH INTERNSHIP #2
//
//  Created by 김병엽 on 2023/11/23.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    let array = queue1 + queue2
    var left = 0
    var right = queue1.count
    var answer = 0
    
    var queue1Sum = queue1.reduce(0, +)
    let queue2Sum = queue2.reduce(0, +)
    let goal = (queue1Sum + queue2Sum) / 2
    
    // 나눌 수 없는 경우
    if (queue1Sum + queue2Sum) % 2 != 0 {
        return -1
    }
    
    while right < array.count && left <= right {
        
        if queue1Sum < goal {
            queue1Sum += array[right]
            right += 1
        }
        else if queue1Sum > goal {
            queue1Sum -= array[left]
            left += 1
        }
        else {
            // 나눈 경우
            break
        }
        
        answer += 1
    }
    
    if queue1Sum != goal {
        return -1
    }
    
    return answer
}
