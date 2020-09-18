//
//  Data.swift
//  Viraze
//
//  Created by Granwyn Tan on 15/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import Foundation

enum OptionChoice {
    case one
    case two
    case three
    case four
}

struct QuizQuestion {
    var question: String
    var choice1: String
    var choice2: String
    var choice3: String
    var choice4: String
    var correctChoice: OptionChoice
}

struct HazePage {
    var title: String
    var content: String
    var videoLink: String?
    var imageNames: [String]?
    var animationName: String?
    var animationFileType: String?
    var backgroundImageName: String
    var sources: [String]
    var sourcesName: [String]
}

struct HazeTableItemContent {
    var content: String
    var videoLink: String?
    var imageNames: [String]?
    var animationName: String?
    var animationFileType: String?
    var backgroundImageName: String?
}

struct HazeTableItem {
    var header: String
    var headerContents: HazeTableItemContent?
    var items: [String]?
    var itemContents: [HazeTableItemContent]?
}

struct HazeTable {
    var title: String
    var data: [HazeTableItem]
    var sources: [String]
    var sourcesName: [String]
}
var HazeQuestions = [
    QuizQuestion(question: "What is Haze?", choice1: "Soot particles, carbon dioxide and other toxic gases", choice2: "Water vapour mixed with air", choice3: "Air infused with dirt and soil", choice4: "High concentration of nitrogen in air", correctChoice: .one),
    QuizQuestion(question: "What is Haze in Singapore usually caused by?", choice1: "Burning of trees", choice2: "Fire accidents", choice3: "Burning of water", choice4: "Burning of homes", correctChoice: .one),
    QuizQuestion(question: "Where does haze in Singapore usually originate from?", choice1: "Forest fires in the Indonesian islands of Sumatra and Kalimantan", choice2: "Forest fires in the Malaysian states of Sarawak and Sabah", choice3: "Forest fires in the Indonesian islands of Sulawesi and Borneo", choice4: "Forest fires in the Singaporean islands of Singapore and Sentosa", correctChoice: .one),
    QuizQuestion(question: "What kind of cancer can Haze cause?", choice1: "Lung cancer", choice2: "Colon cancer", choice3: "Stomach cancer", choice4: "Leukaemia", correctChoice: .one),
    QuizQuestion(question: "Which is not a Haze tip in this app?", choice1: "Drink water", choice2: "Drink bubble tea", choice3: "Protect your eyes", choice4: "Wear a mask", correctChoice: .two),
    QuizQuestion(question: "What was the peak PSI level in 2013?", choice1: "301", choice2: "401", choice3: "501", choice4: "601", correctChoice: .two),
    QuizQuestion(question: "Which provides a measure of internal pollution protection?", choice1: "Vitamin B", choice2: "Vitamin C", choice3: "Vitamin D", choice4: "Vitamin K", correctChoice: .two),
    QuizQuestion(question: "What is PSI?", choice1: "Polluted Standards Index", choice2: "Pollutant Standard Index", choice3: "Particulate Standard Index", choice4: "Polluted Sky Index", correctChoice: .two),
    QuizQuestion(question: "Is there a cure for Haze?", choice1: "Yes, medicine will cure haze", choice2: "If we stop burning trees, there will be no haze", choice3: "No, haze is not a disease and it cannot be cured", choice4: "None of the above", correctChoice: .three),
    QuizQuestion(question: "When was the worst outbreak in the 1990s?", choice1: "1993", choice2: "1995", choice3: "1997", choice4: "1999", correctChoice: .three),
    QuizQuestion(question: "Who is most at risk for Haze?", choice1: "Those who are hearing impaired", choice2: "Those who are visually Impaired", choice3: "Those with chronic heart or lung disease", choice4: "Those with chronic constipation", correctChoice: .three),
    QuizQuestion(question: "Why are haze particles PM 2.5?", choice1: "There are at least 2.5 particles in each cubic centimetre of Haze", choice2: "The method of detection of Haze particles is version 2.5", choice3: "Haze particles are 2.5 microns or smaller", choice4: "Haze particles usually remain in the air for 2.5 seconds before vaporising", correctChoice: .three),
    QuizQuestion(question: "Why is the burning smell worse at night?", choice1: "At night, the winds are weaker so the air pollutants are not dispersed as quickly as in the day", choice2: "Cooler temperatures at night also restrict air pollutants from dispersing upwards.", choice3: "The smell will usually dissipate in the day when the winds pick up speed", choice4: "All of the above", correctChoice: .four),
    QuizQuestion(question: "Which are effects of wearing a N95 Mask", choice1: "Discomfort in breathing", choice2: "Tiredness", choice3: "Headache", choice4: "All of the above", correctChoice: .four),
    QuizQuestion(question: "What are some practical tips for households to reduce exposure to haze particles at home?", choice1: "Close doors and windows", choice2: "Stay indoors", choice3: "Reduce physical activities", choice4: "All of the above", correctChoice: .four),
    QuizQuestion(question: "When is the haze season in Singapore usually?", choice1: "April", choice2: "May", choice3: "June", choice4: "July", correctChoice: .four),
    QuizQuestion(question: "Which of the following are signs of haze?", choice1: "Breathing difficulty", choice2: "Burning Smell", choice3: "Eye irritation", choice4: "All of the above", correctChoice: .four),
    QuizQuestion(question: "What to do during haze?", choice1: "Stay at home", choice2: "Wear a mask outside", choice3: "Drink water", choice4: "All of the above", correctChoice: .four),
    QuizQuestion(question: "Where can one get information on Haze in Singapore?", choice1: "Haze.gov.sg", choice2: "NEA’s myENV app", choice3: "NEA's Twitter and Facebook page", choice4: "All of the above", correctChoice: .four),
    QuizQuestion(question: "In what way is haze harmful?", choice1: "Harmful particles from the haze can enter your lungs and damage your body", choice2: "Dust particles can irritate and damage your eyes", choice3: "Haze may cause cough and throat infections", choice4: "All of the above", correctChoice: .four),
    QuizQuestion(question: "Which PSI level is 'Moderate'?", choice1: "0-50", choice2: "51-100", choice3: "100-200", choice4: "above 300", correctChoice: .one),
    QuizQuestion(question: "Which PSI level is 'Unhealthy'?", choice1: "0-50", choice2: "51-100", choice3: "100-200", choice4: "above 300", correctChoice: .two),
    QuizQuestion(question: "Which PSI level is 'Very unhealthy'?", choice1: "0-50", choice2: "51-100", choice3: "100-200", choice4: "above 300", correctChoice: .three),
    QuizQuestion(question: "Which PSI level is 'Hazardous'?", choice1: "0-50", choice2: "51-100", choice3: "100-200", choice4: "above 300", correctChoice: .four)
]

var Haze = [
    HazePage(title: "Definition", content: "Haze is traditionally an atmospheric phenomenon in which dust, smoke, and other dry particulates obscure the clarity of the sky.\nThe World Meteorological Organization manual of codes includes a classification of horizontal obscuration into categories of fog, ice fog, steam fog, mist, haze, smoke, volcanic ash, dust, sand, and snow.\nSources for haze particles include farming (ploughing in dry weather), traffic, industry, and wildfires.\n\n[According to Wikipedia]\n\n\nHaze is an air-borne mixture of pollutants that includes soot particles, carbon dioxide and other toxic gases.\nHaze pollution affects several Southeast Asian countries on a regular basis, notably Indonesia, Malaysia, Singapore and Brunei, and to a lesser extent Thailand, Vietnam and the Philippines.\nThe condition is largely caused by the burning of large tracts of forested land in Indonesia. The haze usually occurs during the southwest monsoon season between June and September, and becomes more severe during periods of dry weather.\n\n[According to NLB]", videoLink: "https://www.youtube.com/embed/uX78rPrcwgw", backgroundImageName: "hazeimage2", sources: ["https://eresources.nlb.gov.sg/infopedia/articles/SIP_2013-08-30_185150.html","https://en.wikipedia.org/wiki/Haze"], sourcesName: ["NLB", "Wikipedia"]),
    HazePage(title: "Pollutant Standard Index", content: "In Singapore, haze levels are measured using the Pollutant Standard Index (PSI). This index was developed by the United States Environmental Protection Agency to measure the daily levels of air pollution. PSI is computed based on a 24-hour average reading of the concentration levels of pollutants.\nSingapore’s air quality is monitored through a network of 15 air-monitoring stations using a telemetric air quality monitoring and management system. This system measures air pollutants such as sulphur dioxide, oxides of nitrogen, ozone, carbon monoxide, and particulate matter such as soot and dust particles. The PSI then converts the measured pollutant concentration into a number on a scale of 0 to 500.\nThe PSI values indicate the air quality and are generally divided into five main categories: good (PSI 0–50), moderate (PSI 51–100), unhealthy (PSI 101–200), very unhealthy (PSI 201–300) and hazardous (PSI 300 and above).\n\n[According to NLB]", imageNames: ["hazePSITable", "hazePSITable2", "hazePSITable3"], backgroundImageName: "hazeimage4", sources: ["https://eresources.nlb.gov.sg/infopedia/articles/SIP_2013-08-30_185150.html", "https://www.healthhub.sg/live-healthy/1079/how-to-protect-yourself-against-haze"], sourcesName: ["NLB", "HealthHub (MOH)"]),
    HazePage(title: "Causes", content: "Forest fires in Sumatra, Indonesia, are the main cause of the haze in Singapore. Many farmers in Indonesia practice shifting agriculture, which is a traditional farming method that involves clearing tracts of forested land for cultivation using the slash-and burn method. This practice has intensified in recent decades as large-scale burning is carried out to prepare land for the planting of commercial crops such as oil palm.\n\n[According to NLB]\n\n\nAccording to Indonesia's national disaster agency, there were 328,724 hectares of land burnt this year from January to August alone.\nAmong the most affected regions were Central, West and South Kalimantan, Riau, Jambi and South Sumatra.\nBut Indonesia's not the only culprit. There have also been cases of open burning in neighbouring Malaysia, though it pales in comparison to Indonesia.\nAs of 14 September, there were 10 hotspots in the Malaysian states of Sabah and Sarawak, compared to 627 in Kalimantan, according to the ASEAN specialised meteorological centre.\nThe burning usually peaks from July to October during Indonesia's dry season.\nMany farmers take advantage of the conditions to clear vegetation for palm oil, pulp and paper plantations using the slash-and-burn method.\nThey often spin out of control and spread into protected forested areas.\nThe problem has accelerated in recent years as more land has been cleared for expanding plantations for the lucrative palm oil trade.\nThe burnt land also becomes drier, which makes it more likely to catch fire the next time there are slash-and-burn clearings.\n\n[According to BBC]", videoLink: "https://www.youtube.com/embed/xOhz2w9VorI", backgroundImageName: "hazeimage6", sources: ["https://eresources.nlb.gov.sg/infopedia/articles/SIP_2013-08-30_185150.html", "https://www.bbc.com/news/world-asia-34265922"], sourcesName: ["NLB", "BBC"])
]

