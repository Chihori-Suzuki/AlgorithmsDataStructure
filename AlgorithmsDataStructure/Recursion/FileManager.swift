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
    getFileList(currentDir, fileName, true, "")
}

func getFileList(_ currentPath: String, _ fileName: String,_ isLastFile: Bool, _ indent: String) {
    let fileManager = FileManager.default
    var indentStr = indent
    
    guard let files = try? fileManager.contentsOfDirectory(atPath: currentPath) else {
        if isLastFile {
            print(indent + "└─" + fileName)
        } else {
            print(indent + "├─" + fileName)
        }
        return
    }
    if isLastFile {
        print(indent+"└─" + fileName)
    } else {
        print(indent+"├─" + fileName)
        indentStr += "│"
    }
    
    for file in files {
        let isLastFile = file == files.last

        getFileList(currentPath + "/" + file, file, isLastFile, indentStr + "   ")
    }
}

