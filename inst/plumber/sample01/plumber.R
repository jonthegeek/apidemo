#* @get /predict/<file_id>
#* @param file_id:string ID or name of the RDS file
function(res, req, file_id) {
  if (file_id == "die") {
    stop_forbidden(file_id)
  }
  if (file_id == "stop") {
    stop("Normal R error.")
  }
  return("Success, File Found.")
}
