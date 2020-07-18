class ContractTypesController < InheritedResources::Base

  private

    def contract_type_params
      params.require(:contract_type).permit(:name, :short_name)
    end
end

