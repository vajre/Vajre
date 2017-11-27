function class(super, classname)
    local cls = {}
    cls.__cname = classname
    if super then
        cls.super = super
        setmetatable(cls, {__index = cls.super})
    end
    return cls
end
