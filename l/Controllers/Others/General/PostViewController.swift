//
//  PostViewController.swift
//  l
//
//  Created by user217575 on 4/26/22.
//

import UIKit

//post view controller model

enum PostRenderType{
    case header(provider: User)
    case primaryContent(provider: UserPost)
    case actions(provider: String)
    case comments(comments: [PostComment])
}


//model of render psot
struct PostRenderViewModel {
    let renderType: PostRenderType
}


class PostViewController: UIViewController {
    
    private let model: UserPost?
    
    private var renderModel = [PostRenderViewModel]()
    
    private let tableView : UITableView = {
        let tableView  = UITableView()
        
        //register cells
        tableView.register(FeedPostTableViewCell.self, forCellReuseIdentifier: FeedPostTableViewCell.identifier)
        
        tableView.register(FeedPostHeaderTableViewCell.self, forCellReuseIdentifier: FeedPostHeaderTableViewCell.identifier)
        
        tableView.register(FeedPostActionsTableViewCell.self, forCellReuseIdentifier: FeedPostActionsTableViewCell.identifier)
        
        tableView.register(FeedPostGeneralTableViewCell.self, forCellReuseIdentifier: FeedPostGeneralTableViewCell.identifier)
        
        return tableView
    }()
    
    init(model: UserPost?){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        configureModels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureModels(){
        guard let userPostModel = self.model else{
            return
        }
    
        //header
        renderModel.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))
        
        //post
        renderModel.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))
        
        //action like
        renderModel.append(PostRenderViewModel(renderType: .actions(provider: "")))
        
        //comments
        var comments = [PostComment]()
        for x in 0..<2 {
            comments.append(
                PostComment(identifier: "123_\(x)",
                            username: "@whatever",
                            text: "Ats a post if i do say so myself",
                            createdDate: Date(),
                            likes: []))
        }
        renderModel.append(PostRenderViewModel(renderType: .comments(comments: comments)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

   

}

extension PostViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModel[section].renderType{
        case .actions(_): return 1
        case .comments(let comments): return comments.count > 2 ? 2 : comments.count
        case .primaryContent(_): return 1
        case .header(_): return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModel[indexPath.section]
        
        switch model.renderType{
        case .actions(let actions):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostActionsTableViewCell.identifier,
                                                     for: indexPath) as! FeedPostActionsTableViewCell
            return cell
        
        case .comments(let comments):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostGeneralTableViewCell.identifier,
                                                     for: indexPath) as! FeedPostGeneralTableViewCell
            return cell
        
        case .primaryContent(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostTableViewCell.identifier,
                                                     for: indexPath) as! FeedPostTableViewCell
            return cell
            
        case .header(let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostHeaderTableViewCell.identifier,
                                                     for: indexPath) as! FeedPostHeaderTableViewCell
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModel[indexPath.section]
        
        switch model.renderType{
        case .actions(_): return 60
           
        case .comments(_): return 50

        case .primaryContent(_): return tableView.width
            
        case .header(_): return 70
            
        }
    }
    
}
