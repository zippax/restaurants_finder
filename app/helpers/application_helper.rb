module ApplicationHelper
  # autocomplete OFF
  def text_field(*args)
     unless args.last.kind_of?(Hash) then
      args << {}
     end
 
     args.last[:autocomplete] = 'off' \
         unless args.last[:autocomplete]
     super(*args)
   end
   # autocomplete OFF -- END
end
