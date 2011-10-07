class Quip < ActiveRecord::Base 
  def self.bump(id, direction)    
    quip  = load_quip_by_id id
    direction == :up ? quip.ranking += 1 : quip.ranking -=1
    quip.save   
    quip.ranking 
  end
  
  protected
  
  def self.load_quip_by_id(id)
   Quip.find(id)    
  end
  
end