var HazeTableArray = [
    HazeTable(
        title: "History",
        data: [
            HazeTableItem(
                header: "Haze outbreaks affecting Singapore (1970s–2000s)",
                headerContents: HazeTableItemContent(
                    content: "The haze caused by forest fires in the Indonesian islands of Sumatra and Kalimantan have long affected neighbouring countries. One of the worst haze outbreaks in Singapore occurred in 1972. Visibility was as low as 1 to 2 km across parts of the island due to the thickness and persistence of the haze during the first two weeks of October that year. The cause of the haze was forest fires started by shifting cultivators in Palembang and South Kalimantan, Indonesia. The hazy conditions eased by mid-October due to a change in wind direction and the onset of rains in the originating areas.\n\nThere were sporadic reports of haze over Singapore in the 1980s. During that period, the haze was generally caused by dry weather conditions that increased the amount of dust in the air, occasional bushfires in Singapore and forest fires in Indonesia.\n\nDuring the 1990s, one of the worst haze outbreaks occurred in 1997. The outbreak was the result of raging fires in Indonesia caused by the large-scale burning of forested land. The fires that year were more severe due to the dry weather conditions caused by the El Niño phenomenon. The hazy conditions lasted for around two months and attracted much attention from the news media, government, businesses and general public. Between August and October that year, the island experienced 14 days when the PSI was in the unhealthy range. As a result, more Singaporeans were affected by respiratory and haze-related ailments, and the tourism industry was severely affected. Experts estimated the economic loss caused by the haze to be between S$97.5 million and S$110.5 million.\n\nIn September 2006, Singapore again experienced serious haze pollution. Like in 1997, the haze was caused by widespread forest fires in Indonesia that were exacerbated by the El Niño conditions. The PSI reading peaked at 128 on 7 October that year. Conditions returned to normal in mid-November with the onset of the monsoon rains.\n\n[According to NLB]",
                    videoLink: "https://www.youtube.com/embed/xOhz2w9VorI"
                )
            ),
            HazeTableItem(
                header: "2013 haze outbreak",
                headerContents: HazeTableItemContent(
                    content: "The 2013 haze outbreak was one of the most serious haze episodes to affect Singapore in the past 16 years. It was the first time that the PSI level reached the hazardous range, with the highest PSI reading of 401 recorded on 21 June 2013. At the peak of the outbreak, the general public was advised by the authorities to minimise outdoor activities and to wear N95 masks if they needed to engage in outdoor activities.\nLike the previous haze episodes, the cause of the 2013 haze outbreak was due to the widespread burning of forested land in Indonesia. The severity of haze this time was attributed to the massive burning of land carried out by palm oil companies. The Indonesian authorities claimed that some of these companies were owned by Singaporean and Malaysian investors. In response to such claims, the Singapore government warned that it would take action against any Singapore-linked company found to be involved in the illegal burning activities. The Singapore Manufacturing Federation (SMF) urged its members to boycott the firms involved, while the Consumers Association of Singapore (CASE) criticised the companies responsible for such activities.\n\nDomestic action against the haze\nIn September 1994, the Haze Task Force was formed to help coordinate the Singapore government’s efforts against the haze. As of June 2013, the Task Force comprises representatives from government agencies. The Task Force meets yearly to prepare for the annual dry season (usually lasting from June to September), which often coincides with cases of haze pollution over Singapore. In 2013, the aims of the task force were to protect public health and safety, work with Indonesia to curb the burning of forested land, and maintain social and economic resilience. In June 2013, in response to the severe haze conditions, the government set up an Inter-Ministerial Committee chaired by Minister for Defence Ng Eng Hen to oversee the overall national efforts against the haze.\nAt the height of the outbreak, various government ministries, including the Ministry of Education, Ministry of Health and Ministry of Defence, issued health advisories urging the public to monitor their health and limit outdoor activities. The government’s stockpile of N95 masks was also released and distributed to various retail outlets. The masks were distributed free to low-income families. Medical health subsidies were also granted to vulnerable groups such as the elderly and young children.\n\n[According to NLB]",
                    videoLink: "https://www.youtube.com/embed/JFtvPVJQsxk")
            ),
            HazeTableItem(
                header: "Regional action against the haze",
                headerContents: HazeTableItemContent(
                    content: "Since the 1980s, some regional efforts have been made to control the forest fires in Indonesia. In light of the serious haze outbreak in 1997, the Association of Southeast Asian Nations (ASEAN) strengthened the 1995 ASEAN Co-operation Plan on Transboundary Pollution and developed it into the Regional Haze Action Plan. The objectives of the plan were to prevent forest fires through better management policies and enforcement, establishing mechanisms to monitor land and forest fires, and strengthening firefighting capacity.\n\nSingapore adopted a monitoring role in the plan and has been providing satellite pictures and coordinates of fire hotspots to Indonesian authorities since 1997. In addition, Singapore has also conducted training courses on the health effects of haze pollution, air quality monitoring and GPS satellite information interpretation for Indonesian officials. In 2006, Singapore offered the Indonesia government an assistance package that included an aircraft for cloud-seeding operations, visuals to help identify fire locations and a contingent of firefighters, but the offer was not taken up.\n\nAt an emergency meeting convened by Indonesia in June 2013, Singapore offered a similar assistance package, which included an aircraft for cloud seeding operations as well as high resolution satellite pictures and hotspot coordinates. The Indonesia government considered the offer but eventually decided not to accept assistance from Singapore.\n\n[According to NLB]",
                    imageNames: ["Viraze (Haze Timeline)"]
                )
            )
        ],
        sources: ["https://eresources.nlb.gov.sg/infopedia/articles/SIP_2013-08-30_185150.html", "https://haze.asean.org/asean-agreement-on-transboundary-haze-pollution/"],
        sourcesName: ["NLB", "ASEAN Haze Action Online"]
    ),
    HazeTable(
        title: "Impacts",
        data: [
            HazeTableItem(
                header: "What are the key air pollutants of concern?",
                headerContents: HazeTableItemContent(
                    content: "The key air pollutant of concern during the haze period is particulate matter (PM). Short term exposure (i.e. continuous exposure to unhealthy daily average Pollutant Standards Index (PSI) levels over a period of a few days) to these air pollutants can cause respiratory symptoms and aggravate existing heart or lung disease.\n\nExposure to particulate matter may also cause irritation of the eyes, nose and throat in healthy individuals.", imageNames: ["hazecontentimage1"]
                )
            ),
            HazeTableItem(
                header: "What is the short-term effect of the haze on my health?",
                headerContents: HazeTableItemContent(
                    content: "Among healthy individuals, short term exposure (i.e. continuous exposure to unhealthy daily average PSI levels over a period of a few days) to high levels of haze particles may cause irritation of the eyes, nose, and throat in healthy individuals. Such irritation resolves on its own in most cases.\n\nHaze particles can sometimes affect the heart and lungs, especially in people who already have chronic heart or lung disease e.g. asthma, chronic obstructive pulmonary disease (COPD), or heart failure.\n\nThere may be up to one to three days of time between exposure to haze and health effects/symptoms.",
                    imageNames: ["hazecontentimage2"]
                )
            ),
            HazeTableItem(
                header: "What are the long-term effects of the haze?",
                headerContents: HazeTableItemContent(
                    content: "Singapore is not affected by the haze throughout the year. Any exposure is short-term in nature (i.e. continuous exposure to unhealthy daily average PSI levels over a period of a few days) and such exposure may vary from year to year. As international studies are based on long term exposure to air pollution, there is little robust data on the longer-term effects of episodic short-term exposures to haze like the pattern seen in Singapore.\n\nStudies have shown that persons living overseas with continuous exposure over several years to high ambient pollution from fine particles (i.e. particulate matter 2.5 (PM2.5); particles smaller than 2.5 micrometres), may have a higher risk of (i) cardiovascular effects, such as heart attacks, (ii) reduced lung development, as well as (iii) the development of chronic respiratory diseases, such as asthma, in children.",
                    imageNames: ["hazecontentimage3"]
                )
            ),
            HazeTableItem(
                header: "How is the air quality forecasted? Why is the health advisory based on 24-hour PSI forecast?",
                headerContents: HazeTableItemContent(
                    content: "During haze episodes, the National Environment Agency (NEA) will provide an air quality forecast for the next 24 hours. NEA will look at all relevant factors, including weather conditions, in determining this forward projection.",
                    imageNames: ["hazecontentimage4"]
                )
            ),
            HazeTableItem(
                header: "Which groups of people are more sensitive to haze?",
                headerContents: HazeTableItemContent(
                    content: "In general, children, elderly, and people with chronic lung disease or heart disease are more sensitive to the health effects of haze, and should adopt the preventive measures in the MOH health advisory when air quality is poor. Individuals are advised to consult their doctor should they develop breathing difficulties. In addition, it is advised that pregnant women reduce exposure to haze for the health of their unborn baby.",
                    imageNames: ["hazecontentimage5"]
                )
            ),
            HazeTableItem(
                header: "What is MOH’s advice to the public?",
                headerContents: HazeTableItemContent(
                    content: "The public is recommended to adhere to the MOH haze health advisory. In most cases, it is still safe to carry on with outdoor activities. However, do drink plenty of water to stay well hydrated.  Individuals with existing chronic heart and lung conditions should ensure that your medications are on hand and readily available.\nIndividuals with existing chronic heart and lung conditions should ensure that your medications are on hand and readily available.\nEach individual’s reaction to pollutants may vary, and the amount of physical activity or exertion that can be performed differs according to your health status or physical capacity. Should you encounter symptoms or discomfort, please take additional measures to prevent further exposure.\nAlthough the general advice to the public when the forecasted air quality is good or moderate (PSI≤100) is to maintain normal activities, vulnerable persons, especially those with chronic heart and lung conditions who develop symptoms or feel unwell, should seek medical attention promptly.",
                    videoLink: "https://www.youtube.com/embed/R3vpkMWyt2w"
                )
            ),
            HazeTableItem(
                header: "How will the haze impact patients in nursing homes and subsidised wards with natural ventilation?",
                headerContents: HazeTableItemContent(
                    content: "The healthcare institutions will institute specific measures to manage particulate matter (PM) levels in indoor spaces, taking reference from NEA’s guidelines on indoor air quality. The healthcare institutions will also monitor patients closely, and ensure ample circulation of clean air indoors.",
                    imageNames: ["hazecontentimage6"]
                )
            )
        ],
        sources: ["https://www.healthhub.sg/live-healthy/327/impact_haze_on_health", "https://www.moh.gov.sg/docs/librariesprovider5/resources-statistics/haze-advisory_english-chinese.pdf"],
        sourcesName: ["HealthHub (MOH)", "MOH Haze Heath Advisory"]
    ),
    HazeTable(
        title: "Tips",
        data: [
            HazeTableItem(
                header: "Protect your throat",
                items: [
                    "Drink plenty of water",
                    "Stay indoors",
                    "Watch your health"
                ],
                itemContents: [
                    HazeTableItemContent(
                        content: "It’s best to carry a bottle of water with you everywhere, especially if you are always on the go. Drinking lots of water will help reduce throat irritation from the haze, and also protects your voice.\n\n(Source: Dr Valerie Tay, ear nose and throat consultant at Tan Tock Seng Hospital)",
                        imageNames: ["waterBottleImage"]
                    ),
                    HazeTableItemContent(
                        content: "It’s especially important to reduce outdoor physical activity when the PSI is in the unhealthy range (above PSI 100). Instead, exercise in the gym, perform resistance exercises at home with weights, or do high intensity circuit workouts indoors.\n\nWhen the PSI is in the very unhealthy range (above PSI 200), stay indoors as far as possible. You can also consider using an air filtration device to improve the air quality at home. If you have to spend prolonged periods of time outdoors, wear an N95 mask that has been properly fitted.\n\n(Source: Dr Valerie Tay, ear nose and throat consultant at Tan Tock Seng Hospital)",
                        imageNames: ["hazecontentimage7"]
                    ),
                    HazeTableItemContent(
                        content: "Those with pre-existing, chronic medical conditions such as allergic rhinitis, sinusitis, asthma or lung disease should take their medications regularly, and see their doctor if they are feeling unwell.\n\n(Source: Dr Valerie Tay, ear nose and throat consultant at Tan Tock Seng Hospital)",
                        imageNames: ["hazeHealth"]
                    ),
                ]
            ),
            HazeTableItem(
                header: "Protect your eyes",
                items: [
                    "Reduce exposure to the haze",
                    "Cut back on contacts",
                    "Hydrate your eyes",
                    "See a doctor if need be",
                    "Drink up"
                ],
                itemContents: [
                    HazeTableItemContent(
                        content: "Wearing goggles or broad-rimmed sunglasses help to physically reduce eye exposure to the haze. This minimises the chances of eye irritations.\n\n(Source: Dr Daphne Han, ophthalmologist at Mount Elizabeth Hospital)",
                        imageNames: ["hazecontentimage8"]
                    ),
                    HazeTableItemContent(
                        content: "Reducing contact lens wear is also helpful, as haze can worsen dry eyes. Contact lens users should also consider switching to glasses if eye irritation becomes significant.\n\n(Source: Dr Daphne Han, ophthalmologist at Mount Elizabeth Hospital)",
                        imageNames: ["hazeContacts"]
                    ),
                    HazeTableItemContent(
                        content: "Using preservative-free lubricating eye drops to moisturise and applying cold compress to the eyes can alleviate symptoms of dry and allergic eyes. If you’ve got eye irritations, try an over-the-counter eye drop that’s specifically formulated for eye allergies. These usually contain sodium cromoglycate, a medicinal ingredient that reduces the release of histamine that can cause inflammation of the eyes.  Sodium cromoglycate eye drops can be prescribed by doctors, but are also available without prescription.\n\n(Source: Dr Daphne Han, ophthalmologist at Mount Elizabeth Hospital)",
                        imageNames: ["hazeEyedrops"]
                    ),
                    HazeTableItemContent(
                        content: "In severe cases of eye irritation, prescription eye drops may be needed. It’s important to visit an ophthalmologist before starting on a treatment plan as some patients may require steroid eye drops, which could have side effects.\n\n(Source: Dr Daphne Han, ophthalmologist at Mount Elizabeth Hospital)",
                        imageNames: ["hazecontentimage9"]
                    ),
                    HazeTableItemContent(
                        content: "Keeping the body healthy and well-hydrated by drinking plenty of fluid can also improve dry eyes and overall well-being. For an added boost, you can consider taking omega-3 fish oil in a capsule form as well.\n\n(Source: Dr Daphne Han, ophthalmologist at Mount Elizabeth Hospital)",
                        imageNames: ["hazeHydration"]
                    )
                ]
            ),
            HazeTableItem(
                header: "Protect your skin",
                items: [
                    "Antioxidants are your BFF",
                    "Protect yourself from harmful UV rays"
                ],
                itemContents: [
                    HazeTableItemContent(
                        content: "Pick skincare products with antioxidants to protect your skin against free radical damage and reduce the harmful effects of the haze. Skin is also usually drier than usual, so choose a good moisturiser as well.\n\n(Source: Dr Gavin Ong, dermatologist at Gleneagles Hospital)",
                        imageNames: ["hazecontentimage10"]
                    ),
                    HazeTableItemContent(
                        content: "To prevent premature skin ageing, continue using a broad-spectrum sunscreen even though it’s hazy outside as UV rays can still shine through. Consider using sun-protective gear like hats and umbrellas too.\n\n(Source: Dr Gavin Ong, dermatologist at Gleneagles Hospital)",
                        imageNames: ["hazeUVRays"]
                    ),
                ]
            ),
            HazeTableItem(
                header: "6 ways to beat the haze",
                items: [
                    "Avoid exposure",
                    "Stay indoors and keep the air clean",
                    "Wear a mask",
                    "Alleviating the symptoms",
                    "Home and natural remedies",
                    "Change your diet"
                ],
                itemContents: [
                    HazeTableItemContent(
                        content: "Seems obvious, but this is the simplest form of dealing with the haze. The Mother Nature website has the following tips:\n\nAvoid exercising in the open. Aerobic activities make you breathe deeply, hence you suck in pollutants deep into your lungs.\n\nAvoid smoking. Other than exposing your lungs to the same toxins found in hazy conditions, smoking makes your lungs more sensitive to the effects of air pollutants.",
                        imageNames: ["hazeNewAvoidExposure"]
                    ),
                    HazeTableItemContent(
                        content: "Stay indoors as much as possible and keep the doors and windows closed.\n\nIf you have an air conditioner, switch it on and ensure the air filter is clean.\n\nThe use of suitable particulate air filters (air filters which remove solid particles from the air) within an enclosed area can also help.\n\n(Source: Ministry of Health FAQ)",
                        imageNames: ["hazecontentimage11"]
                    ),
                    HazeTableItemContent(
                        content: "The National Environmental Agency (NEA) advises those with existing heart or respiratory ailemnts, or those more susceptible to the effects of haze to wear a respiratory mask when outdoors.\n\nRespiratory masks, such as N95 masks, are designed to keep out fine particulate matter and hence protect the wearers from breathing in the smoke particles in the air. The mask should be changed when it gets soiled or distorted in shape.\n\nA note of caution: surgical masks and paper masks do not provide adequate protection from haze particles. Their main purpose is to prevent the spread of body fluids and do not filter out haze particles.\n\nRespirator masks are available in most pharmacies and SingHealth/NGH polyclinics.\n\n(Source: NEA website)",
                        imageNames: ["hazeMasks"]
                    ),
                    HazeTableItemContent(
                        content: "Haze often irritates the nose, throat, airways, skin and eyes. The common symptoms include sneezing, runny nose, dry throat, cough and eye irritation.\n\nAir passages:\nSymptoms like sneezing, runny nose, dry throat and cough can be relieved through simple cough tablets or mixtures available in pharmacies.\n\nEyes:\nApply a few drops of saline solution to act as natural tear supplements. This will help wash away haze compounds or dust particles that get into the eyes.\n\nLocal motherhood website Baby Centre says that some mothers use a few drops of breastmilk to wash out their babies' eyes in order to reduce irritation.",
                        imageNames: ["hazeSymptoms"]
                    ),
                    HazeTableItemContent(
                        content: "There are a number of DIY remedies that can be concocted easily to soothe the various ailments caused by the haze.\n\nThe air particles in the haze often cause irritation of the air passages and dry throat. Some of the more popular remedies listed on Natural Home Remedies and Buzzle websites include:\n\n - Inhaling steam from a pan filled with hot water mixed with aromatherapy oils. This is generally helpful for soothing dry throats.\n - Mix equal quantities of aloe vera juice and orange juice. Add one table spoon of honey and drink every morning to soothe the throat.\n - Mince a garlic clove and place it in a small bowl. Add two tablespoon of honey and cover the bowl with plastic wrap. Leave it overnight and take one table spoon of the mixture throughout the next day as needed. This is believed to help suppress bouts of coughing.\n - Add two tablespoon of apple cider vinegar in a glass of water and take a few swallows as needed. Vinegar dissolves the mucus in the throat and reduces inflammation.\n - Gargling with warm spinach juice is said to be a very good cough remedy.",
                        imageNames: ["hazeNaturalRemedies"]
                    ),
                    HazeTableItemContent(
                        content: "If the haze persists and you cannot avoid it completely, it may help to take certain nutrients that provide a measure of internal pollution protection. Consume:\n\nVitamin A\nFoods rich in vitamin A include liver, carrots, sweet potatos, mangoes and spinach.\nThese foods help protect your eyes, lungs and the oxygen-carrying capabilities of your bloodstream, and help shield the lungs from air pollution. Vitamin A is required for the health of the mucous membranes. The oxidizing chemicals in haze destroy the vitamin A stores in the lung tissue, thus decreasing the efficiency of the body's first line of defence against carcinogens.\n\nVitamin C and E\nA study conducted by Yale University researchers have found that vitamins C and E work together to keep lung tissue healthy. Daily supplements of both builds up levels of a protective protein that prevents enzymes released during inflammation from destroying the lung's elastic properties.\n\nSelenium\nResearchers say that selenium activates glutathione peroxidase, as important antioxidant enzyme that helps keep lung tissue elastic. Foods rich in selenium include grains, seeds and fish.\n\nDaily Recommended Nutrient Amount\nVitamin A: 5,000 international units\nBeta-carotene (Beta-carotene is converted into Vitamin A in the body): 25,000 international units\nVitamin C: 1,200 miligrams\nVitamin E: 600 international units\nSelenium: 50-200 micrograms\n\n\n* Selenium in doeses exceeding 100 micrograms daily can be toxic and should be taken only under medical supervision. These figures are only a guide. If in doubt, please ask your doctor.\n\nIn addition, avoid foods high in saturated fats. Saturated fat intake has been linked to a higher risk of developing lung cancer. Eat lots of salad greens and other raw vegetables and fresh fruits.",
                        imageNames: ["hazeDiet"]
                    )
                ]
            ),
        ],
        sources: ["https://www.shape.com.sg/health/health-tips-haze/", "https://www.asiaone.com/health/6-ways-beat-haze"],
        sourcesName: ["SHAPE", "AsiaOne"]
    )
]

