//  File.swift
//
//
//  Created by Visal Rajapakse on 2020-11-28.
//
import Foundation
import Publish
import Plot
final class IndexPage <Site: Website> {
    
    func showIndex(index : Index, context : PublishingContext<Site>) -> HTML {
        HTML(
            .head(
                for: index,
                on: context.site,
                stylesheetPaths: [
                    "Styles/styles.css",
                    "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
                ]
            ),
            .body(
                .div(
                    .id("scrollLine"),
                    .class("scroll-line gradient")
                ),
                .div(
                    //MARK:- Hero + Navbar
                    .class("hero-image"),
                    .id("hero"),
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
                    ,.img(
                        .class("hero-src"),
                        .src("Images/visal.png")
                    )
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
                                "Hello there! I'm Visal, a Software Engineering undergrad studying at the Informatics Institute of Technology in Colombo, Sri Lanka affliated with the University of Westminster, England. In the long run I hope to become a fully fledged and fully furnished iOS application developer.",
                                .br(),
                                .br(),
                                "Personality wise, I am an introvert who once comfortable with a crowd can be loud and stirring. I make an excellent team player who is reliable, responsible, punctual and has constant drive to finish tasks assigned. I consider myself to be great at assessing products in the ideation stages which could benefit the idea to being well polished as I have proven myself and others to be a thinker outside the box.",
                                .br(),.br(),
                                "Apart from personality, I'm in fact more of a visual learner which explains my tendencies to work mostly with Front-End technologies that I find to be tasty eye candy. I am easily infatuated by almost anything involving graphics or art. In fact I would consider myself to be good at both which gives me the upper hand and quite the eye when it comes to UI/UX design, graphic designing and as mentioned, Front-End"
                                
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
                        ),//skillset
                        .button(
                            .onclick("moreSkillsTapped()"),
                            .id("show-more-button"),
                            .class("show-more"),
                            "Show more"
                        ),
                        .div(
                            .id("moreSkills"),
                            .class("more-skills hidden"),
                            .div(
                                .class("marquee"),
                                .ul(
                                    .class("marquee-content"),
                                    .forEach(otherSkills, { (skill) -> Node<HTML.ListContext> in
                                        .li("\(skill)")
                                    })//forEach - otherSkills
                                )//marquee-content
                            )//marquee
                        )//more-skills
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
                                            ),//project-image-holder ...
                                            .div(
                                                .class("project-content"),
                                                .div(
                                                    .class("project-details"),
                                                    .div(
                                                        .div(
                                                            .class("project-title"),
                                                            "\(project[1])"
                                                        ),//project-title
                                                        .div(
                                                            .class("project-description"),
                                                            "\(project[2])"
                                                        ),//project-description
                                                        .div(
                                                            .class("button-holder"),
                                                            .a(
                                                                .class("link-button \(project[4])"),
                                                                .href(project[3]),
                                                                .target(HTMLAnchorTarget(rawValue: "_blank")!),
                                                                "\(project[5])"
                                                            )//link-button
                                                        )//button-holder
                                                    )//div
                                                )//project-content
                                            )//project
                                        )})//forEach - projects
                        )//project-container
                    )//projects-center
                ),//projects
                .div(
                    .class("experiences"),
                    .div(
                        .class("experience-center"),
                        .div(
                            .class("title"),
                            "Experience"
                        ),//About me title
                        .div(
                            .class("spacer")
                        ),//spacer
                        .div(
                            .class("experience-container"),
                            .forEach(experience, { (exp) -> Node<HTML.BodyContext> in
                                        .div(
                                            .class("experience"),
                                            .div(
                                                .class("experience-image-holder tss"),
                                                .img(
                                                    .class("experience-thumbnail")
                                                    ,.src(exp[4])
                                                )//project-thumbnail
                                            ),//project-image-holder ...
                                            .div(
                                                .class("experience-content"),
                                                .div(
                                                    .class("experience-details"),
                                                    .div(
                                                        .div(
                                                            .class("experience-title"),
                                                            "\(exp[0])"
                                                        ),//project-title
                                                        .div(
                                                            .class("experience-description"),
                                                            "\(exp[1])",
                                                            .br(),
                                                            .br(),
                                                            .br(),
                                                            "Position : ", .span("\(exp[2])"),
                                                            .br(),
                                                            .br(),
                                                            "Duration : ", .span("\(exp[3])")
                                                        )//project-description
                                                    )//div
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
                            "Still curious?"
                        ),//About me title
                        .div(
                            .class("spacer")
                        ),//spacer
                        .div(
                            .class("content text-center"),
                            "Click on the icons below to learn more about me"
                        ),//content text-center
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
                            "Check out publish here",
                            .target(HTMLAnchorTarget(rawValue: "_blank")!)
                        )//a
                    )//footer-content-holder
                )//footer
            ),//body
            .raw(
                """
                <script src="/Scripts/index.js"></script>
                """
            )
        )//HTML
    }
    
    private let navbarItems = [
        "About",
        "Skills",
        "Experience",
        "Projects",
        "Contact"
    ]
    
    private let skills = [
        ["/Images/swift.png", "Swift"],
        ["/Images/flutter.png", "Flutter"],
        ["/Images/react.png", "React"],
        ["/Images/android.png", "Android"],
        ["/Images/reactNative.png", "React Native"],
        ["/Images/git.png", "Git"],
        ["/Images/java.png", "Java"],
        ["/Images/python.png", "Python"],
        ["/Images/graphics.png", "Graphics • Art • UI/UX"],
    ]
    
    private let projects = [
        ["speculo",
         "Speculo",
         "Speculo is a now open-source platform developed for our Software Development Group Project which utilizes a Deep Convolution Inverse Graphics Network for indexing faces found in video footage, specifically for CCTV surveillance to drastically reduce the time taken for footage analysis.",
         "https://github.com/MrSupiri/speculo",
         "speculo-btn",
         "Go to Github",
         "/Images/speculo.png"
        ],
        ["recyclomedia",
         "Recyclomedia",
         "Recyclopedia is a 'Old is Gold' inspired digital platform that aims to save the planet from the pollution which is the major threat to all life on earth. Recyclomedia is the byproduct of Hack20, a Flutter hackathon organized by Google. Recylomedia also managed to secure the rank of #20 Worldwide.",
         "https://github.com/Iconicto/recyclomedia",
         "recyclomedia-btn",
         "Go to Github",
         "/Images/recyclomedia.png"
        ],
        ["chari-lake",
         "Chari Lake",
         "A website revamp for Chari Lake, a perfect getaway, a soothing ambience, romantic setting overlooking the beautiful koggala lake in Galle, Sri Lanka. ",
         "https://www.charilakehotel.lk",
         "chari-lake-btn",
         "Go to Website",
         "/Images/charilake.png"
        ],
    ]
    
    private let checkMeOut = [
        ["/Images/linkedin.png","https://www.linkedin.com/in/visalrajapakse99/"],
        ["/Images/github.png","https://github.com/v15a1"],
        ["/Images/twitter.png","https://twitter.com/v15a1"]
    ]
    
    private let experience = [
        [
            "ThinkSmart Solutions",
            "Here, I currently develop some components and pages of the company's flagship service 'EatMeal First' using Swift5 and GraphQL Apollo.",
            "Intern - iOS Development",
            "June 2020 - Present",
            "/Images/tss.png"
        ]
    ]
    
    private let otherSkills = [
        "HTML",
        "CSS",
        "JavaScript",
        "TypeScript",
        "BootStrap",
        "MaterialUI",
        "NodeJS",
        "Firebase",
        "C",
        "Figma",
        "XD",
        "Affinity Photo",
        "Affinity Design",
        "Photoshop",
        "Lightroom",
        "FinalCut Pro X",
        "MongoDB",
        "MySQL",
        "NoSQL",
        "Realm",
        "GraphQL",
        "SwiftUI",
        "Drawing",
        "Apollo",
    ]
    
    
    
}
