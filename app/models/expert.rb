class Expert < User

    has_many :compaigns, dependent: :destroy
    
end
