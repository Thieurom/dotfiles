local status_ok, xcodebuild = pcall(require, "xcodebuild")
if not status_ok then
    return
end

xcodebuild.setup()
