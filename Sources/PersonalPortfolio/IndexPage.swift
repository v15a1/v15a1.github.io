//  File.swift
//
//
//  Created by Visal Rajapakse on 2020-11-28.
//
import Foundation
import Publish
import Plot
final class IndexPage <Site: Website> {
    
    private let navbarItems : [String]!
    private let skills : [[String]]!
    private let projects : [[String]]!
    private let checkMeOut : [[String]]!
    
    init() {
        navbarItems = [
            "About",
            "Skills",
            "Experience",
            "Projects",
            "Contact"
        ]
        
        skills = [
            ["/images/swift.png", "Swift"],
            ["/images/flutter.png", "Flutter"],
            ["/images/react.png", "React"],
            ["/images/android.png", "Android"],
            ["/images/reactNative.png", "React Native"],
            ["/images/git.png", "Git"],
            ["/images/java.png", "Java"],
            ["/images/python.png", "Python"],
        ]
        
        projects = [
            ["speculo",
             "Speculo",
             "Speculo is an open-source platform that utilizes a Deep Convolution Inverse Graphics Network for indexing faces found in video footage, specifically for CCTV surveillance.",
             "https://github.com/MrSupiri/speculo",
             "speculo-btn",
             "Go to Github",
             "/images/speculo.png"
            ],
            ["recyclomedia",
             "Recyclomedia",
             "Recyclopedia is a vintage inspired digital platform that aims to save the planet from the pollution which is the major threat to the functioning of earth. Recyclomedia managed to rank within the top 20 worldwide",
             "https://github.com/Iconicto/recyclomedia",
             "recyclomedia-btn",
             "Go to Github",
             "/images/recyclomedia.png"
            ],
            ["chari-lake",
             "Chari Lake",
             "Recyclopedia is a vintage inspired digital platform that aims to save the planet from the pollution which is the major threat to the functioning of earth. Built for Hack20 organized by Flutter Google",
             "https://www.charilakehotel.lk",
             "chari-lake-btn",
             "Go to Website",
             "/images/charilake.png"
            ],
        ]
        
        checkMeOut = [
            ["/images/linkedin.png","https://www.linkedin.com/in/visalrajapakse99/"],
            ["/images/github.png","https://github.com/v15a1"],
            ["/images/twitter.png","https://twitter.com/v15a1"]
        ]
    }
    
    func showIndex(index : Index, context : PublishingContext<Site>) -> HTML {
        HTML(
            .head(for: index, on: context.site),
            .body(
                .div(
                    .class("snap-container"),
                    .div(
                        //MARK:- Hero + Navbar
                        .class("hero-image"),
                        .div(
                            .class("nav-bar"),
                            .div(
                                .class("nav-content"),
                                .div(
                                    .class("nav-items")
//                                    ,.forEach(navbarItems){
//                                        .a(
//                                            .text($0),
//                                            .class("nav-link")
//                                        )//navItem
//                                    }//navItems
                                )//nav-items
                            )//nav-content
                        ),//nav-bar
                        .div(
                            .class("hero-details"),
                            .div(
                                .class("name-text"),
                                "Visal Rajapakse"
                            ),//name-text
                            .div(
                                .class("elevator-pitch"),
                                "SE Undergrad • iOS Developer • UI/UX enthusiast • Front-end enthusiast"
                            )//elevator-pitch
                        )//center
                    ),//hero-image
                    
                    //MARK:- About me
                    
                    .div(
                        .class("about-me"),
                        .div(
                            .class("about-me-center"),
                            .div(
                                .class("content"),
                                .div(
                                    .class("title"),
                                    "About me"
                                ),//About me title
                                .div(
                                    .class("spacer")
                                ),//spacer
                                .div(
                                    "Hey! I'm Visal, a Software Engineering undergrad studying at the Informatics Institute of Technology in Colombo, Sri Lanka affliated with the University of Westminster, England. I show enthusiasm in Front End Development but find myself a little biased towards Mobile Application Development. The eventual career goal is to become a fully fledged and fully furnished iOS application developer."
                                )//About me paragraph
                            )//About me content
                        )//about-me-center
                    ),//about-me
                    
                    //MARK:- Skills
                    .div(
                        .class("title overflowing-title"),
                        "Skills"
                    ),//About me title
                    .div(
                        .class("spacer")
                    ),//spacer
                    .div(
                        .class("skills unselectable"),
                        .div(
                            .class("skill-center"),
                            .div(
                                .class("skillset"),
                                .forEach(skills, { (item) -> Node<HTML.BodyContext> in
                                    .div(
                                        .class("skill"),
                                        .div(
                                            .img(
                                                .class("icon"),
                                                .src(item[0])
                                            )
                                        ),//icon
                                        .div(
                                            .class("skill-name"),
                                            "\(item[1])"
                                        )//skill-name
                                    )//skill
                                })//forEach
                            )//skillset
                        )//skill center
                    ),//skills
                    .div(
                        .class("projects"),
                        .div(
                            .class("projects-center"),
                            .div(
                                .class("title"),
                                "Projects"
                            ),//About me title
                            .div(
                                .class("spacer")
                            ),//spacer
                            .div(
                                .class("project-container"),
                                .forEach(projects, { (project) -> Node<HTML.BodyContext> in
                                    .div(
                                        .class("project"),
                                        .div(
                                            .class("project-image-holder \(project[0])"),
                                            .img(
                                                .class("project-thumbnail"),
                                                .src(project[6])
                                            )//project-thumbnail
                                        ),
                                        .div(
                                            .class("project-content"),
                                            .div(
                                                .class("project-details"),
                                                .div(
                                                    .div(
                                                        .class("project-title"),
                                                        "\(project[1])"
                                                    ),
                                                    .div(
                                                        .class("project-description"),
                                                        "\(project[2])"
                                                    ),
                                                    .div(
                                                        .class("button-holder"),
                                                        .a(
                                                            .class("link-button \(project[4])"),
                                                            .href(project[3]),
                                                            .target(HTMLAnchorTarget(rawValue: "_blank")!),
                                                            "\(project[5])"
                                                        )
                                                    )
                                                )
                                            )//project-content
                                        )//project
                                )})//forEach - projects
                            )//project-container
                        )//projects-center
                    ),//projects
                    .div(
                        .class("check-me-out"),
                        .div(
                            .class("learn-more-holder"),
                            .div(
                                .class("title"),
                                "Check out ____ ..."
                            ),//About me title
                            .div(
                                .class("spacer")
                            ),//spacer
                            .div(
                                .class("content text-center"),
                                "Click on the icons below to learn more about me"
                            ),
                            .div(
                                .class("link-holder"),
                                .forEach(checkMeOut, { (item) -> Node<HTML.BodyContext> in
                                    .a(
                                        .href(item[1]),
                                        .target(HTMLAnchorTarget(rawValue: "_blank")!),
                                        .img(
                                            .class("item-icon"),
                                            .src(item[0])
                                        )//item-icon
                                    )//a
                                })//forEach - checkMeOut
                            )//link-holder
                        )//div
                    ),//check-me-out
                    .footer(
                        .class("footer content"),
                        .div(
                            .class("footer-content-holder"),
                            .text("Built with ❤️ using "),
                            .span("Publish for Swift"),
                            .br(),
                            .a(
                                .href("https://github.com/JohnSundell/Publish"),
                                "Check out publish here"
                            )
                        )
                    )//footer
                )//snap-container
            )//body
        )//HTML
    }
}
