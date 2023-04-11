package com.outsystems.credolab.plugin;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;


public class CredoLabPlugin extends CordovaPlugin {

    private CallbackContext callbackContext;
    private String ACTION_COLLECT_DATA = "collectData";

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
        this.callbackContext = callbackContext;

        if (action != null) {
            cordova.getThreadPool().execute((Runnable) () -> {
                try {
                    if (ACTION_COLLECT_DATA.equals(action)) {
                        collectData();
                    }
                } catch (Exception ex) {
                    callbackContext.error(ex.getMessage());
                }
            });
        } else {
            this.callbackContext.error("Action invalid!");
            return false;
        }
        return true;
    }

    private void collectData() {
        this.callbackContext.success("Data collected result will be here");
    }
}