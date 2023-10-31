export const yearList = [
        { 'year': 2023 },
        { 'year': 2022 },
        { 'year': 2021 }
];

export const movementTypeList = [
    {
        'movementTypeId': 1,
        'movementTypeName': 'Income'
    },
    {
        'movementTypeId': 2,
        'movementTypeName': 'Expense'
    }
]

 export const cardList = [
    {
        'cardId': 0,
        'cardName': 'Select a Card'
    },
    {
        'cardId': 1,
        'cardName': 'Tarjeta de Debito BCP'
    },
    {
        'cardId': 2,
        'cardName': 'Tarjeta de Credito BCP'
    },
    {
        'cardId': 3,
        'cardName': 'Tarjeta de Debito BCP Dolares'
    },
    {
        'cardId': 4,
        'cardName': 'Tarjeta Oh!'
    },
];

export const monthList = [
    {
        'monthId': 1,
        'monthName': 'Enero'
    },
    {
        'monthId': 2,
        'monthName': 'Febrero'
    },
    {
        'monthId': 3,
        'monthName': 'Marzo'
    },
    {
        'monthId': 4,
        'monthName': 'Abril'
    },
    {
        'monthId': 5,
        'monthName': 'Mayo'
    },
    {
        'monthId': 6,
        'monthName': 'Junio'
    },
    {
        'monthId': 7,
        'monthName': 'Julio'
    },
    {
        'monthId': 8,
        'monthName': 'Agosto'
    },
    {
        'monthId': 9,
        'monthName': 'Septiembre'
    },
    {
        'monthId': 10,
        'monthName': 'Octubre'
    },
    {
        'monthId': 11,
        'monthName': 'Noviembre'
    },
    {
        'monthId': 12,
        'monthName': 'Diciembre'
    },
];

function padTo2Digits(num: any) {
    return num.toString().padStart(2, '0');
}

export const formatDate = (date: string) => {
    return [
        padTo2Digits(date.getDate()),
        padTo2Digits(date.getMonth() + 1),
        date.getFullYear()
    ].join('/');
}

export const formatParams = (objParam: any) => {
  const nameParamList  = Object.getOwnPropertyNames(objParam);
  const valueList = Object.values(objParam);
  let urlGetParam = "?";
  nameParamList.map((paramName, index) => {
    urlGetParam = urlGetParam + paramName + '=' + valueList[index] + '&';
  });
  urlGetParam = urlGetParam.substring(0, urlGetParam.length - 1);
  return urlGetParam;
}