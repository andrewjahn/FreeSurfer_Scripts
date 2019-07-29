#!/bin/tcsh
  
setenv study $argv[1]
  
foreach meas (thickness volume)

  foreach hemi (lh rh)
    
    foreach smoothness (10)
      
      foreach dir ({$hemi}.{$meas}.{$study}.{$smoothness}.glmdir)
        
          mri_glmfit-sim \
          --glmdir {$dir} \
          --cache 1.3 pos \ #Change the vertex-wise threshold from 1.3 to 3.0 to maintain a 5% false positive rate. Also change "pos" to "abs" if you do not have an a priori hypothesis about the direction of your result
          --cwp 0.05  \
          --2spaces
            
      end
        
    end
      
  end
    
end
