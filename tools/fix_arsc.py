import zipfile
src = zipfile.ZipFile("keymouse-unsigned.apk")
out = zipfile.ZipFile("keymouse-fixed.apk", "w")
for i in src.infolist():
    t = zipfile.ZIP_STORED if i.filename == "resources.arsc" else zipfile.ZIP_DEFLATED
    out.writestr(zipfile.ZipInfo(i.filename, (2026, 11, 11, 0, 0, 0)), src.read(i.filename), compress_type=t)
out.close()
