import Foundation
import CredoAppCore
import CredpAppMusic
 
@objc(CredoLabPlugin)
public class CredoLabPlugin : CDVPlugin {
 
  @objc
  func execute(_ command: CDVInvokedUrlCommand) {
    let request = command.argument(at: 0) as? Dictionary<String, String>
    DispatchQueue.global().async {
      
        let pluginResult:CDVPluginResult
            
            let credoAppService = CredoAppService.Builder()
      					.addModule(MusicModule())
                .build()
            let result = credoAppService.collect()
            switch result {
                case .success(let value):
                    pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: value)
                case .error(let errorCode, let errorMsg):
                    let errorResultMsg = "{Message: \(errorMsg) code: \(errorCode)}"
                    pluginResult = CDVPluginResult.init(status: CDVCommandStatus_ERROR, messageAs: errorResultMsg)
            }
            
            self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
       }
    }
}