struct Guideline {
    var guidelineName: String
    var guidelineLink: String
}

var Guidelines = [
    Guideline(guidelineName: "SportSG | Haze management at Sport Singapore", guidelineLink: "https://www.sportsingapore.gov.sg/sports-education/sports-safety/haze-management-at-sport-singapore"),
    Guideline(guidelineName: "Haze guidelines and advisory for work (Ministry of Manpower)", guidelineLink: "https://www.nea.gov.sg/our-services/pollution-control/air-pollution/managing-haze"),
    Guideline(guidelineName: "NEA | Managing Haze", guidelineLink: "https://www.nea.gov.sg/our-services/pollution-control/air-pollution/managing-haze"),
    Guideline(guidelineName: "NEA | Singapore Government Agencies Haze Mitigation Measures", guidelineLink: "https://www.nea.gov.sg/media/news/news/index/singapore-government-agencies-implement-measures-to-mitigate-impact-of-haze")
]

let hazeResources = ["MOH", "NEA"]
let hazeResourcesLinks = ["https://www.moh.gov.sg/resources-statistics/educational-resources/haze/faqs-on-haze-health-advisory", "https://www.nea.gov.sg/our-services/pollution-control/air-pollution/faqs"]

struct VirusTableItemContent {
    var description: String
    var videoLink: String?
    var imageName: String?
//    var backgroundImageName: String?
}

