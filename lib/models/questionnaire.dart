class Questionaire {
  Map variables = {
    'year':'2020',
    'active': true,
    'other_variables':['','','']
  };

  List q10 = ['Animal grazing','Animal fodder','Sale','Other'];
  void setSections({Map variables}){

  }
 
  static List metaData = [
    {
      'status':[true],
      'title': 'Meta Data',
      'no' : '',
      '_1': [ 'Name of dairy Cooperative Union you belong to', ['Select','Balaka','Chibombo','Chikuse','Fisenge','Kwanshama','Liteta','Mufulira', 'Mumbwa','Sunnyridge','Other' ]],
      '_2': [ 'Name of Primary Cooperative', [
        {'Balaka':['Select','BALAKA','TUJATANE','MASENGO A','MALUMBO','BALAKA C','TUKABASANGA','TWATASHA','MAPALO','KAFUTO','TWEENDE',
                  'MAKASU','CHOWA DAIRY','CHIBANGA YOUTH','KANDO','TUGWILIZANE','KA-BATTERY','CHINYA','MUKUBA']},
        {'Chibombo':['Select','CHABANENE','TULANGANE','JORDAN','MUKOTONGWA','TWAPENGA']},
        {'Fisenge':['Select','JELE HEIFER','TWASHUKA','BUPE','CHAWAMA','TIGWILIZANE','CHIBOTE','MUCHINSHI','IVWANANJI','CHINCHI WABABILI','IYA','KANGO KAMPALA','TWIKATANE']},
        {'Kwanshama':['Select','KWANSHAMUKWENU','NSHAKALABE','MAZZIELI']},
        {'Liteta':['Select','MUSHIKILI','LITETA EAST','MWAMFUMBA','CHANKUMBA']},
        {'Mufulira':['Select','KALINDINI','KAFUE','MUKAMBO','KAMUKOLWE','MUTUNDU SOUTH']} 
        ]
      ],
      '_3': ['Is this your first Interview ?', ['Yes','No','Household Unlisted']], 
      '_4': ['Household ID'], 
      '_5': ['Latitude'],
      '_6': ['Longitude'],
      '_7': ['Date'],
      '_8': ['Time'],         
    }
    ];

  List getSections() {
    return [  
        {
          'sec':'sec_1',
          'status':this.variables['active'], //means section is active
          'title': '1. General Information',
          'no' : '1',
          '_1': ['A. Name of respondent',[true], []],
          '_2': ['B. Village/ Settlement name where farm HH is located',[false], []],
          '_3': ['C. Age of respondent',[true], []],
          '_4': ['D. Gender of respondent',[true], ['Male', 'Female']],
          '_5': ['E. Contact phone(in case we need to arrange a re-visit)',[true], []],
        },
        {
          'sec':'sec_2',
          'status':this.variables['active'], //means section is active
          'title': '2. Household Information',
          'no' : '2',
          '_1': ['A. Number of children 16yrs and under',[true], []],
          '_2': ['B. Number of Young adults, i.e 17-25yrs',[false], []],
          '_3': ['C. Number of 26 - 40 year olds',[true], []],
          '_4': ['D. Number of 41 - 60 year olds',[true],[]],
          '_5': ['E. Number of people older than 60 years',[true], []],
        },
        {
          'sec':'sec_3',
          'status':this.variables['active'], //means section is active
          'title': '3. Household Nutrition - Only if selected. See separate sheet.',
          'no' : '3',
          '_1' : {'',[true],[]}
        },
        {
          'sec':'sec_4',
          'status':this.variables['active'], //means section is active
          'title': '4. History of involvement in dairy farming - For the principal decision maker of dairy activities within the household',
          'no' : '4',
          '_1': ['A. How many years have you been involved in farming?',[true], []],
          '_2': ['B. How many years have you been involved in dairy farming?',[false], []],
          '_3': ['C. How did you get started in dairy farming(Choose one only)?',[true], 
                ['Select','Family history','Cow from Heifer','Cow from Land o Lakes','Cow from other donor project','ZANACO cow','Received a "pass on cow"', 'Own initiative','Other']],
          '_4': ['D. Is dairy farming your main occupation?',[true],['Yes','No']],
          '_5': ['E. if NO, what is your many occupation?',[true], []],
        }
        ,
        {
          'sec':'sec_5',
          'status':this.variables['active'], //means section is active
          'title': '5. Coorperative Membership',
          'no' : '5',
          '_1': ['A. How long have you been a member of the coorperative?',[true], ['Select','Less than 6 months','6 months - 1 year','Between 1 and 5 years','More than 5 years']],
          '_2': ['B. What is your membership status?',[true], 
                ['Select',
                  'Currently providing milk',
                  'Recently received a dairy animal and planning to take milk to the MCC when the cow starts milking',
                  'Not currently providing milk, but has provided milk within the last 6 months (Active)',
                  'Not currently providing milk, but has provided milk within last 2 years(i.e 6-24mths ago)',
                  'Previously provided milk,but not within the last 2 years(inactive)',
                  'Does not have an animal/ waiting for a pass-on-on, but goes to ZDTP trainings'
                  ]],
          '_3': ['C. If you havent provided milk within the last 2 years,do you intend to provide milk to the Dairy Coorperative Union within the next 6 months?',[true],
                ['Yes','No']], 
          '_4': ['D. What is your role within the cooperative?',[true],
                [
                  'Current Board member (Coop Union)',
                  'Former Board member (Coop Union)',
                  'Current Board member (Primary Union)',
                  'Former Board member (Primary Coop)',
                  'Farmer member',
                  'Non-member but supplying milk',
                  'Other',
                  
              ]
            ]
        },
        {
          'sec':'sec_6',
          'status':this.variables['active'], //means section is active
          'title': '6. Land Ownership /use of farmer',
          'no' : '6',
          '_1': ['i. Own/ freehold',[true],[]], 
          '_2': ['ii. Settlement (Lease GRZ)',[true],[]], 
          '_3': ['iii. Rent/ Sub-lease/ Informal lease',[true],[]], 
          '_4': ['iv. Use of Traditional Land',[true],[]], 
          '_5': ['v. Other',[true],[]], 
        },
        {
          'sec':'sec_7',
          'status':this.variables['active'], //means section is active
          'title': '7. Where do you graze your cattle',
          'no' : '7',
          '_1': ['A. Is the land for grazing your cattle within a 1 km radius of your household',[true],['Yes','No']], 
          '_2': ['B. How far is it',[true],[]], 
        }
        ,
        {
          'sec':'sec_8',
          'status':this.variables['active'], //means section is active
          'title': '8. Farm information - Water for household and animals - Complete all that apply',
          'no' : '8',
          '_1': ['C. Do you have water for irrigation',[true],['Yes','No']], 
          '_2': ['D. Do you use any methods of water conservation, or water harvesting',[true],['Yes','No']],  
          '_3': ['E. Methods of water conservation',[true],['Dams','Wells','Ponds','Rainwater tanks','Other']], 
        },
        {
          'sec':'sec_9',
          'status':this.variables['active'], //means section is active
          'title': '9. Farm information - Which Energy sources do you use on your farm',
          'no' : '9',
          '_1': ['',[true],['Electricity','Solar','Charcoal','Improved Charcoal','Fireword','Bio-gas','Other']], 
        },
        {
          'sec':'sec_10',
          'status':this.variables['active'], //means section is active
          'title': '10. Which fodder crops did you grow in the last 12 months(since May ${variables['year']} and what did you use them for?)',
          'no' : '10',
          '_questions': [
              ['A. Rhodes grass',[true],q10],
              ['B. Napier grass',[true],q10],
              ['C. Cow pea',[true],q10],
              ['D. Pigeon pea',[true],q10],
              ['E. Velvet beans',[true],q10],
              ['F. Stylo',[true],q10],
              ['G. Brachiaria',[true],q10],
              ['H. Sorghum',[true],q10],
              ['I. Sun-hemph',[true],q10],
              ['J. Lablab',[true],q10],
              ['K. Yellow maize',[true],q10],
              ['L. White maize',[true],q10],
              ['M. Soya beans',[true],q10],
              ['N. Sunflower',[true],q10],
              ['O. Cotton',[true],q10],
              ['P. Sweet potatoes',[true],q10],
              ['Q. Pumpkin',[true],q10],
              ['R. Cassava',[true],q10],
              ['S. Other',[true],q10],
              ],
        } ,
         
        {
          'sec':'sec_11',
          'status':this.variables['active'], //means section is active
          'title': '11. Demonstration plots',
          'no' : '11',
          '_1': ['A. Are any of the crops in question 10 demonstration plots',[true],['Yes','No']], 
          '_2': ['B. Which crops are demonstration plots',[true],
                  ['Rhodes grass',
                    'Napier grass',
                    'Cow pea',
                    'Pigeon pea',
                    'Velvet beans',
                    'Stylo' ,
                    'Brachiaria' ,
                    'Sorghum' ,
                    'Sun-hemph' ,
                    'Lablab',
                    'Yellow maize',
                    'White maize' ,
                    'Soya beans',
                    'Sunflower' ,
                    'Cotton' ,
                    'Sweet potatoes' ,
                    'Pumpkin',
                    'Cassava' ,
                    'Other']],  

          '_3': ['C. Funded By',[true],['ZDTP','Heifer','MFL(IFAD - ESLIP)','Other']], 
        },
        {
          'sec':'sec_12',
          'status':this.variables['active'], //means section is active
          'title': '12. Labour used on farm - NOT ACTIVE',
          'no' : '12',
          '_1' : {'',[true],[]}
        },
        {
          'sec':'sec_13',
          'status':this.variables['active'], //means section is active
          'title': '13. income from dairy-related activities during previous 12 months(i.e since May ${variables['year']} )',
          'no' : '13',
          '_input': ['Data Input',[true],['Month','Year']],
          '_1': ['Raw milk sales to the Dairy Cooperative Union',[true],[]], 
          '_2': ['Raw fresh milk sales to other customers',[true],[]], 
          '_3': ['Sale of sour milk to other customers',[true],[]], 
          '_4': ['Sale of culled cows',[true],[]], 
          '_5': ['Sale of excess dairy stock',[true],[]], 
          '_6': ['Sale of manure',[true],[]], 
          '_7': ['Sale of excess forage /fodder',[true],[]], 
          '_8': ['Other',[true],[]], 
          '_9': ['Total income of dairy-related activities',[true],[]], 
        },
        {
          'sec':'sec_14',
          'status':this.variables['active'], //means section is active
          'title': '14. income from non dairy activities during previous 12 months(i.e since May ${variables['year']} )',
          'no' : '14',
          '_input': ['Data Input',[true],['Month(ZMW)','Year(ZMW)']],
          '_1': ['Income from labour hired out',[true],[]], 
          '_2': ['Income from land rented out',[true],[]], 
          '_3': ['Sale of cash crops',[true],[]], 
          '_4': ['Sale of beef animals',[true],[]], 
          '_5': ['renting oxen for draught power',[true],[]], 
          '_6': ['Sale of sheep',[true],[]], 
          '_7': ['Sale of goats',[true],[]], 
          '_8': ['Sale of other livestock,e.g chickens',[true],[]], 
          '_9': ['Sale of livestock products, e.g eggs,honey',[true],[]], 
          '_10': ['Forestry',[true],[]], 
          '_11': ['Off-farm income',[true],[]], 
          '_12': ['Other',[true],[]], 
          '_13': ['Total income of dairy-related activities',[true],[]], 
        },
        {
          'sec':'sec_15',
          'status':this.variables['active'], //means section is active
          'title': '15. Smallholder Expenditure during the previous 12 months(i.e since May ${variables['year']} )',
          'no' : '15',
          '_input': ['Data Input',[true],['Month(ZMW)','Year(ZMW)']],
          '_1': [{'_1':'Feed and feeding technologies','_1options':[
                  'Cost of maize/ wheat bran',
                  'Cost of feeds for pregnant cows',
                  'Cost of calf feeds',
                  'Cost of other bought in "ready-made" feeds',
                  'Cost of bought in concentrates',
                  'Cost of feed additives e.g. Salt, DCP',
                  'Cost of raw materials to produce on-farm forage/ fodder (seeds, fertiliser, etc)',
                  'Cost of urea /molasses treatment for crop residues',
                  'Cost of agricultural by-products, e.g brewery yeast',]},[true],[]], 
          '_2': [{'_2':'Other feeding costs','_2options':['','']},[true],[]], 
          '_3': [{'_3':'Health','_3options':[
                    'Cost of veterinary drugs',
                    'Cost of veterinary treatment(service provision) excluding drugs']},[true],[]], 
          '_4': [{'_4':'Reproduction','_4options':[
                    'Reproduction costs A.I/Bull',
                    'Cost of replacement of heifers']},[true],[]], 
          '_5': [{'_5':'Transport','_5options':[
                      'Cost of milk transport to the MCC',
                      'Cost of transport for feed and other farm inputs']},[true],[]], 
          '_6': [{'_6':'Energy','_6options':['Cost of energy']},[true],[]], 
          '_7': [{'_7':'Labour','_7options':[
                'Labour paid in cash',
                'Labour paid "in kind"(insert cash equivalent)']},[true],[]], 
          '_8': [{'_8':'Other','_8options':['Rental of land','Other']},[true],[]], 
        },{
          'sec':'sec_16',
          'status':this.variables['active'], //means section is active
          'title': '16. Assets',
          'no' : '16',
          '_1' : ['Do you have your own tractor?',[true],['Yes','No']],
          '_2' : ['Do you have access to a tractor?',[true],['Yes','No']],
          '_3' : ['Do you own a chopper?',[true],['Yes','No']],
          '_4' : ['Do you get access to one?',[true],['Yes','No']],
          '_questions': [
              ['A. Tractor',[true],['New', 'Used','Not working']],
              ['B. Hand Tractor',[true],['New', 'Used','Not working']],
              ['C. Planter',[true],['New', 'Used','Not working']],
              ['D. Plough/ Ox driven',[true],['New', 'Used','Not working']],
              ['E. Bicycle',[true],['New', 'Used','Not working']],
              ['F. Motor Bike',[true],['New', 'Used','Not working']],
              ['G. Van',[true],['New', 'Used','Not working']],
              ['H. Small truck',[true],['New', 'Used','Not working']],
              ['I. Car',[true],['New', 'Used','Not working']],
              ['J. Fridge or milk vat',[true],['New', 'Used','Not working']],
              ['K. Small milking machine',[true],['New', 'Used','Not working']],
              ['L. Stainless steel/ alloy milk can',[true],['New', 'Used','Not working']],
              ['M. Stainless stell / alloy milk bucket',[true],['New', 'Used','Not working']],
              ['N. Solar light',[true],['New', 'Used','Not working']],
              ['O. Chopper / chaff cutter',[true],['New', 'Used','Not working']],
              ['P. Other',[true],['New', 'Used','Not working']],

              ],
        },
         {
          'sec':'sec_17',
          'status':this.variables['active'], //means section is active
          'title': '17. Milk quality',
          'no' : '17',
          '_1': ['A. Do you normally clean the cow teats with a clean cloth/ tissue before milking?',
                [true], ['Select','Yes','No','Not applicable']],
          '_2': ['B. Do you use any form of mastitis detection on your farm ?',[true], ['Select','Yes','No','Sunlight','Other RMT','Not applicable']],
          '_3': ['C. Do you normally apply any teat salve/ lubricant to the cows teats?',[true], ['Select','Yes','No','Not applicable']],
          '_4': ['D. Do you normally use teat dip after milking?',[true], ['Select','Yes','No','Sunlight','Other RMT','Not applicable']],
          '_5': ['E. Have you had any cases of mastitis on yoour farm during the last 12 months?',[true], 
                ['Select','Yes','No','Sunlight','Other RMT','Not applicable']],
        },
        {
          'sec':'sec_18',
          'status':this.variables['active'], //means section is active
          'title': '18. Herd data - cattle(at time of survey)',
          'no' : '18',
          '_1': ['A. Cows in milk',[true], []],
          '_2': ['B. Cows over 2 yrs not in milk',[false], []],
          '_3': ['C. Heifers(4mths-2 years)',[true], []],
          '_4': ['D. Female calves less than 3 mths',[true],[]],
          '_5': ['E. Male animals, any age, Not used as breeding bulls(i.e incl calves)',[true], []],
          '_6': ['F. Breeding bulls of any age',[true],[]],
        },
        {
          'sec':'sec_19',
          'status':this.variables['active'], //means section is active
          'title': '19. Silage which you fed to your cattle between May ${this.variables['year']} - April 2021',
          'no' : '19',
          '_1': ['A. Did you make any grass silage for your cattle between May ${this.variables['year']} - April 2021',[true], ['Yes','No']],
          '_2': ['B. Did you make any whole crop maize silage (cob in) for your cattle between May ${this.variables['year']} - April 2021',[true], ['Yes','No']],
          '_3': ['C. Did you feed your cattle maize stover silage from your farm between May ${this.variables['year']} - April 2021',[true], ['Yes','No']],

        },
        {
          'sec':'sec_20',
          'status':this.variables['active'], //means section is active
          'title': '20. Hay made and purchased during the previous 12 months(i.e since May ${this.variables['year']})',
          'no' : '20',
          '_1': ['A. Hay bales made',[true], ['Yes','No']],
          '_2': ['B. Hay bales purchased',[true], ['Yes','No']],
        },{
          'sec':'sec_21',
          'status':this.variables['active'], //means section is active
          'title': '21. Concertrates bought during previous year(i.e since May ${this.variables['year']})',
          'no' : '21',
          '_1': ['Have you made any home-made concertrates in the last year',[true], ['Yes','No']],
          '_2': ['D19','D21','Meal No 3','Novamilk 35']
        },{
          'sec':'sec_22',
          'status':this.variables['active'], //means section is active
          'title': '22. Milking routine',
          'no' : '22',
          '_1': ['A. Who normally milks the cows',[true], ['Select','Husband(Male adult)','Wife(Female adult)','Son(Male child)',
                'Daughter(Female child)','Worker','Other']],
          '_2': ['B. Where do they normally milk the cow',[true], ['Select','Outside','Within holding pen (Kraal)','Milking parlour(uncovered)',
                  'Milking parlour covered','Other']],
          '_3': ['C. When do you normally milk the animals',[true], ['Select','Morning','Afternoon','Both(morning + afternoon)','Other']],
          '_4': ['F. How does the milk normally get to the collection point/ MCC',[true], ['Select','Foot','Bicycle','Motorbike','Four wheeled Vehicle',
                'Public transport','Other']],
          '_5': ['G. What is the condition of the road normally used to get to the collection point/ MCC',[true], 
                ['Tarred','Gravel','Seasonal(only passable when dry)','Path across fields','Other']],
          '_6': ['H. Approximately how many kilometers do you travel to get to the collection point/ MCC',[true],[]]
        },{
          'sec':'sec_23',
          'status':this.variables['active'], //means section is active
          'title': '23. Milk hygiene',
          'no' : '23',
          '_1': ['A. Do you use a stainless-steel milking bucket?',[true], ['Yes','No']],
          '_2': ['B. Do you use a stainless-steel milking cans?',[true], ['Yes','No']],
          '_3': ['C. What do you use to clean yoour cans?',[true], ['Cold water','Warm water','Boiling water','Detergent','Other']],
          '_4': ['D. Do you use a drying rack?',[true], ['Yes','No']],
        },
        {
          'sec':'sec_24',
          'status':this.variables['active'], //means section is active
          'title': '24. Lactation length',
          'no' : '24',
          '_1': ['What is the average lactation length of your animals?',[true], []],
        },
        {
          'sec':'sec_25',
          'status':this.variables['active'], //means section is active
          'title': '25. Milk Production',
          'no' : '25',
          '_input': ['Data Input',[true],['Lts Per Day','Lts Per Month','Lts Per Year']],
          '_1': ['A. Average milk production per cow',[true], []],
          '_2': ['B. Average herd milk production',[true], []],
          '_3': ['C. Milk sold by the road side',[true], []],
          '_4': ['D. Milk for home-consumption',[true], []],
          '_5': ['E. Milk for calf rearing',[true], []],
          '_6': ['F. Other milk losses',[true], []],
          '_7': ['G. Total milk to MCC',[true], []],
        },
         {
           'sec':'sec_26',
          'status':this.variables['active'], //means section is active
          'title': '26. Not Active',
          'no' : '26',
          '_1' : {'',[true],[]}
        },{
          'sec':'sec_27',
          'status':this.variables['active'], //means section is active
          'title': '27. Milk rejected by MCC during the previous 12 months(i.e since May ${this.variables['year']})',
          'no' : '27',
          '_1': ['Have you had any Milk rejected by the MCC during the previous 12 months(i.e since May ${this.variables['year']})',[true],['Yes','No']], 
          '_2': ['How many litres',[true],[]], 
        },{
          'sec':'sec_28',
          'status':this.variables['active'], //means section is active
          'title': '28. Breeding method',
          'no' : '28',
          '_1': ['Which breeding methods do you normally use for your cattle',[true],
                ['Rent Dairy Bull/ Community bull','Rent Local Breed Bull/ Community bull','Use own Dairy Bull',
                'Use own Local Breed Bull','AI(Artificial Insemination)']], 
        },{
          'sec':'sec_29',
          'status':this.variables['active'], //means section is active
          'title': '29. Reproduction problems during the previous 12 months(i.e May ${this.variables['year']} - April 2021)',
          'no' : '29',
          '_1': ['A. Have you had any problems getting cows pregnant ',[true], ['Yes','No']],
          '_2': ['B. Have you had any still Births/Abortions ',[true], ['Yes','No']],
          '_3': ['C. Have you had any Calf deaths ',[true], ['Yes','No']],
          '_4': ['D. How many ',[true], ['Yes','No']],
          '_5': ['E. How many female ',[true], ['Yes','No']],
          '_6': ['F. How many deaths of other dairy animals ',[true], ['Yes','No']],

        },{
          'sec':'sec_30',
          'status':this.variables['active'], //means section is active
          'title': '30. Identification and record keeping',
          'no' : '30',
          '_1': ['A. How are your adult cattle identified',[true],
                ['Select','Tag','Brand','Both(Tag + Brand)','know by name (and no tag/ brand)',
                'No method of ID','Other']], 
          '_2': ['B. Do you keep records for your cattle? ',[true], ['Yes','No']],
          '_3': ['C. Do you keep records for your farm business accounts',[true], ['Yes','No']],      
        },{
          'sec':'sec_31',
          'status':this.variables['active'], //means section is active
          'title': '31. Animal Health - Disease prevention and control',
          'no' : '31',
          '_1': ['A. Are your animals vaccinated ?',[true],['Yes','No']], 
               
          '_2': ['B. Which diseases? ',[true], ['Anthrax','blackleg','Foot and Mouth Disease','Haemorrhagic Septicaemia (HS)',
                  'Lumpy skin Disease','Other']],
          '_3': ['C. Have your animals been tested against any disease within the last year? ',[true], ['Yes','No']], 
          '_4': ['D. Which disease',[true], ['Brucellosis','Tuberculosis','Other']],      
        },{
          'sec':'sec_32',
          'status':this.variables['active'], //means section is active
          'title': '32. Which service providers do you have a relationship with?',
          'no' : '32',
          '_1': ['Animal Health serivce providers',[true],
                ['Government vet','Private vet','CAHW','AI technician','Other',]], 
          '_2': ['Animal Health input suppliers',[true],
                ['Vet Drug company',]],   
          '_3': ['Farm input suppliers',[true],
                ['Fertiliser','Seeds','Equipment supply(Specify)','Equipment maintenance']], 
          '_4': ['D. Others',[true], []],                 
        },{
          'sec':'sec_33',
          'status':this.variables['active'], //means section is active
          'title': '33. Training, experiance and service provision in animal health/ animal production',
          'no' : '33',
          '_1': [
                  [
                    'A. Has anyone in your household received any animal health / animal production training ? ',
                    [
                      ['a. AI Technician',['Training Provided By','ZDTP','MFL','Heifer','Other']],
                      ['b. Community Animal Health Worker',['Training Provided By','ZDTP','MFL','Heifer','Other']],
                      ['c. Community Livestock Volunteer / Worker',['Training Provided By','ZDTP','MFL','Heifer','Other']],
                      ['d. Community facilitator',['Training Provided By','ZDTP','MFL','Heifer','Other']],
                      ['e. Agro-entreprenuer',['Training Provided By','ZDTP','MFL','Heifer','Other']],
                      ['f. Other',['Training Provided By','ZDTP','MFL','Heifer','Other']],
                    ]
                ],[true],[]], 
          '_2': ['B. Does anyone in your household provide one or more of the following services? ',[true],[
                  'AI technician',
                  'CAHW',
                  'Community Livestock Volunteer / Worker',
                  'Community facilitator',
                  'Agro-enreprenuer',
                  'Other'
                ]], 
        },{
          'sec':'sec_34',
          'status':this.variables['active'], //means section is active
          'title': '34. Extension advice, training and skills - between (May  ${this.variables['year']} - April 2021)',
          'no' : '34',
          '_1': ['A. Have you received any farm extension advice or assistance from ZDTP,MFL or others in the last 12 Months ?',[true],['Yes','No']], 
          '_2': ['B. If yes, What advice or assitance did you receive?',[true],[
                {'topic':'Fodder Crop production ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Cattle nutrition ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Milk hygiense ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Animal health, Management, Husbandry ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Farm record keeping ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Cattle breeding/ reproduction ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Accounting/Financial /business management ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Other ','organisation':['Select Organisation','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
          ]], 
          '_3': ['C. Have you received any training in one, or more of the following topics in the last 12 Months (since May  ${this.variables['year']}). If yes, when and who provided the training ',
                  [true],['Yes','No']], 
          '_3_1': ['',[true],[
                {'topic':'Fodder Crop production ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Cattle nutrition ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Milk hygiense ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Animal health, Management, Husbandry ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Farm record keeping ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Cattle breeding/ reproduction ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Accounting/Financial /business management ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
                {'topic':'Other ','organisation':['Who delivered','ZDTP','MFL','Heifer','DAZ','Pamalat','Zammilk','Other']},
          ]],
          '_4': ['D. How are you applying the skills you have learnt, and what benefits have you seen?',[true],[
                {'topic':'Fodder Crop production '},
                {'topic':'Cattle nutrition '},
                {'topic':'Milk hygiense '},
                {'topic':'Animal health, Management, Husbandry '},
                {'topic':'Farm record keeping '},
                {'topic':'Cattle breeding/ reproduction '},
                {'topic':'Accounting/Financial /business management '},
                {'topic':'Other '},
          ]],
          '_5': ['E. Are there any dairy related topics you would like to receive more training/ information on?',[true],[
                'Fodder Crop production ',
                'Cattle nutrition ',
                'Milk hygiense ',
                'Animal health, Management, Husbandry ',
                'Farm record keeping (production, breeding, financial etc)',
                'Cattle breeding/ reproduction ',
                'Accounting/Financial /business management ',
                'Other ',
                'No training required'
          ]],    
        },
      ];
  }
}