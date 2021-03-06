LoadWaitSec = LoadWaitSec or class("LoadWaitSec",function()
    return cc.Node:create()
end)

function LoadWaitSec:ctor()
    self.winSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self:init()
end

function LoadWaitSec:init()
    self._csb = cc.CSLoader:getInstance():createNodeWithFlatBuffersFile("dxyCocosStudio/csd/ui/commonUI/LoadWaitSec.csb")
    self:addChild(self._csb)

    local posX = (self.origin.x + self.winSize.width / 2) + self._posx
    local posY = (self.origin.y + self.winSize.height / 2) + self._posy
    self._csb:setPosition(posX, posY)

    self._tl = cc.CSLoader:createTimeline("dxyCocosStudio/csd/ui/commonUI/LoadWaitSec.csb")
    self._csb:runAction(self._tl)
    self._tl:gotoFrameAndPlay(0,true)
end

function LoadWaitSec:show(posx,posy)
    if self._isShowing then
        LoadWaitSec:close()
    end
    self._isShowing = true
    self._posx = posx == nil and 0 or posx
    self._posy = posy == nil and 0 or posy
    self._layer = LoadWaitSec.new()
    SceneManager:getCurrentScene():addChild(self._layer) 
end

function LoadWaitSec:close()
    if self._isShowing then
        self._isShowing = false
        self._layer:removeFromParent()
    end
end