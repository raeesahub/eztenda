class ContractsController < ApplicationController
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
  Customer : #{@contract.tender.business.name}
  Supplier : #{@contract.bid.user.name}
  </body>
</html>")

            # send the result and set HTTP response headers
            send_data pdf,
                      :type => "application/pdf",
                      :disposition => "attachment",
                      :filename => "result.pdf"
        rescue Pdfcrowd::Error => why
            # send the error in the HTTP response
            render plain: why.getMessage(), status: why.getCode()
        end
    end
end
