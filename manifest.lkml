project_name: "cortex-test"

remote_dependency: cortex {
  url: "https://github.com/looker-open-source/block-cortex-sap"
  ref: "main"

  override_constant: CONNECTION_NAME {
    value: "...connection-name"
  }

  override_constant: GCP_PROJECT {
    value: "...gcp-project"
  }

  override_constant: REPORTING_DATASET {
    value: "...reporting-dataset"
  }

  override_constant: CLIENT {
    value: "...client"
  }
}
