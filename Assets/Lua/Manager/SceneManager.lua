local LoginScene = require "Scene.LoginScene"

SceneManager = {}
local this = SceneManager

function SceneManager.Init()
    SceneManager["LoginScene"] = LoginScene
end

function SceneManager.LoadScene(sceneName)
    SceneManager["LoginScene"].StartLoad()
end

function SceneManager.LoadSceneAsync(sceneName) 
    SceneManager["LoginScene"].BeginLoadAsync()
end