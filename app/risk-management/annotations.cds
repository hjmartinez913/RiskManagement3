using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>RiskOverview}',
            ID : 'i18nRiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'Risksection',
                    Target : '@UI.FieldGroup#Risksection',
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation Overview',
            ID : 'MitigationOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>MitigationDetails}',
                    ID : 'MitigationDetails',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priority}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Mitigation}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : '{i18n>BusinessPartner}',
        },
    ],
    UI.SelectionFields : [
        prio_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #RiskDetail : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #RiskSection : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #Risksection : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact1',
                Label : '{i18n>BusinessPartner}',
            },
        ],
    },
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Mitigation}',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : 'Owner',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeLine,
                Label : '{i18n>Timeline}',
            },
        ],
    },
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : bp_BusinessPartner,
    },
);

annotate service.Risks with {
    miti @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'owner',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'timeLine',
                },
            ],
            Label : '{i18n>Mitigation}',
        },
        Common.Text : {
            $value : miti.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Risks with {
    prio @(
        Common.Label : '{i18n>Priority}',
        Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.Mitigations with {
    ID @Common.Text : descr
};

annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};

annotate service.Mitigations with {
    timeLine @Common.FieldControl : #ReadOnly
};

annotate service.BusinessPartner with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
);

