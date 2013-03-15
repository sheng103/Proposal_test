class ProposalViewerController < ApplicationController
  
  def show
        proposal = Proposal.find(params[:id])
    page = "public/proposal-template/index.html"
    
    options = Hash.new
    
    options[:html] = page
    client_name = proposal.client.name
    client_company = proposal.client.company
    section_header = proposal.proposal_sections[0].name
    proposal_name = proposal.name
    proposal_send_date = proposal.send_date
    proposal_user_name = proposal.user_name
    
    options[:tags] = [
                    ['h1', 1, client_name], ['h1', 2, client_company], ['h1', 3, section_header],
                    ['h2', 1, proposal_name],
                    ['td', 1, proposal_send_date],
                    ['span', 1, proposal_user_name], ['span', 2, client_name]]
    
    client_website = proposal.client.website
    section_content = proposal.proposal_sections[0].description
    options[:divs] = [
                    ['div#cover-content.cover-background-main div#cover-footer div.cover-footer-image div#my_company div', client_website],
                    ['div#proposal-content div#proposal_section div', section_content]]                    
                                                                                                                         
    change_content(options)
    @completed_proposal = options[:html]  
  end
  
end
