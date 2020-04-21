class Questionaire {
  static List questionnaire = [
    {
      'title': 'General Information',
      '_1': [ 'Name of dairy Cooperative Union you belong to', ['Select','Balaka','Chibombo','Fisenge','Kwanshama','Liteta','Mufulira']],
      '_2': [ 'Name of Primary Cooperative', [
        {'Balaka':['Select','BALAKA','TUJATANE','MASENGO A','MALUMBO','BALAKA C','TUKABASANGA','TWATASHA','MAPALO','KAFUTO','TWEENDE',
                  'MAKASU','CHOWA DAIRY','CHIBANGA YOUTH','KANDO','TUGWILIZANE','KA-BATTERY','CHINYA','MUKUBA']},
        {'Chibombo':['CHABANENE','TULANGANE','JORDAN','MUKOTONGWA','TWAPENGA']},
        {'Fisenge':['JELE HEIFER','TWASHUKA','BUPE','CHAWAMA','TIGWILIZANE','CHIBOTE','MUCHINSHI','IVWANANJI','CHINCHI WABABILI','IYA','KANGO KAMPALA','TWIKATANE']},
        {'Kwanshama':['KWANSHAMUKWENU','NSHAKALABE','MAZZIELI']},
        {'Liteta':['MUSHIKILI','LITETA EAST','MWAMFUMBA','CHANKUMBA']},
        {'Mufulira':['KALINDINI','KAFUE','MUKAMBO','KAMUKOLWE','MUTUNDU SOUTH']} 
        ]
      ],
      '_3': ['Is this your first Interview ?', ['Yes','No']], 
      '_4': ['Household ID'], 
      '_5': ['Latitude'],
      '_6': ['Longitude'],
      '_7': ['Date'],
      '_8': ['Time'],         
    },
    {
      'status':[true], //means section is active
      'title': 'General Information',
      'A.': {'Name of respondent',[true], {}},
      'B.': {'Village/ Settlement name where farm HH is located',[false], {}},
      'C.': {'Age of respondent',[true], {}},
      'D.': {'Gender of respondent',[true], {'Male', 'Female'}},
      'E.': {'Contact phone(in case we need to arrange a re-visit)',[true], {}},
    },
    {
      'status':[true], //means section is active
      'title': 'Household Information',
      'A.': {'Number of children 16yrs and under',[true], {}},
      'B.': {'Number of Young adults, i.e 17-25yrs',[false], {}},
      'C.': {'Number of 26 - 40 year olds',[true], {}},
      'D.': {'Number of 40 - 60 year olds',[true], {'Male', 'Female'}},
      'E.': {'Number of people older than 60 years',[true], {}},
    }
  ];
}