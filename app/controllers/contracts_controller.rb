class ContractsController < ApplicationController
  def index
    @contracts = []
    @user = current_user
    if @user.user_type == "bar"
      tender_arrray = Business.where(user_id: current_user.id).map(&:tenders).flatten
      tender_arrray.each do |tender|
        @contracts << tender.contract
      end
    end
    if @user.user_type == "vendor"
      bid_array = Bid.where(user_id: current_user.id)
      bid_array.each do |bid|
        @contracts << Contract.where(id: bid.contract_id)
      end
    end
    @contracts = @contracts.flatten
    return @contracts
  end

  def download
    # the recommended method is POST
    @contract = Contract.find(params[:id])
    p @contract
    # may be restricted by ":via => :post" in your routes.rb
    begin
      # create the API client instance
      client = Pdfcrowd::HtmlToPdfClient.new("demo", "ce544b6ea52a5621fb9d55f8b542d14d")

      # run the conversion and store the result into the "pdf" variable
      pdf = client.convertString("<html>
  <body>
  Contract
  Customer : #{@contract.tender.business.user.legal_name}
  Supplier : #{@contract.bid.user.legal_name}
  </body>
</html>")

      # send the result and set HTTP response headers
      send_data pdf,
                type: "application/pdf",
                disposition: "attachment",
                filename: "contract_#{@contract.id}.pdf"
    rescue Pdfcrowd::Error => e
      # send the error in the HTTP response
      render plain: e.getMessage, status: e.getCode
    end
  end
end
