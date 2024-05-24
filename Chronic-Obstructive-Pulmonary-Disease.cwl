cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  acute-chronic-obstructive-pulmonary-disease-copd---primary:
    run: acute-chronic-obstructive-pulmonary-disease-copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  chronic-obstructive-pulmonary-disease-copd-emphysema---primary:
    run: chronic-obstructive-pulmonary-disease-copd-emphysema---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: acute-chronic-obstructive-pulmonary-disease-copd---primary/output
  chronic-obstructive-pulmonary-disease-copd-bronchitis---primary:
    run: chronic-obstructive-pulmonary-disease-copd-bronchitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: chronic-obstructive-pulmonary-disease-copd-emphysema---primary/output
  mucopurulent-chronic-obstructive-pulmonary-disease-copd---primary:
    run: mucopurulent-chronic-obstructive-pulmonary-disease-copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: chronic-obstructive-pulmonary-disease-copd-bronchitis---primary/output
  bullous-chronic-obstructive-pulmonary-disease-copd---primary:
    run: bullous-chronic-obstructive-pulmonary-disease-copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: mucopurulent-chronic-obstructive-pulmonary-disease-copd---primary/output
  other-chronic-obstructive-pulmonary-disease-copd---primary:
    run: other-chronic-obstructive-pulmonary-disease-copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: bullous-chronic-obstructive-pulmonary-disease-copd---primary/output
  simple-chronic-obstructive-pulmonary-disease-copd---primary:
    run: simple-chronic-obstructive-pulmonary-disease-copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: other-chronic-obstructive-pulmonary-disease-copd---primary/output
  chronic-obstructive-pulmonary-disease-copd---primary:
    run: chronic-obstructive-pulmonary-disease-copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: simple-chronic-obstructive-pulmonary-disease-copd---primary/output
  chronic---primary:
    run: chronic---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: chronic-obstructive-pulmonary-disease-copd---primary/output
  cold-chronic-obstructive-pulmonary-disease-copd---primary:
    run: cold-chronic-obstructive-pulmonary-disease-copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: chronic---primary/output
  copd---primary:
    run: copd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: cold-chronic-obstructive-pulmonary-disease-copd---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: copd---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
