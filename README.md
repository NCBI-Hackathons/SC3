# Amelia!

![Amelia Earhart](https://github.com/NCBI-Hackathons/Amelia/blob/master/Amelia_Earhart_standing_under_nose_of_her_Lockheed_Model_10-E_Electra%2C_small.jpg)

Several diseases have been linked to mutations, however not all individuals with the disease-causing mutation exhibit signs of disease pathology.  Thus, the paradigm is not as simple as a mutation will cause disease but depends upon an array of factors.  This can include gene expression levels, homozygosity/heterozygosity, and compensatory mutations.  We propose that individuals containing disease-causing mutations that do not exhibit disease pathology may have SNPs that can compensate for the potentially harmful effects of the mutation.  To this end, we develop a novel tool SNPX, that can, given a series of series of disease-causing SNPS, can SNPs that can compensatory SNPs.  We show examples in <enter the diseases>.  While rather simple, this can offer insight into elucidating disease mechanisms and guide future research in order to identify therapeutic targets. An example workflow is shown as below.  
  
![Workflow Diagram](https://github.com/NCBI-Hackathons/Amelia/workflow.image.tiff)

Initially a disease for which gene expression data is available is selected.  As an example, we select the diabetes cohort from SRA.  RNASeq data from diabetes and control patients is extracted.  In addition, we select a set of genes pertaining to a disease-causing mutation of interest.  We select cystic fibrosis causing SNPs from ClinVar that are extracted using routines written in Python. We hope that this will provide additional insight onto the links between cystic fibrosis and diabetes.  
