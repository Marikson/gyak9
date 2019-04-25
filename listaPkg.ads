Generic
    type Element is private;

package listaPkg is
    type Lista is limited private;

    NoValue: exception;
    
    function IsEmpty(L: Lista) return Boolean;
    procedure Add(L: in out Lista; E: in Element);
    function Read(L: Lista) return Element;
    procedure Remove(L: in out Lista);
private

    type Node;
    type Lista is access Node; 
    EmptyList: constant Lista := null;

    type Node is record
        Value: Element;
        Next: Lista := EmptyList;
    end record;

end listaPkg;