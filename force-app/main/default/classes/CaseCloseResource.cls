@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
    @HttpPost
    global static string closeCase(String reason) {
        RestRequest req = RestContext.request;
        System.debug(req.requestURI.split('/')[2]);
        System.debug(reason);
        CaseService.closeCases(
            new Set<Id>{req.requestURI.split('/')[2]}, 
            reason
        );
        return 'OK';
    }
}

/*
/services/apexrest/case/2/close
{
    "reason":"hello"
}
*/