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
//    print(currentDir)
    getFileList(currentDir, fileName, -1, "")
}

func getFileList(_ currentPath: String, _ fileName: String,_ lastIndex: Int, _ indent: String) {
//    print(currentPath)
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
//        print(indent + file)
        if file == files[endIndex] {
            lastIndexFlg = 1
        } else {
            lastIndexFlg = 0
        }
        getFileList(currentPath + "/" + file, file, lastIndexFlg, indentStr + "   ")
    }
//    print(files)
    // files=[x86_64-apple-macos.swiftdoc,
    //        x86_64.swiftdoc,
        //    x86_64.swiftmodule,
    //        Project
    //        x86_64-apple-macos.swiftmodule,
//    ]
    
    
//    do {
//        files = try fileManager.contentsOfDirectory(atPath: dirName)
//        print(files)
//    } catch {
//        print("swesewsew")
//        return ["files"]
//    }
//    return files
}

