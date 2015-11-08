## Author(s):
## John Lövrot (orcid.org/0000-0002-9339-8059)
##
## License: CC BY 4.0
## https://creativecommons.org/licenses/by/4.0/

unlink(list.files(path="cache", pattern="*", full.names=TRUE))  # clear cache
options(download.file.method="libcurl")
ProjectTemplate::reload.project(list(data_loading=TRUE, munging=TRUE))

ProjectTemplate::cache("varnamconv")
ProjectTemplate::cache("Nielsen10CCRTabS1")
ProjectTemplate::cache("mainz")