struct VirusTableItem {
    var header: String
    var headerContents: VirusTableItemContent
}

struct VirusTable {
    var title: String
    var data: [VirusTableItem]
    var sources: [String]
    var sourcesNames: [String]
}

var Virus = [
    VirusTable(
        title: "Definition",
        data: [
            VirusTableItem(
                header: "What is the coronavirus? / What are coronaviruses?",
                headerContents: VirusTableItemContent(
                    description: "Coronaviruses (CoV) are a large family of viruses which may cause illness illnesses ranging from the common cold to pneumonia (a more severe lung infection), in animals or humans. In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19.",
                    videoLink: "https://www.youtube.com/embed/5DGwOJXSxqg"
                )
            ),
            VirusTableItem(
                header: "What is COVID-19?",
                headerContents: VirusTableItemContent(
                    description: "COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019. COVID-19 is now a pandemic affecting many countries globally.",
                    videoLink: "https://www.youtube.com/embed/i0ZabxXmH4Y"
                )
            )
        ],
        sources: [
            "https://www.moh.gov.sg/covid-19/faqs",
            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/q-a-coronaviruses"
        ],
        sourcesNames: [
            "MOH",
            "WHO"
        ]
    ),
    VirusTable(
        title: "Symptoms",
        data: [
            VirusTableItem(
                header: "What are the symptoms of COVID-19?",
                headerContents: VirusTableItemContent(
                    description: "The symptoms of COVID-19 infection are similar to that of regular pneumonia. The most common or typical symptoms of COVID-19 are fever, dry cough, and tiredness, and shortness of breath. Other symptoms that are less common and may affect some patients include aches and pains, nasal congestion, headache, conjunctivitis, sore throat, diarrhea, loss of taste or smell or a rash on skin or discoloration of fingers or toes. These symptoms are usually mild and begin gradually. Some people become infected but only have very mild symptoms./n/nMost people (about 80%) recover from the disease without needing hospital treatment. Around 1 out of every 5 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart and lung problems, diabetes, or cancer, are at higher risk of developing serious illness. However, anyone can catch COVID-19 and become seriously ill. People of all ages who experience fever and/or cough associated with difficulty breathing/shortness of breath, chest pain/pressure, or loss of speech or movement should seek medical attention immediately. If possible, it is recommended to call the health care provider or facility first, so the patient can be directed to the right clinic./n/nMost common symptoms:/n - fever/n - dry cough/n - tiredness/n/nLess common symptoms:/n - aches and pains/n - sore throat/n - diarrhoea/n - conjunctivitis/n - headache/n - loss of taste or smell/n - a rash on skin, or discolouration of fingers or toes",
                    videoLink: "https://www.youtube.com/embed/U8r3oTVMtQ0"
                )
            ),
            VirusTableItem(
                header: "What should I do if I have COVID-19 symptoms and when should I seek medical care?",
                headerContents: VirusTableItemContent(
                    description: "If you have minor symptoms, such as a slight cough or a mild fever, there is generally no need to seek medical care. Stay at home, self-isolate and monitor your symptoms. Follow national guidance on self-isolation.\n\nHowever, if you live in an area with malaria or dengue fever it is important that you do not ignore symptoms of fever. Seek medical help. When you attend the health facility wear a mask if possible, keep at least 1 metre distance from other people and do not touch surfaces with your hands. If it is a child who is sick help the child stick to this advice.\n\nSeek immediate medical care if you have difficulty breathing or pain/pressure in the chest. If possible, call your health care provider in advance, so he/she can direct you to the right health facility.",
                    videoLink: "https://www.youtube.com/embed/OOJqHPfG7pA"
                )
            ),
            VirusTableItem(header: "How long is the incubation period? If somebody travels to cities with confirmed cases, how many days of no-symptoms after the travel, will he/she then be considered clean and disease-free?", headerContents: VirusTableItemContent(description: "Data from cases in China suggests that the incubation period is around 14 days.\n\nTherefore, travellers are advised to monitor their health closely for at least 2 weeks upon return to Singapore. You are advised to seek medical attention promptly if you feel unwell, and to also inform your doctor of your travel history.", videoLink: "https://www.youtube.com/embed/hZDX08RcPmg")),
            VirusTableItem(header: "I would like to seek medical attention as I have a cough and runny nose and have recently travelled to the countries with confirmed cases of COVID-19. Should I go to the GP or do I have to go to A&E?", headerContents: VirusTableItemContent(description: "If you have recently travelled overseas, and are feeling unwell with a fever, or respiratory symptoms (such as cough, runny nose), please seek medical attention promptly. You can go to any of the Public Health Preparedness Clinics (PHPCs), as well as polyclinics. You may look for a PHPC near you at www.phpc.gov.sg. All cases fulfilling the suspect case definition seen at various healthcare settings will be reported to MOH immediately and referred to hospitals for further assessment and treatment.", videoLink: "https://www.youtube.com/embed/U8r3oTVMtQ0")),
            VirusTableItem(
                header: "How do I get tested for COVID-19?  Will I have to pay for it?",
                headerContents: VirusTableItemContent(
                    description: "You will be tested for COVID-19 only if your doctor assesses that there is clinical need to do so, based on your health condition and travel/contact history. If it is deemed that there is the need for you to be tested, your doctor will be able to test you or refer you to a hospital for the test, and you will not be required to pay for the test. Please note that a negative test is possible during the virus incubation period, and does not exclude the possibility that infection is present.",
                    imageName: "coronavirus2"
                )
            ),
            VirusTableItem(
                header: "Can I send my employees/ students to the doctor to get tested at the end of the 14-day period so that they can be cleared to come back to work/return to school?",
                headerContents: VirusTableItemContent(
                    description: "It is not useful to send persons who do not have symptoms to the doctor/ hospital for testing. Such individuals will not be offered diagnostic testing, and will be asked to return home.",
                    imageName: "coronavirus3"
                )
            ),
            VirusTableItem(
                header: "Are discharged COVID-19 patients infectious?",
                headerContents: VirusTableItemContent(
                    description: "No. COVID-19 patients in Singapore are discharged only when fully recovered and no longer transmitting the virus.",
                    imageName: "coronavirus4"
                )
            ),
            VirusTableItem(
                header: "What are the Regional Screening Centres?",
                headerContents: VirusTableItemContent(
                    description: "The Regional Screening Centres (RSCs) are set up by the Health Promotion Board (HPB) to conduct testing for COVID-19. These centres are integral to the implementation of our national testing strategy, and play a critical role in keeping Singapore COVID-19 safe. Where possible, these RSCs will be located in places that are easily accessible to support the screening needs in the community. For example, RSCs have been set up at the Old Police Academy, The Float @ Marina Bay, the Bukit Gombak sport hall and Bishan sport hall. The RSCs are set up with proper infection control measures, and strict safe distancing requirements will be observed to protect individuals and the community.",
                    imageName: "coronavirus5"
                )
            ),
            VirusTableItem(
                header: "Who can be tested at the Regional Screening Centres?",
                headerContents: VirusTableItemContent(
                    description: "The Regional Screening Centres support diagnostic testing in the community and active surveillance testing for targeted groups including frontline workers supporting COVID-19 operations and workers in the construction, marine and process sectors. The RSCs do not accept walk-in requests for screening. Individuals who are unwell or have medical concerns should consult their primary care doctors, and will be tested if necessary.",
                    imageName: "coronavirus6"
                )
            )
        ],
        sources: [
            "https://www.moh.gov.sg/covid-19/faqs",
            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/q-a-coronaviruses"
        ],
        sourcesNames: [
            "MOH",
            "WHO"
        ]
    ),
    VirusTable(
        title: "Transmission",
        data: [
            VirusTableItem(
                header: "How does COVID-19 spread?",
                headerContents: VirusTableItemContent(
                    description: "People can catch COVID-19 from others who have the virus. The disease spreads primarily from person to person through small respiratory droplets from the nose or mouth, which are expelled when an infected person with COVID-19 coughs, sneezes, exhales, speaks, talks or sings. These respiratory droplets, which are relatively heavy, and do not travel far and quickly sink to the ground, can reach the eyes, nose or mouth of a susceptible person directly or indirectly (via contaminated surfaces), resulting in infection. People can also catch COVID-19 if they breathe in these droplets from a person infected with the virus. This is why it is important to stay at least 1 meter) away from others. These droplets can land on objects and surfaces around the person such as tables, doorknobs and handrails. People can become infected by touching these objects or surfaces, then touching their eyes, nose or mouth. This is why it is important to wash your hands regularly with soap and water or clean with alcohol-based hand rub.\n\nAirborne transmission of the virus can occur in health care settings where aerosol generatiing procedures are performed. The role and extent of airborne transmission outside of health care settings is under further study. MOH will continue to monitor the evidence as it emerges.\n\nWHO is assessing ongoing research on the ways that COVID-19 is spread and will continue to share updated findings.",
                    videoLink: "https://www.youtube.com/embed/677pSwGauqs"
                )
            ),
            VirusTableItem(
                header: "Can COVID-19 be caught from a person who has no symptoms?",
                headerContents: VirusTableItemContent(
                    description: "COVID-19 is mainly spread through respiratory droplets expelled by someone who is coughing or has other symptoms such as fever or tiredness. Many people with COVID-19 experience only mild symptoms. This is particularly true in the early stages of the disease. It is possible to catch COVID-19 from someone who has just a mild cough and does not feel ill.\n\nSome reports have indicated that people with no symptoms can transmit the virus. It is not yet known how often it happens. WHO is assessing ongoing research on the topic and will continue to share updated findings.",
                    imageName: "coronavirus23"
                )
            ),
            VirusTableItem(
                header: "How can we protect others and ourselves if we don't know who is infected?",
                headerContents: VirusTableItemContent(
                    description: "Practicing hand and respiratory hygiene is important at ALL times and is the best way to protect others and yourself.\n\nWhen possible maintain at least a 1 meter distance between yourself and others. This is especially important if you are standing by someone who is coughing or sneezing.  Since some infected persons may not yet be exhibiting symptoms or their symptoms may be mild, maintaining a physical distance with everyone is a good idea if you are in an area where COVID-19 is circulating.\n\nTo reduce the risk of spread, members of public are advised to wear a mask when leaving home, observe good hand hygiene and safe distancing, and avoid crowded spaces if possible.\n\nCover the mouth and nose with a tissue when coughing or sneezing and use the inside of the elbow if no tissue is available. Practice proper hand hygiene after any cough or sneeze such as cleaning hands with hand sanitizer.",
                    videoLink: "https://www.youtube.com/embed/BtN-goy9VOY"
                )
            ),
            VirusTableItem(
                header: "What should I do if I have come in close contact with someone who has COVID-19?",
                headerContents: VirusTableItemContent(
                    description: "If you have been in close contact or proximity with someone with COVID-19, you may be infected.\n\nClose contact means that you live with or have been in settings of less than 1 metre from those who have the disease. In these cases, it is best to stay at home.\n\nHowever, if you live in an area with malaria or dengue fever it is important that you do not ignore symptoms of fever. Seek medical help. When you attend the health facility wear a mask if possible, keep at least 1 metre distant from other people and do not touch surfaces with your hands. If it is a child who is sick help the child stick to this advice.\n\nIf you do not live in an area with malaria or dengue fever please do the following:\n - If you become ill, even with very mild symptoms you must self-isolate\n - Even if you don’t think you have been exposed to COVID-19 but develop symptoms, then self-isolate and monitor yourself\n - You are more likely to infect others in the early stages of the disease when you just have mild symptoms, therefore early self-isolation is very important.\n - If you do not have symptoms, but have been exposed to an infected person, self-quarantine for 14 days.\n\nIf you have definitely had COVID-19 (confirmed by a test) self-isolate for 14 days even after symptoms have disappeared as a precautionary measure – it is not yet known exactly how long people remain infectious after they have recovered. Follow national advice on self-isolation.",
                    videoLink: "https://www.youtube.com/embed/8c_UJwLq8PI"
                )
            )
        ],
        sources: [
            "https://www.moh.gov.sg/covid-19/faqs",
            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/q-a-coronaviruses"
        ],
        sourcesNames: [
            "MOH",
            "WHO"
        ]
    ),
    VirusTable(
        title: "Masks and Personal Protective Equipment (PPE)",
        data: [
            VirusTableItem(
                header: "Why and when must I wear a mask?",
                headerContents: VirusTableItemContent(
                    description: "It is mandatory for all persons to wear a mask when leaving their homes.\n\nThe general public is advised to stay home and avoid going out. It is difficult for those who need to go out for work or to purchase necessities, to avoid contact completely, including with infected persons who have very mild symptoms or may not show any symptoms. The wearing of masks is therefore an important precaution we can all take.\n\nEveryone must wear a mask when outside of their homes. This applies on public transport, taxis, private hire cars, walking to or at markets, and also for permitted enterprise workers at all workplace premises, whether they are frontline staff (such as food handlers, cashiers and bus drivers) or performing back office functions (such as data entry personnel and payroll executives). Individuals may remove their mask while engaging in strenuous exercise outdoors (e.g. running/jogging), but they must put it back on after completing exercise. ",
                    imageName: "coronavirus22"
                )
            ),
            VirusTableItem(
                header: "What types of masks should we wear?",
                headerContents: VirusTableItemContent(
                    description: "For the general public, a mask that closely and completely covers the nose and mouth (i.e. without leaving a gap between the mask and the face) must be worn when persons go out of their homes./n/nPersons who have respiratory symptoms (such as cough, runny nose), and certain groups who are more vulnerable to or at risk of COVID-19 infection should wear surgical masks or reusable masks with better filtration capabilities. These include:/n1. Seniors aged 60 years old and above/n2. Persons with other concurrent medical conditions (such as diabetes, heart conditions)/n3. Persons interacting with (such as providing care to) someone who has respiratory symptoms/n/nMasks with better filtration capabilities are those indicated to have at least 95% bacterial filtration efficiency*. The recent reusable masks that the government had distributed (from May to June 2020) to all Singaporeans carry this specification./n/nThe following specific groups of persons may use a face shield, in place of masks:/na)     Children 12 years and below, who may have difficulty wearing and keeping face masks on for a prolonged period of time;/nb)     Persons who have health conditions that may result in breathing or other medical difficulties when a mask is worn for a prolonged period of time; and/nc)     Persons who are speaking to a group in a classroom or lecture-style setting, where they largely remain at the spot from which they are speaking, and are able to maintain a safe distance away from any other persons./n/nA face shield must be worn properly so that it covers the entire face, from the forehead to below the chin, wrapping around the sides of the face./n/nPlastic spit guards predominantly cover the mouth and are not considered as face shields or masks.Face coverings such as neck gaiters, bandannas, scarves or handkerchiefs are not considered as masks./n/nWe should conserve surgical masks for those who need them the most, i.e. our healthcare workers, given the current global shortage of surgical masks./n/n* Bacterial filtration efficiency is a measure of the degree of barrier protection provided by a material or fabric. This is often indicated on the packaging or product description of masks being sold.",
                    imageName: "coronavirus25"
                )
            ),
            VirusTableItem(
                header: "Why are only specific groups allowed to wear face shields instead of masks? A face shield is more comfortable, and allows me to breathe more easily. Can I use a face shield instead of a mask?",
                headerContents: VirusTableItemContent(
                    description: "While a face shield provides a barrier over the wearer’s face, its design typically leaves a gap between the face shield and the wearer’s face. Masks that closely and completely cover the nose and mouth do not have such gaps./nCOVID-19 is spread predominantly through droplets. With the re-opening of our economy and society, more activities and close contact amongst people, including on public transport, are expected. Masks will therefore be a default when persons need to leave their homes.",
                    imageName: "coronavirus1"
                )
            ),
            VirusTableItem(
                header: "In which settings will face shields be allowed in place of masks?",
                headerContents: VirusTableItemContent(
                    description: "In settings where persons who are speaking to a group in a classroom or lecture-style setting, face shields may be used in place of masks. Such persons should largely remain at the spot from which they are speaking and maintain a safe distance away from any other persons.",
                    imageName: "coronavirus9"
                )
            ),
            VirusTableItem(
                header: "Must I wear a mask throughout the day at work, for example, if I am at a work cubicle?",
                headerContents: VirusTableItemContent(
                    description: "Everyone should wear a mask when they are outside their homes. This includes while they are at the workplace./n/nHowever, if an individual is alone in his or her own office with the door closed, and no other person enters the room, the individual may remove his or her mask in the room. If the room door is opened or if there is any contact with people, a mask must be used.",
                    imageName: "coronavirus10"
                )
            ),
            VirusTableItem(
                header: "Do motorcyclists need to wear masks?",
                headerContents: VirusTableItemContent(
                    description: "Motorcyclists are not required to wear a mask while riding. Masks should be worn when not riding, as is the case for everyone else when they go outside their homes.",
                    imageName: "coronavirus11"
                )
            ),
            VirusTableItem(
                header: "Must I wear a mask even while exercising?",
                headerContents: VirusTableItemContent(
                    description: "Everyone must wear a mask when outside of their homes. Individuals may remove their mask while engaging in strenuous exercise outdoors (e.g. running/jogging), but they must put it back on after completing their exercise.",
                    imageName: "coronavirus12"
                )
            ),
            VirusTableItem(
                header: "What will happen if I do not wear a mask?",
                headerContents: VirusTableItemContent(
                    description: "First-time offenders will be issued composition offers of $300, and repeat offenders will face higher fines or prosecution in court for egregious cases.",
                    imageName: "coronavirus13"
                )
            ),
            VirusTableItem(
                header: "I can’t find a suitable mask for my child. What should I do?",
                headerContents: VirusTableItemContent(
                    description: "You can make adjustments to the reusable masks distributed by the Government to fit your child, or make your own mask out of fabric or other similar materials, with the purpose of covering your child’s nose and mouth to reduce transmission of droplets./n/nChildren 12 years and below may also use face shields in place of masks if they have difficulty wearing and keeping face masks on for a prolonged period of time.",
                    imageName: "faceshieldvirus"
                )
            ),
            VirusTableItem(
                header: "Must my infant also wear a mask?",
                headerContents: VirusTableItemContent(
                    description: "Mask-wearing is not recommended for young children below the age of two for child safety reasons./n/nMedical experts have also advised that some groups may have difficulties, including children with special needs and young children aged two and above, and we will exercise flexibility in enforcement for these groups.",
                    imageName: "coronavirus14"
                )
            ),
            VirusTableItem(
                header: "I tend to have shortness of breath and wearing a mask will make the problem worse. Can I be exempted?",
                headerContents: VirusTableItemContent(
                    description: "If you have underlying conditions, you may be more vulnerable to serious COVID-19 infection. You should stay at home as much as possible, and avoid going out unless necessary./n/nTo protect yourself and others, you are recommended to wear a mask when leaving the house./n/nFace shields could be used in situations where individuals have health conditions which may result in breathing or other medical difficulties when a mask is worn for a prolonged period of time. Safe distancing measures such as maintaining at least one metre distance from all persons must be observed.",
                    imageName: "coronavirus15"
                )
            ),
            VirusTableItem(
                header: "My child is four years old, and he keeps removing his mask. I keep telling him to put it on, but he cries and complains that it is hot and he cannot breathe. What should I do?",
                headerContents: VirusTableItemContent(
                    description: "To protect your child and others, it is recommended that he wears a mask when leaving the house. If there is difficulty wearing and keeping face masks on for a prolonged period of time, children 12 years and below may use face shields in place of masks./n/nMedical experts have advised that some groups may have difficulties wearing a mask, including children with special needs and young children aged two and above, and we will exercise flexibility in enforcement for these groups.",
                    imageName: "coronavirus16"
                )
            ),
            VirusTableItem(
                header: "Can I remove my mask to eat, drink, or take medication?",
                headerContents: VirusTableItemContent(
                    description: "Yes, you may do so, but must immediately put your mask back on after eating, drinking or taking medication. If eating outside your home, please ensure that safe distancing measures are strictly complied (e.g. maintain physical separation with others while eating) with.",
                    imageName: "removemask"
                )
            ),
            VirusTableItem(
                header: "Can I remove my mask to smoke outside?",
                headerContents: VirusTableItemContent(
                    description: "In view of the COVID-19 (Temporary Measures) (Control Order) Regulations 2020, all Designated Smoking Areas (DSAs) within the Orchard Road No Smoking Zone (ORNSZ) as well as smoking corners located beyond the ORNSZ have been closed. Everyone must wear a mask when outside of their homes. If you are out doing essential tasks, and smoke in a non-smoking prohibited area, you must immediately put your mask back on after smoking, just like what you must do after eating, drinking or cleaning your face. Please strictly comply with the safe distancing measures while smoking.",
                    imageName: "smokevirus"
                )
            ),
            VirusTableItem(
                header: "Do I have to keep my mask on at the gym and at fitness studios? How about at beaches and playgrounds?",
                headerContents: VirusTableItemContent(
                    description: "Masks are required to be worn when outside one’s own home. This includes all these venues. Masks should only be removed when engaging in strenuous activity, and then promptly put back on after.",
                    imageName: "maskoffvirus"
                )
            ),
            VirusTableItem(
                header: "Do I have to keep my mask on when dining-in at F&B outlets?",
                headerContents: VirusTableItemContent(
                    description: "Masks are required to be worn in F&B outlets. Diners should only take them off when eating or drinking.",
                    imageName: "coronavirus24"
                )
            ),
            VirusTableItem(
                header: "Do I have to wear a mask when visiting other peoples’ homes?",
                headerContents: VirusTableItemContent(
                    description: "Masks are required to be worn when outside one’s own home. Household visitors are strongly encouraged to observe safe management principles when visiting other peoples’ homes. This includes wearing a mask, keeping a safe distance of at least one metre from others, minimising physical contact and washing our hands regularly. Do not visit if you are unwell.",
                    imageName: "coronavirus17"
                )
            )
        ],
        sources: [
            "https://www.moh.gov.sg/covid-19/faqs"
        ],
        sourcesNames: [
            "MOH"
        ]
    ),
    VirusTable(
        title: "Confirmed Cases and Contact Tracing",
        data: [
            VirusTableItem(
                header: "Can MOH provide more information about the whereabouts of the confirmed cases? What if I suspect that I have been at the same place as the confirmed cases? What should I do?",
                headerContents: VirusTableItemContent(
                    description: "Contact tracing will be conducted to identify close contacts of the confirmed cases.\n\nIf you are deemed to be a close contact of a confirmed case, you will be contacted by MOH officials and advised on the measures that you should take. Close contacts are defined as: (i) anyone who had provided care for or has had close physical contact with the patient; (ii) anyone who had stayed at the same place as a confirmed case. The health status of all close contacts will be monitored closely for 14 days from their last exposure to the patient. Those who develop symptoms will be brought to the hospital via a dedicated ambulance for further assessment.\n\nTransient contacts can be described as anyone who had interacted with the confirmed case for short periods of time, such as passing by each other in the corridor or being on the same public transport or in the same public spaces. The risk of infection from transient contact is assessed to be low.",
                    imageName: "coronavirus18"
                )
            ),
            VirusTableItem(
                header: "My friend sent me a message to avoid a certain location as there has been a suspected case reported. Should I be concerned?",
                headerContents: VirusTableItemContent(
                    description: "There is no need to avoid places where suspected or confirmed cases of COVID-19 have been. The risk of infection from transient contact, such as in public places, is low. There is also currently no evidence of widespread sustained community transmission. Members of public are advised to adopt good personal hygiene practices, such as washing your hands frequently with soap.\n\nNEA has been liaising closely with, and providing support to, residents and owners of premises, to ensure that the cleaning and disinfection of areas is done in accordance with NEA’s guidelines. For places exposed to confirmed cases, NEA has also been giving advice and supervising the cleaning and disinfection works. In addition, NEA has issued sanitation and hygiene advisories to premises and facilities with high public access like hotels, commercial buildings and F&B outlets, including hawker centres.",
                    imageName: "coronavirus19"
                )
            ),
            VirusTableItem(
                header: "I stay near a Government Quarantine Facility. Should I be concerned?",
                headerContents: VirusTableItemContent(
                    description: "Persons served with Quarantine Orders (QO) are required to stay in their designated location at all times within the allocated quarantine period. They will not be allowed to use common facilities within the Government Quarantine Facility (GQF). There will also be no visitors to the QO persons, and food/ necessary supplies will be delivered to them.\n\nThere are also security measures in place to ensure compliance to GQF guidelines. Thus, persons served with QO will not able to mingle with the larger population. All staff working at the GQF are also provided with personal protective equipment (PPE). GQFs also undergo rigorous cleansing and hygiene regimes in accordance with MOH and NEA guidelines.",
                    imageName: "quarantine"
                )
            ),
            VirusTableItem(
                header: "What is a Community Isolation Facility (CIF)? How is this different from the Government Quarantine Facility?",
                headerContents: VirusTableItemContent(
                    description: "The Community Isolation Facility is modelled after the existing Government Quarantine Facilities, and is managed with a high level of infection control. Patients who are clinically fit for discharge but are still COVID-19 positive will be isolated and safely cared for in this facility until they are tested negative for COVID-19.",
                    imageName: "https://www.youtube.com/embed/nOa8wIhQdzo"
                )
            )
        ],
        sources: [
            "https://www.moh.gov.sg/covid-19/faqs"
        ],
        sourcesNames: [
            "MOH"
        ]
    ),
    VirusTable(
        title: "Leave of Absence (LOA), Stay-Home Notice (SHN) and Quarantine Order (QO)",
        data: [
            VirusTableItem(
                header: "What is the difference between being issued a Quarantine Order (QO), being under a Leave of Absence (LOA) and being under a Stay-Home Notice (SHN)?",
                headerContents: VirusTableItemContent(
                    description: "A QO is a legal order issued to individuals under the Infectious Diseases Act and thus has legal force with severe penalties for non-compliance. A QO is issued to quarantine or isolate an individual who is, or is suspected to be, a carrier of an infectious disease or a contact of a person confirmed to have an infectious disease. This is with the aim of limiting the spread of the virus in the community. Quarantine usually occurs in the home but can also be served in dedicated Government Quarantine Facilities (GQFs) or hospitals, should the individual not have suitable accommodation in Singapore./nA Leave of Absence (LOA) is a precautionary measure. We urge those who are on LOA to be socially responsible and comply with the LOA, to prevent possible transmission of infections. Persons on LOA should remain in their residences as much as possible, minimise having visitors and maintain good records of persons with whom they come into close contact. Persons on LOA may leave their residences for daily necessities or to attend important matters, but they must minimise time spent in public spaces and contact with others./nA Stay-Home Notice (SHN) is stricter than the LOA regime. Those placed on SHN will have to remain in their place of residence at all times, and should not invite visitors to their residence.",
                    videoLink: "https://www.youtube.com/embed/6cgI5bfHpQ4"
                )
            ),
            VirusTableItem(
                header: "I am employed. Does being under a Quarantine Order (QO) utilise my quota for medical leave or hospitalisation leave?",
                headerContents: VirusTableItemContent(
                    description: "Employees who are served a Quarantine Order (QO) will be deemed to be on paid sick leave. The period of absence from work would be treated as paid hospitalisation leave, as part of the employees’ hospitalisation leave eligibility under their employment contracts or agreements.",
                    videoLink: "https://www.youtube.com/embed/1APwq1df6Mw"
                )
            ),
            VirusTableItem(
                header: "What must I do when I am being quarantined? How will it affect my household members?",
                headerContents: VirusTableItemContent(
                    description: "If you are issued a quarantine order and live with other household members who are not issued quarantine orders, you will be conveyed to a Government Quarantine Facility (GQF) to serve your quarantine period\n\nThis is because those under quarantine are not supposed to come into contact with others in order to avoid the possibility of the spread of virus through person-to-person contact. Hence, those under quarantine will need to be isolated from and cannot physically interact with others living in the same premises.\n\nThere may be exceptional circumstances in which you may serve your quarantine at home with other household members who are not issued quarantine orders e.g. if you require a caregiver.",
                    imageName: "quarantine3"
                )
            ),
            VirusTableItem(
                header: "How will those who are under quarantine orders at home be monitored?",
                headerContents: VirusTableItemContent(
                    description: "If individual are issued quarantine orders together with all other household members, they will serve their quarantine orders at home, unless the premises are deemed unsuitable.\n\nIndividuals under quarantine will be monitored by video calls or the QO App (HOMER) at least three times a day.\n\nSpot checks will be carried out to ensure that they strictly adhere to the conditions under the Isolation / Quarantine Order (QO) during the period specified. If they are found to be non-compliant, the Director of Medical Services may require them to wear an electronic tag or order that they be detained and isolated in a hospital or in any other suitable place. It is an offence if they do not comply with the conditions listed in accordance with the QO.",
                    imageName: "quarantine4"
                )
            ),
            VirusTableItem(
                header: "If I need to go out to attend to urgent matters, what should I do? What will happen if I break quarantine?",
                headerContents: VirusTableItemContent(
                    description: "Persons under quarantine must not leave their designated location for any reason. Should they require assistance for daily needs, they should arrange with their relatives / friends to purchase groceries and assist in their daily needs whenever necessary. If they urgently need to leave their place of isolation / their home for matters needing personal attention which cannot be postponed, they must first seek the permission of the Quarantine Order (QO) Agent.\n\nSpot checks will be carried out to ensure that they strictly adhere to the conditions under the Isolation / Quarantine Order during the period specified. If they are found to be non-compliant, the Director of Medical Services may require them to wear an electronic tag or order that they be detained and isolated in a hospital or in any other suitable place. It is an offence if they do not comply with the conditions listed in accordance with the QO.",
                    videoLink: "https://www.youtube.com/embed/Qg8sRsERlwU"
                )
            ),
            VirusTableItem(
                header: "I have been in recent contact with someone who has been issued a Quarantine Order (QO). What should I do?",
                headerContents: VirusTableItemContent(
                    description: "Persons issued with a Quarantine Order are individuals assessed to have had close contact with a confirmed case, and they are generally well and have no symptoms.\n\nWe would advise you to monitor your health closely. If you have fever, cough or runny nose, wear a mask and seek medical attention promptly. Call the clinic ahead of your visit and inform the doctor of your symptoms as well as your travel history, if any.",
                    videoLink: "https://www.youtube.com/embed/BvArUcf-1V4"
                )
            )
        ],
        sources: [
            "https://www.moh.gov.sg/covid-19/faqs"
        ],
        sourcesNames: [
            "MOH"
        ]
    )
]

