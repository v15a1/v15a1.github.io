import Foundation
 import Publish
 import Plot

 // This type acts as the configuration for your website.
 struct VisalRajapakse: Website {
     enum SectionID: String, WebsiteSectionID {
         // Add the sections that you want your website to contain here:
         case posts
     }

     struct ItemMetadata: WebsiteItemMetadata {
         // Add any site-specific metadata that you want to use here.
     }

     // Update these properties to configure your website:
     var url = URL(string: "https://v15a1.github.io")!
     var name = "Visal Rajapakse"
     var description = ""
     var language: Language { .english }
     var imagePath: Path? { nil }
 }

 private extension Node where Context == HTML.BodyContext {
     static func wrapper(_ nodes: Node...) -> Node {
         .div(.class("wrapper"), .group(nodes))
     }
 }

 struct MyHTMLFactory<Site: Website> : HTMLFactory {
     func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
         IndexPage().showIndex(index: index, context: context)
     }

     func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
         HTML(
             .head(for: section, on: context.site)//Head
         )//HTML

     }

     func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
         HTML(
             .head(for: item, on: context.site)//Head
         )//HTML
     }

     func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
         try makeIndexHTML(for: context.index, context: context)
     }

     func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
         nil
     }

     func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
         nil
     }
 }

 extension Theme {
     static var myTheme : Theme{
         Theme(
             htmlFactory: MyHTMLFactory(),
             resourcePaths: [
                 "Resources/Styles/styles.css"
             ]
         )
     }
 }

 // This will generate your website using the built-in Foundation theme:
 try VisalRajapakse().publish(withTheme: .myTheme, deployedUsing:  .gitHub("v15a1/v15a1.github.io", useSSH : false)
 )
