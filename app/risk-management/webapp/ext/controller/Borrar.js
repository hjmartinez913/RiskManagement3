sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        Borrar: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