struct thing {
    var question: String
    var answer: String
}

let virusmore = [
    thing(question: "What are the organs most affected by COVID‐19?", answer: "COVID‐19 can affect the upper respiratory tract (sinuses, nose, and throat) and the lower respiratory tract (windpipe and lungs)."),
    thing(question: "Is coronavirus a bacteria or virus?", answer: "The new coronavirus is a respiratory virus which spreads primarily through droplets generated when an infected person coughs or sneezes, or through droplets of saliva or discharge from the nose. To protect yourself, clean your hands frequently with an alcohol-based hand rub or wash them with soap and water."),
    thing(question: "Is the coronavirus disease deadly?", answer: "The situation is evolving and many characteristics of the virus and how it may affect people are still unclear. However, current information suggests COVID-19 can cause severe disease and death in 2% to 3% of people with the infection, especially among the elderly and those people with underlying health problems or compromised immune systems."),
    thing(question: "What is a pandemic?", answer: "A pandemic is defined as “an epidemic occurring worldwide, or over a very wide area, crossing international boundaries and usually affecting a large number of people”. The classical definition includes nothing about population immunity, virology or disease severity./n/nBy this definition, pandemics can be said to occur annually in each of the temperate southern and northern hemispheres, given that seasonal epidemics cross international boundaries and affect a large number of people. However, seasonal epidemics are not considered pandemics."),
    thing(question: "What is 'flattening the curve'?", answer: "A key part of managing COVID‐19 is trying to decrease and delay the epidemic peak, known as 'flattening the curve'./n/nThis is done by slowing the infection rate to decrease the risk of health services being overwhelmed, allowing for better treatment of current cases, and delaying additional cases until effective treatments or a vaccine become available."),
    thing(question: "Can children or adolescents catch COVID-19?", answer: "Research indicates that children and adolescents are just as likely to become infected as any other age group and can spread the disease./n/nEvidence to date suggests that children and young adults are less likely to get severe disease, but severe cases can still happen in these age groups./n/nChildren and adults should follow the same guidance on self-quarantine and self-isolation if there is a risk they have been exposed or are showing symptoms. It is particularly important that children avoid contact with older people and others who are at risk of more severe disease."),
    thing(question: "What can I do to protect myself and prevent the spread of disease?", answer: "Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Most countries around the world have seen cases of COVID-19 and many are experiencing outbreaks. Authorities in China and some other countries have succeeded in slowing their outbreaks. However, the situation is unpredictable so check regularly for the latest news./n/nYou can reduce your chances of being infected or spreading COVID-19 by taking some simple precautions:/n - Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. Why? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands./n - Maintain at least 1 metre distance between yourself and others. Why? When someone coughs, sneezes, or speaks they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person has the disease./n - Avoid going to crowded places. Why? Where people come together in crowds, you are more likely to come into close contact with someone that has COVID-19 and it is more difficult to maintain physical distance of 1 metre./n - Avoid touching eyes, nose and mouth. Why? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and infect you./n - Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately and wash your hands. Why? Droplets spread virus. By following good respiratory hygiene, you protect the people around you from viruses such as cold, flu and COVID-19./n - Stay home and self-isolate even with minor symptoms such as cough, headache, mild fever, until you recover. Have someone bring you supplies. If you need to leave your house, wear a mask to avoid infecting others. Why? Avoiding contact with others will protect them from possible COVID-19 and other viruses./n - If you have a fever, cough and difficulty breathing, seek medical attention, but call by telephone in advance if possible and follow the directions of your local health authority. Why? National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections./n - Keep up to date on the latest information from trusted sources, such as WHO or your local and national health authorities. Why? Local and national authorities are best placed to advise on what people in your area should be doing to protect themselves."),
    thing(question: "Is there a vaccine, drug or treatment for COVID-19?", answer: "While some western, traditional or home remedies may provide comfort and alleviate symptoms of mild COVID-19, there are no medicines that have been shown to prevent or cure the disease. WHO does not recommend self-medication with any medicines, including antibiotics, as a prevention or cure for COVID-19. However, there are several ongoing clinical trials of both western and traditional medicines. WHO is coordinating efforts to develop vaccines and medicines to prevent and treat COVID-19 and will continue to provide updated information as soon research results become available./n/nThe most effective ways to protect yourself and others against COVID-19 are to:/n - Clean your hands frequently and thoroughly/n - Avoid touching your eyes, mouth and nose/n - Cover your cough with the bend of elbow or tissue. If a tissue is used, discard it immediately and wash your hands./n - Maintain a distance of at least 1 metre from others."),
    thing(question: "How long does it take after exposure to COVID-19 to develop symptoms?", answer: "The time between exposure to COVID-19 and the moment when symptoms start is commonly around five to six days but can range from 1 – 14 days."),
    thing(question: "What is the connection between COVID-19 and animals?", answer: "COVID-19 is spread through human-to-human transmission./n/nWe already know a lot about other viruses in the coronavirus family and most of these types of viruses have an origin in animals. The COVID-19 virus (also called SARS-CoV-2) is a new virus in humans. The possible animal source of COVID-19 has not yet been confirmed but research is ongoing./n/nWHO continues to monitor the latest research on this and other COVID-19 topics and will update, as new findings are available."),
    thing(question: "Can I catch COVID-19 from my pet or other animals?", answer: "Several dogs and cats (domestic cats and tigers) in contact with infected humans have tested positive for COVID-19. In addition, ferrets appear to be susceptible to the infection. In experimental conditions, both cats and ferrets were able to transmit infection to other animals of the same species. However, there is no evidence that these animals can transmit the disease to humans and spread COVID-19. COVID-19 is mainly spread through droplets produced when an infected person coughs, sneezes, or speaks./n/nMinks raised in farms have also been detected with the virus. Most likely, they have been infected by farm workers. In a few instances, the minks that were infected by humans have transmitted the virus to other people. These are the first reported cases of animal-to-human transmission./n/nIt is still recommended that people who are sick with COVID-19 and people who are at risk limit contact with companion and other animals. When handling and caring for animals, basic hygiene measures should always be implemented. This includes hand washing after handling animals, their food or supplies, as well as avoiding kissing, licking or sharing food."),
    thing(question: "How long does the virus survive on surfaces?", answer: "The most important thing to know about coronavirus on surfaces is that they can easily be cleaned with common household disinfectants that will kill the virus. Studies have shown that the COVID-19 virus can survive for up to 72 hours on plastic and stainless steel, less than 4 hours on copper and less than 24 hours on cardboard./n/nAs, always clean your hands with an alcohol-based hand rub or wash them with soap and water. Avoid touching your eyes, mouth, or nose."),
    thing(question: "Are antibiotics effective in preventing or treating COVID-19?", answer: "No. Antibiotics do not work against viruses; they only work on bacterial infections. COVID-19 is caused by a virus, so antibiotics do not work. Antibiotics should not be used as a means of prevention or treatment of COVID-19. In hospitals physicians will sometimes use antibiotics to prevent or treat secondary bacterial infections which can be a complication of COVID-19 in severely ill patients. They should only be used as directed by a physician to treat a bacterial infection."),
    thing(question: "Can I catch COVID-19 from the faeces of someone with the disease?", answer: "While initial investigations suggest the virus may be present in faeces in some cases, to date, there have not been reports of faecal-oral transmission of COVID-19. Additionally, there is no evidence to date on the survival of the COVID-19 virus in water or sewage./n/nWHO is assessing ongoing research on the ways COVID-19 is spread and will continue to share new findings on this topic."),
    thing(question: "Can the COVID-19 survive in drinking water?", answer: "Currently, there is no evidence about the survival of the COVID-19 virus in drinking-water or sewage."),
    thing(question: "Can COVID-19 spread through food?", answer: "It is highly unlikely that people can contract COVID-19 from food or food packaging. COVID-19 is a respiratory illness and the primary transmission route is through person-to- person contact and through direct contact with respiratory droplets generated when an infected person coughs or sneezes./n/nThere is no evidence to date of viruses that cause respiratory illnesses being transmitted via food or food packaging. Coronaviruses cannot multiply in food; they need an animal or human host to multiply."),
    thing(question: "Who is at risk for coronavirus?", answer: "The virus that causes COVID-19 infects people of all ages. However, evidence to date suggests that two groups of people are at a higher risk of getting severe COVID-19 disease. These are older people (that is people over 60 years old); and those with underlying medical conditions (such as cardiovascular disease, diabetes, chronic respiratory disease, and cancer). The risk of severe disease gradually increases with age starting from around 40 years. It's important that adults in this age range protect themselves and in turn protect others that may be more vulnerable./n/nWHO has issued advice for these two groups and for community support to ensure that they are protected from COVID-19 without being isolated, stigmatized, left in a position of increased vulnerability or unable to access basic provisions and social care."),
    thing(question: "Can you contract the coronavirus disease by touching a surface?", answer: "People could catch COVID-19 by touching contaminated surfaces or objects – and then touching their eyes, nose or mouth."),
    thing(question: "Are smokers more vulnerable to contracting COVID-19?", answer: "Tobacco smokers (cigarettes, waterpipes, bidis, cigars, heated tobacco products) may be more vulnerable to contracting COVID-19, as the act of smoking involves contact of fingers (and possibly contaminated cigarettes) with the lips, which increases the possibility of transmission of viruses from hand to mouth./n/nSmoking waterpipes, also known as shisha or hookah, often involves the sharing of mouth pieces and hoses, which could facilitate the transmission of the COVID-19 virus in communal and social settings."),
    thing(question: "What happens when you get the coronavirus disease?", answer: "People with COVID-19 generally develop signs and symptoms, including mild respiratory symptoms and fever, on an average of 5-6 days after infection (mean incubation period 5-6 days, range 1-14 days). Most people infected with COVID-19 virus have mild disease and recover."),
    thing(question: "Does heat prevent COVID-19?", answer: "Exposing yourself to the sun or temperatures higher than 25°C DOES NOT protect you from COVID-19. You can catch COVID-19, no matter how sunny or hot the weather is. Countries with hot weather have reported cases of COVID-19."),
    thing(question: "Can babies get the coronavirus disease?", answer: "We know it is possible for people of any age to be infected with the virus, but so far there are relatively few cases of COVID-19 reported among children."),
    thing(question: "How can physical distancing help during COVID-19 pandemic?", answer: "Physical distancing helps limit the spread of COVID-19 – this means we keep a distance of at least 1m from each other and avoid spending time in crowded places or in groups."),
    thing(question: "Can I excercise outdoors during the coronavirus pandemic?", answer: "Do not exercise if you have a fever, cough and difficulty breathing. Stay home and rest, seek medical attention and call in advance. Follow the directions of your local health authority./n/nIf you are able to go for a walk or bicycle ride always practice physical distancing and wash your hands with water and soap before you leave, when you get to where you are going, and as soon as you get home. If water and soap are not immediately available, use alcohol-based hand rub."),
    thing(question: "Can coronavirus spread through mosquito bite?", answer: "To date there has been no information nor evidence to suggest that the new coronavirus could be transmitted by mosquitoes. The new coronavirus is a respiratory virus which spreads primarily through droplets generated when an infected person coughs or sneezes, or through droplets of saliva or discharge from the nose. To protect yourself, clean your hands frequently with an alcohol-based hand rub or wash them with soap and water. Also, avoid close contact with anyone who is coughing and sneezing."),
    thing(question: "What is the difference between the coronavirus and the influenza virus?", answer: "The speed of transmission is an important point of difference between the two viruses. Influenza has a shorter median incubation period (the time from infection to appearance of symptoms) and a shorter serial interval (the time between successive cases) than COVID-19 virus. The serial interval for COVID-19 virus is estimated to be 5-6 days, while for influenza virus, the serial interval is 3 days. This means that influenza can spread faster than COVID-19./n/nFurther, transmission in the first 3-5 days of illness, or potentially pre-symptomatic transmission –transmission of the virus before the appearance of symptoms – is a major driver of transmission for influenza. In contrast, while we are learning that there are people who can shed COVID-19 virus 24-48 hours prior to symptom onset, at present, this does not appear to be a major driver of transmission."),
    thing(question: "What are some good foods to eat during the COVID-19 pandemic?", answer: "You should eat a variety of fresh and unprocessed foods every day to get the vitamins, minerals, dietary fibre, protein and antioxidants your body needs. Drink enough water. Eat fruits, vegetables, legumes (e.g. lentils, beans), nuts and whole grains (e.g. unprocessed maize, millet, oats, wheat, brown rice or starchy tubers or roots such as potato, yam, taro or cassava), and foods from animal sources (e.g. meat, fish, eggs and milk). For snacks, choose raw vegetables and fresh fruit rather than foods that are high in sugar, fat or salt.")
]

