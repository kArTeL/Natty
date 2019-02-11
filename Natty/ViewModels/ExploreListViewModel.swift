//
//  ExploreListViewModel.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

class ExploreListViewModel {
    
    var sections = [Section]()
    
    init() { }
    
    func getData() {
        let item = MFeaturedItem(title: "Lost in the eternity", subtitle:"""
I saw her crying lying down the floor
She was crawling through the dark
I drank her blood it tasted like never before
Like a dagger through my heart
Lost in eternity
You are on my mind
Your my guiding light
Feels like I am blind
Without you I can't go on
And suddenly I wake up from my dreams
She's lying deadly on the floor
Now I know she is not human at all
And she can't reach the open door
Lost in eternity
You are on my mind
Your my guiding light
Feels like I am blind
Without you I can't go on
""", image: "https://static.adweek.com/adweek.com-prod/wp-content/uploads/2017/10/VSCO-brands-CONTENT-2017.jpg")
       
        let item2 = MFeaturedItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
        let item3 = MFeaturedItem(title: "Family", subtitle:"Find a home that family love. Stretch out and enjoy a space of your own. but i don't know if this fucking text crop as well", image: "http://static2.uk.businessinsider.com/image/5980d6dd27fa6b041e5ed726-1190-625/vsco-the-best-free-photo-app-on-the-market-just-added-video-editing-tools--but-youll-have-to-pay-for-them.jpg")
        let item4 = MFeaturedItem(title: "", subtitle:"", image: "http://4.bp.blogspot.com/-UUnc7QIj_vY/VIFqKdVh_fI/AAAAAAAAUg0/RaLMJlMpLkY/s1600/IMG_0208.JPG")
        let featuredSection = MFeaturedSection(title: "", subtitle: "Los mejores consejos para tu hogar", items: [item, item2, item3, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4])
        
        
        let gridItem = MGridItem(title: "Amalfi Coast, Italy", subtitle:"The City by the Bay offers something for everyone. Travelers love the city's iconic sights, including the Golden Gate Bridge and Alcatraz, its vibrant neighborhoods like the Mission District and Chinatown, and its outdoor offerings, such as Muir Woods National Monument, Golden Gate Park and Ocean Beach. What's more, San Francisco is home to an excellent and diverse food scene, boasting everything from Michelin-starred eateries to tasty food trucks to the popular Ferry Building Marketplace food hall. (GETTY IMAGES)", image: "https://s3.amazonaws.com/files.shopmoment.com/general/momentist/vsco-33.jpg?mtime=20170410182229")
        let gridItem2 = MGridItem(title: "", subtitle:"", image: "https://static1.squarespace.com/static/52c3f40de4b09bdc91f2ec10/58d9792b414fb508b08bf1fe/58d9793f893fc0c8f57d30be/1490647405529/IMG_8832.JPG")
        let gridItem3 = MGridItem(title: "", subtitle:"", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG8OpoNqcIoI8o0Eg4eSjTPdHE-x6NKVSGyit55CStzHaVfYMJcw")
        let gridItem4 = MGridItem(title: "", subtitle:"", image: "https://static.tumblr.com/e3c6b1b4dce66af078446f7e9aae66ec/gd7w5p0/Dvjo068db/tumblr_static_filename_640_v2.jpg")
        let gridItem5 = MGridItem(title: "", subtitle:"", image: "http://s3.gomedia.us/wp-content/uploads/2013/10/gma-vsco-cam-tutorial-sxc-1408266-27405860-rev-01-no-textures.jpg")
        let gridItem6 = MGridItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
         let gridItem7 = MGridItem(title: "", subtitle:"", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI2wE1E-9JXUKqrHVx0L46xt_wu6wjuax1QXJA8OAmOs48AZd27w")
         let gridItem8 = MGridItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
         let gridItem9 = MGridItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
        let gridSection = MGridSection(title: "Just for your", subtitle: "Best house's histories", items: [gridItem,gridItem2, gridItem3,gridItem4,gridItem5,gridItem6, gridItem7,gridItem8,gridItem9])
        
        let gridSection2 = MGridSection(title: "Just for your", subtitle: "Best house's histories", items: [gridItem,gridItem2, gridItem3,gridItem4,gridItem5,gridItem6])
        let featuredSection2 = MFeaturedSection(title: "Editorial", subtitle: "Highlighting VSCo and the comunity", items: [item, item2])
        
        let standarItem = MStandardItem(title: "Hillary Clinton", subtitle:"""
Hillary Rodham Clinton has served as secretary of state, senator from New York, first lady of the United States, first lady of Arkansas, a practicing lawyer and law professor, activist, and volunteer—but the first thing her friends and family will tell you is that she’s never forgotten where she came from or who she’s been fighting for.

    Hillary grew up in a middle-class home in Park Ridge, a suburb of Chicago. Her dad, Hugh, was a World War II Navy veteran and a small-business owner who designed, printed, and sold drapes. Hugh was a rock-ribbed Republican, a pay-as-you-go kind of guy who worked hard and wasted nothing. Hillary helped with the family business whenever she could.
""", image: "https://www.rollingstone.com/wp-content/uploads/2019/01/shutterstock_9919210a.jpg?crop=900:600&width=440")
        
        
        
        let standarItem2 = MStandardItem(title: "Donald Trump", subtitle: """
Donald John Trump (born June 14, 1946) is the 45th and current president of the United States. Before entering politics, he was a businessman and television personality.

Trump was born and raised in the New York City borough of Queens and received an economics degree from the Wharton School. He was appointed president of his family's real estate business in 1971, renamed it The Trump Organization, and expanded it from Queens and Brooklyn into Manhattan. The company built or renovated skyscrapers, hotels, casinos, and golf courses. Trump later started various side ventures, including licensing his name for real estate and consumer products. He managed the company until his 2017 inauguration. He co-authored several books, including The Art of the Deal. He owned the Miss Universe and Miss USA beauty pageants from 1996 to 2015, and he produced and hosted The Apprentice, a reality television show, from 2003 to 2015. Forbes estimates his net worth to be $3.1 billion.

Trump entered the 2016 presidential race as a Republican and defeated sixteen opponents in the primaries. Commentators described his political positions as populist, protectionist, and nationalist. His campaign received extensive free media coverage; many of his public statements were controversial or false. Trump was elected president in a surprise victory over Democratic nominee Hillary Clinton. He became the oldest and wealthiest person ever to assume the presidency, the first without prior military or government service, and the fifth to have won the election while losing the popular vote.[b] His election and policies have sparked numerous protests. Many of his comments and actions have been perceived as racially charged or racist.
""", image: "https://timedotcom.files.wordpress.com/2018/03/donald-trump-trade-wars-change-mind.jpg")
        
        let standarItem3 = MStandardItem(title: "Barack Obama", subtitle: """
Obama was born in Honolulu, Hawaii. After graduating from Columbia University in 1983, he worked as a community organizer in Chicago. In 1988, he enrolled in Harvard Law School, where he was the first black president of the Harvard Law Review. After graduating, he became a civil rights attorney and an academic, teaching constitutional law at the University of Chicago Law School from 1992 to 2004. He represented the 13th district for three terms in the Illinois Senate from 1997 to 2004, when he ran for the U.S. Senate. He received national attention in 2004 with his March primary win, his well-received July Democratic National Convention keynote address, and his landslide November election to the Senate. In 2008, he was nominated for president a year after his campaign began and after a close primary campaign against Hillary Clinton. He was elected over Republican John McCain and was inaugurated on January 20, 2009. Nine months later, he was named the 2009 Nobel Peace Prize laureate.

During his first two years in office, Obama signed many landmark bills into law. The main reforms were the Patient Protection and Affordable Care Act (often referred to as "Obamacare", shortened as the "Affordable Care Act"), the Dodd–Frank Wall Street Reform and Consumer Protection Act, and the Don't Ask, Don't Tell Repeal Act of 2010. The American Recovery and Reinvestment Act of 2009 and Tax Relief, Unemployment Insurance Reauthorization, and Job Creation Act of 2010 served as economic stimulus amidst the Great Recession. After a lengthy debate over the national debt limit, he signed the Budget Control and the American Taxpayer Relief Acts. In foreign policy, he increased U.S. troop levels in Afghanistan, reduced nuclear weapons with the United States–Russia New START treaty, and ended military involvement in the Iraq War. He ordered military involvement in Libya in opposition to Muammar Gaddafi; Gaddafi was killed by NATO-assisted forces. He also ordered the military operations that resulted in the deaths of Osama bin Laden and suspected Yemeni Al-Qaeda operative Anwar al-Awlaki.
""", image: "https://fortunedotcom.files.wordpress.com/2016/01/gettyimages-465692015-1.jpg")
        
        
        let standarItem4 = MStandardItem(title: "Renato Barrera", subtitle: """
Renato Barrera, con tan solo 13 años, se consolida como una estrella en las redes sociales. El adolescente chileno, que se hizo famoso por el accidentado sepelio de su pájaro "Chimuelo", ahora publicó un video para presentar a su nueva mascota: Menta.

En el video publicado en YouTube, que supera las 100 mil reproducciones, Renato presenta a "Menta", un ave color verde, al igual que el otro pájaro fallecido.

En este nuevo registro el niño grabó su vida diaria, donde muestra desde la hora que se levanta, su almuerzo y cómo entrena a la que fue la compañera de "Chimuelo".

En la filmación, Renato muestra la estrecha y cariñosa que tiene con "Menta".
""", image: "https://media.metrolatam.com/2019/01/11/chimueloysuhistoriaenmemes-02d44fca18341c0e5ba31133d4454c05-1200x600.jpg")
        let standardSection = MStandardSection(title: "Citizens of Humanity", subtitle: "It is awarded annually to a female author of any nationality", items: [standarItem, standarItem2, standarItem3, standarItem4])
        
        let videoSection = MVideoSection(title: "El mejor video de la semana", subtitle: "Tenemos a la instructura galardonada como la super estrella", videoURL: URL(string: "https://s3-us-west-1.amazonaws.com/tapp-images/offersVideos/nfl3/nfl3.m3u8"))
        
        sections.append(featuredSection)
        sections.append(gridSection)
        sections.append(standardSection)
        sections.append(videoSection)
        sections.append(gridSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
        
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numbersOfRows(inSection section: Int) -> Int {
        return sections.count
    }
    
    func sectionTitle(section: Int) -> String {
        return sections[section].title
    }
    
    func sectionSubtitle(sectionIndex section: Int) -> String {
        return sections[section].subtitle
    }
    
    func sectionType( sectionIndex: Int) -> SectionType {
        return sections[sectionIndex].type
    }
    func section( indexPath: IndexPath) -> Section {
        return sections[indexPath.row]
    }
    
}
