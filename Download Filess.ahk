MsgBox File is Downloading By ROOT44
downloadFile("url")

downloadFile(url, dir := "C:\Downloads\", fileName := "") {
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", url, true)
	whr.Send()
	whr.WaitForResponse()

	; by j0nny(ROOT44)
	body := whr.ResponseBody
	data := NumGet(ComObjValue(body) + 8 + A_PtrSize, "UInt")
	size := body.MaxIndex() + 1

	if !InStr(FileExist(dir), "D")
		FileCreateDir % dir

	SplitPath url, urlFileName
	f := FileOpen(dir (fileName ? fileName : urlFileName), "w")
	f.RawWrite(data + 0, size)
	f.Close()
}
