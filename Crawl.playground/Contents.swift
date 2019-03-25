import Cocoa

let home = FileManager.default.homeDirectoryForCurrentUser
let path = "Swift/"
let swiftUrl = home.appendingPathComponent(path)
let fileManager = FileManager.default
var isDirectory: ObjCBool = false
fileManager.fileExists(atPath: swiftUrl.path, isDirectory: &isDirectory)

if( isDirectory.boolValue ) {
    
    do{
        let contentURLs = try fileManager.contentsOfDirectory(at: swiftUrl, includingPropertiesForKeys: [.nameKey, .fileSizeKey], options: .skipsHiddenFiles)
        
        for fileURL in contentURLs {
            do {
                let fileAttributes = try fileURL.resourceValues(forKeys:[.nameKey, .fileSizeKey])
                print("├─" + fileAttributes.name!)
                let lowfileURLs = try fileManager.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: [.nameKey, .fileSizeKey], options: .skipsHiddenFiles)
                for lowfileURL in lowfileURLs {
                    let lowFileAttributes = try lowfileURL.resourceValues(forKeys:[.nameKey, .fileSizeKey])
                    print("| └─" + lowFileAttributes.name!)
                }
            } catch { print(error, fileURL) }
        }
    } catch { print(error)
}
    
} else {
    
    print("Error!! File doesn't exists")
}
