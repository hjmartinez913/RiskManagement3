using {riskmanagement as rm} from '../db/schema';

@path: 'service/test/risk'
service RiskService {
    entity Risks @(restrict : [
      {
        grant : 'READ',
        to : 'RiskViewer'
      },
      {
        grant: [
          'READ',
          'WRITE',
          'UPDATE',
          'UPSERT',
          'DELETE'
        ],
        to : 'RiskManager'
      }
    ] ) as projection on rm.Risks;
    annotate Risks with @odata.draft.enabled;

    entity Mitigations @( restrict: [
      { grant : 'READ', 
        to : 'RiskViewer'
      },
      { grant : '*',
        to : 'RiskManager'
      }
    ]) as projection on rm.Mitigations;
    annotate Mitigations with @odata.draft.enabled ;
    
    //BusinessPartner
      @readonly entity BusinessPartner as projection on rm.BusinessPartner;

}