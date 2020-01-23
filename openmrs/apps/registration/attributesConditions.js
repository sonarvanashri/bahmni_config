var showOrHideReferredBySection = function (patient) {
    var returnValues = {
        show: [],
        hide: []
    };
    if (patient["class"].value == "OBC") {
        returnValues.show.push("additionalPatientInformation");
    }  else {
        returnValues.hide.push("additionalPatientInformation");
    }
    return returnValues
};

Bahmni.Registration.AttributesConditions.rules = {
    'class': function (patient) {
        return showOrHideReferredBySection(patient);
    }
};


    
