With Ada.Unchecked_Deallocation;

package body listaPkg is
 
function IsEmpty(L: Lista) return Boolean is
begin
    return L = EmptyList;
end IsEmpty;

procedure Add(L: in out Lista; E: in Element) is
begin
    L := new Node'(Value => E, Next => L);
end Add;

function Read(L: Lista) return Element is 
begin 
    if IsEmpty(L) then 
        raise NoValue;
    end if;
    return L.Value;
end Read;

Procedure Free Is New Ada.Unchecked_Deallocation(Node, Lista);

procedure Remove(L: in out Lista) is
    K: Lista;
begin 
    if IsEmpty(L) then 
        raise NoValue;
    end if;
    K := L.Next;
    Free(L);
    L := K;
end Remove;


end listaPkg;