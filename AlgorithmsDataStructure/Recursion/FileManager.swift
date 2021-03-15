//
//  FileManager.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/13.
//

import Foundation

let fileManager = FileManager.default

func crawl() {
    let currentDir = fileManager.currentDirectoryPath // currentPath
    guard let result = currentDir.lastIndex(of: "/") else { return }
    let fileName = "\(currentDir[currentDir.index(result, offsetBy: 1)... ])"
    getFileList(currentDir, fileName, -1, "")
}

func getFileList(_ currentPath: String, _ fileName: String,_ lastIndex: Int, _ indent: String) {
    let fileManager = FileManager.default
    var lastIndexFlg = lastIndex
    var indentStr = indent
    
    guard let files = try? fileManager.contentsOfDirectory(atPath: currentPath) else {
        print(indent + "└─" + fileName)
        return
    }
    let endIndex = files.endIndex - 1
    
    if lastIndexFlg == 0 {
        print(indent+"├─" + fileName)
        indentStr += "│"
    } else {
        print(indent+"└─" + fileName)
    }
    
    for file in files {
        if file == files[endIndex] {
            lastIndexFlg = 1
        } else {
            lastIndexFlg = 0
        }
        getFileList(currentPath + "/" + file, file, lastIndexFlg, indentStr + "   ")
    }
}

