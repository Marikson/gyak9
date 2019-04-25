package body listaPkg is 

function IsEmpty(L: Lista) return Boolean is
begin
    return L = EmptyList;
end IsEmpty;


function Add(L: Lista; E: Element) return Lista is
begin
    return new Node'(Value => E, Next => L);
end Add;

function Read(L: Lista) return Element is 
begin 
    if IsEmpty(L) then 
        raise NoValue;
    end if;
    return L.Value;
end Read;


end listaPkg;