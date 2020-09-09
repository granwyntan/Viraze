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
//var HazeQuestions = [
//    QuizQuestion(question: "What is haze?", choice1: <#T##String#>, choice2: <#T##String#>, choice3: <#T##String#>, choice4: <#T##String#>, correctChoice: <#T##OptionChoice#>)
//]

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
                    videoLink: "https://www.bbc.com/news/world-asia-22998592")
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
                header: "What are the key air pollutants of concern",
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
                header: "How is the air quality forecasted?\nWhy is the health advisory based on 24-hour PSI forecast?",
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

//var VirusQuestions = [
//    QuizQuestion(question: <#T##String#>, choice1: <#T##String#>, choice2: <#T##String#>, choice3: <#T##String#>, choice4: <#T##String#>, correctChoice: <#T##OptionChoice#>)
//]

struct TutorialStuff {
    var videoName: String
    var videoFileType: String
    var image: String
    var title: String
    var desc: String
}

let tutorials = [
    TutorialStuff(videoName: "Virus (Light)", videoFileType: "mov", image: "image1", title: "Title 1", desc: "desc 1"),
    TutorialStuff(videoName: "Virus (Light)", videoFileType: "mov", image: "image2", title: "Title 2", desc: "desc 2"),
    TutorialStuff(videoName: "Virus (Light)", videoFileType: "mov", image: "image3", title: "Title 3", desc: "desc 3")
]

let tutorialsDark = [
    TutorialStuff(videoName: "Virus (Dark)", videoFileType: "mov", image: "image1", title: "Title 1", desc: "desc 1"),
    TutorialStuff(videoName: "Virus (Dark)", videoFileType: "mov", image: "image2", title: "Title 2", desc: "desc 2"),
    TutorialStuff(videoName: "Virus (Dark)", videoFileType: "mov", image: "image3", title: "Title 3", desc: "desc 3")
]
