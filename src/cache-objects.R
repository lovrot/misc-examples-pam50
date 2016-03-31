unlink(list.files(path = "cache", pattern = "*", full.names = TRUE))
ProjectTemplate::reload.project(list(data_loading = TRUE, munging = TRUE))

ProjectTemplate::cache("varnamconv")
ProjectTemplate::cache("Nielsen10CCRTabS1")
ProjectTemplate::cache("mainz")
