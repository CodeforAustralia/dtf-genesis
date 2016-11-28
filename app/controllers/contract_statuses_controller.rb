class ContractStatusesController < InheritedResources::Base

  private

    def contract_status_params
      params.require(:contract_status).permit(:name, :short_name)
    end
end