let virusmoresources = [""]
let virusResources = [""]
let virusResourcesLinks = [""]
//VirusTable(
//    title: <#T##String#>,
//    data: [
//        VirusTableItem(
//            header: <#T##String#>,
//            headerContents: VirusTableItemContent(
//                description: <#T##String#>,
//                videoLink: <#T##String?#>,
//                imageName: <#T##String?#>,
//                backgroundImageName: <#T##String?#>
//            )
//        )
//    ],
//    sourcesNames: [
//    ],
//    sources: [
//    ]
//)

//var VirusQuestions = [
//    QuizQuestion(question: <#T##String#>, choice1: <#T##String#>, choice2: <#T##String#>, choice3: <#T##String#>, choice4: <#T##String#>, correctChoice: <#T##OptionChoice#>)
//]

var hazeNews = ["CNA (News)", "CNA (PSI)", "ST"]
var hazeNewsWebsites = ["https://www.channelnewsasia.com/news/topic/haze", "https://www.channelnewsasia.com/news/psi", "https://www.straitstimes.com/tags/haze"]
var hazeGov = ["Haze Microsite (LIVE PSI)", "NEA’s myENV app", "NEA’s Twitter Page", "NEA’s Facebook page", "NEA’s corporate website", "MOM", "MOH"]
var hazeGovSites = ["https://www.haze.gov.sg/","https://apps.apple.com/sg/app/myenv/id444435182", "https://twitter.com/NEAsg", "https://www.facebook.com/NEASingapore", "https://www.nea.gov.sg/", "https://www.mom.gov.sg/haze", "https://www.moh.gov.sg/resources-statistics/educational-resources/haze/faqs-on-haze-health-advisory"]
var hazeJournalsLinks = [
    "https://ink.library.smu.edu.sg/cgi/viewcontent.cgi?article=5397&context=sis_research",
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6765769/",
    "https://www.pnas.org/content/116/12/5239",
    "https://oxfordre.com/politics/view/10.1093/acrefore/9780190228637.001.0001/acrefore-9780190228637-e-262",
    "https://link.springer.com/article/10.1007/s101130100021",
    "https://link.springer.com/article/10.1007%2Fs10308-006-0067-1",
    "https://link.springer.com/article/10.1353/dem.2002.0009",
    "https://www.sciencedirect.com/science/article/abs/pii/S1352231000003952",
    "https://link.springer.com/article/10.1007/s00024-003-8771-x",
    "https://www.sciencedirect.com/science/article/abs/pii/S1462901115300770",
    "https://www.sciencedirect.com/science/article/abs/pii/S0305750X0100122X",
    "https://www.nature.com/articles/nclimate3008",
    "https://www.mdpi.com/2071-1050/8/5/499",
    "https://link.springer.com/article/10.1007/s11027-006-9045-6",
    "https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1931-0846.2004.tb00158.x",
    "https://onlinelibrary.wiley.com/doi/abs/10.1046/j.1440-1843.2000.00247.x",
    "https://www.sciencedirect.com/science/article/abs/pii/S0959378014000296",
    "https://www.sciencedirect.com/science/article/abs/pii/S1352231000003952",
    "https://www.ijern.com/journal/August-2013/09.pdf"
]

struct TutorialStuff {
    var videoName: String
    var videoFileType: String
    var image: String
    var title: String
    var desc: String
}

let tutorials = [
    TutorialStuff(videoName: "Virus (Light)", videoFileType: "mov", image: "image1", title: "Title 1", desc: "desc 1"),
    TutorialStuff(videoName: "virazePersonalisationLight", videoFileType: "mov", image: "image2", title: "Personalisation", desc: "Make Viraze your very own, with a profile picture and name"),
    TutorialStuff(videoName: "Virus (Light)", videoFileType: "mov", image: "image3", title: "Title 3", desc: "desc 3")
]

let tutorialsDark = [
    TutorialStuff(videoName: "Virus (Dark)", videoFileType: "mov", image: "image1", title: "Title 1", desc: "desc 1"),
    TutorialStuff(videoName: "virazePersonalisationDark", videoFileType: "mov", image: "image2", title: "Personalisation", desc: "Make Viraze your very own, with a profile picture and name"),
    TutorialStuff(videoName: "Virus (Dark)", videoFileType: "mov", image: "image3", title: "Title 3", desc: "desc 3")
]
